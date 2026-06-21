import torch


def lane_keeping_guidance_fn(x, t, cond, inputs, scale=1.0, threshold=0.3, boundary_scale=3.0, out_debug=None, **kwargs):
    """
    Lane keeping guidance: penalizes the ego trajectory for deviating from the
    centerline of the current driving lane.

    For each ego trajectory timestep, finds the nearest route centerline point
    and computes the lateral offset; energy increases as the trajectory
    approaches the lane boundary.

    Gradient flow:
        ego_traj (from x) → ego_to_center (vector from ego to nearest centerline point) → lateral_dist → penalty → energy
        Route data is detached and used only as a reference (no gradient flows through it).
        Nearest point selection uses argmin (non-differentiable), but the lateral
        distance computation itself is differentiable w.r.t. ego_traj.

    Args:
        x: [B, P, T+1, 4] denormalized (x, y, cos_h, sin_h) in ego-centric frame
        t: diffusion timestep (scalar)
        cond: unused
        inputs: dict containing:
            - 'route_lanes': [B, R, L, 12] where R=25 segments, L=20 points
              Feature dims: [0:2]=center_xy, [2:4]=direction, [4:6]=left_offset, [6:8]=right_offset
        scale: energy multiplier (configurable per-guidance)
        threshold: lateral ratio (0=center, 1=boundary) beyond which penalty starts

    Returns:
        energy: [B] negative penalty (to be maximized → minimizes deviation)
    """
    B, P, T_plus_1, _ = x.shape

    # Time gating: activate only during late denoising steps (same as collision guidance)
    mask_diffusion_time = (t < 0.1 and t > 0.005)
    x = torch.where(mask_diffusion_time, x, x.detach())

    # Normalize heading vectors (heading is detached; only position is guided)
    x = torch.cat([
        x[:, :, :, :2],
        x[:, :, :, 2:].detach() / (torch.norm(x[:, :, :, 2:].detach(), dim=-1, keepdim=True) + 1e-6)
    ], dim=-1)

    # Ego future trajectory: [B, T, 2]
    ego_traj = x[:, 0, 1:, :2]
    T = ego_traj.shape[1]

    # Route lanes (detached — reference data, not an optimization target)
    route_lanes = inputs["route_lanes"].detach()  # [B, R, L, 12]
    route_center = route_lanes[:, :, :, 0:2]       # centerline (x, y)
    route_dir    = route_lanes[:, :, :, 2:4]        # direction vector
    route_left   = route_lanes[:, :, :, 4:6]        # centerline → left boundary offset
    route_right  = route_lanes[:, :, :, 6:8]        # centerline → right boundary offset

    # Flatten route points: [B, N, 2] (N = R * L)
    route_center_flat = route_center.reshape(B, -1, 2)
    route_dir_flat    = route_dir.reshape(B, -1, 2)
    route_left_flat   = route_left.reshape(B, -1, 2)
    route_right_flat  = route_right.reshape(B, -1, 2)

    # Filter out zero-padded route points
    valid = route_center_flat.abs().sum(-1) > 1e-3  # [B, N]

    if not valid.any():
        return torch.zeros(B, device=x.device)

    # Find nearest route centerline point for each ego point
    # argmin is non-differentiable, so performed on detached ego positions
    diff = ego_traj.detach()[:, :, None, :] - route_center_flat[:, None, :, :]  # [B, T, N, 2]
    dist_sq = (diff ** 2).sum(-1)  # [B, T, N]
    dist_sq = dist_sq + (~valid[:, None, :]).float() * 1e10  # mask invalid points
    nearest_idx = dist_sq.argmin(-1)  # [B, T]

    # Gather route info corresponding to each ego timestep
    idx2 = nearest_idx.unsqueeze(-1).expand(-1, -1, 2)  # [B, T, 2]
    n_center = torch.gather(route_center_flat, 1, idx2)   # [B, T, 2]
    n_dir    = torch.gather(route_dir_flat,    1, idx2)    # [B, T, 2]
    n_left   = torch.gather(route_left_flat,   1, idx2)    # [B, T, 2]
    n_right  = torch.gather(route_right_flat,  1, idx2)    # [B, T, 2]

    # Perpendicular vector: rotate direction 90° CCW → (-dy, dx)
    dir_norm = n_dir / (n_dir.norm(dim=-1, keepdim=True) + 1e-6)
    perp = torch.stack([-dir_norm[..., 1], dir_norm[..., 0]], dim=-1)  # [B, T, 2]

    # Signed lateral distance (lateral offset from ego to centerline)
    # Differentiable w.r.t. ego_traj — gradient flows through here
    ego_to_center = ego_traj - n_center  # [B, T, 2]
    lateral_dist = (ego_to_center * perp).sum(-1)  # [B, T]

    # Lane half-width: project boundary offset onto perpendicular direction
    left_hw  = (n_left  * perp).sum(-1).abs()   # [B, T]
    right_hw = (n_right * perp).sum(-1).abs()  # [B, T]

    # Select appropriate half-width based on lateral distance sign
    half_w = torch.where(lateral_dist >= 0, left_hw, right_hw)
    half_w = torch.clamp(half_w, min=0.5)  # min 0.5m to prevent division by zero

    # Normalized lateral ratio: 0 = lane center, 1 = lane boundary
    lateral_ratio = lateral_dist.abs() / half_w  # [B, T]

    # Smooth quadratic penalty: squared penalty when exceeding threshold
    excess = torch.clamp(lateral_ratio - threshold, min=0.0)
    penalty = (excess ** 2).sum(dim=-1)  # [B]

    # Boundary penalty: additional penalty for crossing the lane boundary (ratio > 1.0)
    out_of_lane = torch.clamp(lateral_ratio - 1.0, min=0.0)
    boundary_penalty = (out_of_lane ** 2).sum(dim=-1)  # [B]

    # Return negative energy (gradient ascent → drives trajectory toward minimizing penalty)
    return -scale * penalty - boundary_scale * boundary_penalty
