#!/usr/bin/env python3
'''
  @file         pluto_algorithm.py
  @brief        Pluto model algorithm adapter for CarMaker-ROS interface
  @authors      Seungji Ryu (seungjiryu@hanyang.ac.kr)
'''
import logging
import math
import os
from collections import OrderedDict
from typing import Tuple

import numpy as np
import torch
import rospy
import std_msgs.msg as std_msgs
import autohyu_msgs.msg as autohyu_msgs

from interface_python.interface_objects import ObjectClass, TrafficLightColor
from pluto.pluto_model import PlutoPlanningModel


# ─── Object classification ────────────────────────────────────────────────────
CATEGORY_EGO     = 0
CATEGORY_VEHICLE = 1
CATEGORY_PED     = 2
CATEGORY_BICYCLE = 3

# Traffic light status mapping
TL_UNKNOWN = 0
TL_GREEN   = 1
TL_YELLOW  = 2
TL_RED     = 3

POLYGON_LANE = 0
POLYGON_LANE_CONNECTOR = 1
POLYGON_CROSSWALK = 2


def _wrap_to_pi(angle):
    return (angle + np.pi) % (2.0 * np.pi) - np.pi


def _interpolate_polyline(points: np.ndarray, num_points: int) -> np.ndarray:
    """Resample a polyline to have exactly num_points via linear interpolation."""
    if len(points) == 0:
        return np.zeros((num_points, points.shape[-1]), dtype=np.float64)
    if len(points) == 1:
        return np.tile(points[0], (num_points, 1))
    diff = np.diff(points, axis=0)
    dist = np.linalg.norm(diff, axis=-1)
    cum_dist = np.concatenate([[0], np.cumsum(dist)])
    total = cum_dist[-1]
    if total < 1e-6:
        return np.tile(points[0], (num_points, 1))
    target = np.linspace(0, total, num_points)
    out = np.zeros((num_points, points.shape[-1]), dtype=np.float64)
    for d in range(points.shape[-1]):
        out[:, d] = np.interp(target, cum_dist, points[:, d])
    return out


def normalize_data(data: dict, history_steps: int = 21, radius: float = 100.0) -> dict:
    """
    Convert all map/agent features from global frame to ego-centric frame.
    Mirrors PlutoFeature.normalize() from the original codebase.
    """
    cur_state = data["current_state"]
    center_xy = cur_state[:2].copy()
    center_angle = float(cur_state[2])

    cos_a = np.cos(center_angle)
    sin_a = np.sin(center_angle)
    rot = np.array([[cos_a, -sin_a], [sin_a, cos_a]], dtype=np.float64)

    data["current_state"][:3] = 0.0

    # agents
    data["agent"]["position"] = np.matmul(data["agent"]["position"] - center_xy, rot)
    data["agent"]["velocity"] = np.matmul(data["agent"]["velocity"], rot)
    data["agent"]["heading"]  = _wrap_to_pi(data["agent"]["heading"] - center_angle)

    # map
    data["map"]["point_position"]    = np.matmul(data["map"]["point_position"] - center_xy, rot)
    data["map"]["point_vector"]      = np.matmul(data["map"]["point_vector"], rot)
    data["map"]["point_orientation"] = _wrap_to_pi(data["map"]["point_orientation"] - center_angle)
    data["map"]["polygon_center"][..., :2] = np.matmul(
        data["map"]["polygon_center"][..., :2] - center_xy, rot
    )
    data["map"]["polygon_center"][..., 2] = _wrap_to_pi(
        data["map"]["polygon_center"][..., 2] - center_angle
    )
    data["map"]["polygon_position"]    = np.matmul(data["map"]["polygon_position"] - center_xy, rot)
    data["map"]["polygon_orientation"] = _wrap_to_pi(data["map"]["polygon_orientation"] - center_angle)

    # static objects
    if "static_objects" in data and data["static_objects"]["position"].shape[0] > 0:
        data["static_objects"]["position"] = np.matmul(
            data["static_objects"]["position"] - center_xy, rot
        )
        data["static_objects"]["heading"] = _wrap_to_pi(
            data["static_objects"]["heading"] - center_angle
        )

    # reference lines
    if "reference_line" in data and data["reference_line"]["position"].shape[0] > 0:
        data["reference_line"]["position"] = np.matmul(
            data["reference_line"]["position"] - center_xy, rot
        )
        data["reference_line"]["vector"] = np.matmul(data["reference_line"]["vector"], rot)
        data["reference_line"]["orientation"] = _wrap_to_pi(
            data["reference_line"]["orientation"] - center_angle
        )

    # agent target (relative displacement, for model internal use)
    T_hist = history_steps
    target_pos = (
        data["agent"]["position"][:, T_hist:]
        - data["agent"]["position"][:, T_hist - 1][:, None]
    )
    target_hdg = (
        data["agent"]["heading"][:, T_hist:]
        - data["agent"]["heading"][:, T_hist - 1][:, None]
    )
    target = np.concatenate([target_pos, target_hdg[..., None]], axis=-1)
    target[~data["agent"]["valid_mask"][:, T_hist:]] = 0.0
    data["agent"]["target"] = target

    # filter map by radius
    pt_pos = data["map"]["point_position"]
    x_valid = (pt_pos[:, 0, :, 0] > -radius) & (pt_pos[:, 0, :, 0] < radius)
    y_valid = (pt_pos[:, 0, :, 1] > -radius) & (pt_pos[:, 0, :, 1] < radius)
    valid_pts = x_valid & y_valid
    valid_polygon = valid_pts.any(-1)

    data["map"]["valid_mask"]              = valid_pts[valid_polygon]
    data["map"]["point_position"]          = pt_pos[valid_polygon]
    data["map"]["point_vector"]            = data["map"]["point_vector"][valid_polygon]
    data["map"]["point_orientation"]       = data["map"]["point_orientation"][valid_polygon]
    data["map"]["point_side"]              = data["map"]["point_side"][valid_polygon]
    data["map"]["polygon_center"]          = data["map"]["polygon_center"][valid_polygon]
    data["map"]["polygon_position"]        = data["map"]["polygon_position"][valid_polygon]
    data["map"]["polygon_orientation"]     = data["map"]["polygon_orientation"][valid_polygon]
    data["map"]["polygon_type"]            = data["map"]["polygon_type"][valid_polygon]
    data["map"]["polygon_on_route"]        = data["map"]["polygon_on_route"][valid_polygon]
    data["map"]["polygon_tl_status"]       = data["map"]["polygon_tl_status"][valid_polygon]
    data["map"]["polygon_has_speed_limit"] = data["map"]["polygon_has_speed_limit"][valid_polygon]
    data["map"]["polygon_speed_limit"]     = data["map"]["polygon_speed_limit"][valid_polygon]
    data["map"]["polygon_road_block_id"]   = data["map"]["polygon_road_block_id"][valid_polygon]

    return data


def _to_tensor(x, device, dtype=torch.float32):
    if isinstance(x, np.ndarray):
        return torch.from_numpy(x).to(dtype=dtype, device=device)
    return x.to(dtype=dtype, device=device)


def batch_data(data: dict, device: torch.device) -> dict:
    """Convert numpy data dict to batched (bs=1) tensors."""
    out = {}
    for key, val in data.items():
        if isinstance(val, dict):
            out[key] = {}
            for k2, v2 in val.items():
                if isinstance(v2, np.ndarray):
                    if v2.dtype == np.bool_:
                        out[key][k2] = torch.from_numpy(v2).unsqueeze(0).to(device=device)
                    else:
                        out[key][k2] = _to_tensor(v2, device).unsqueeze(0)
                else:
                    out[key][k2] = v2
        elif isinstance(val, np.ndarray):
            if val.dtype == np.bool_:
                out[key] = torch.from_numpy(val).unsqueeze(0).to(device=device)
            else:
                out[key] = _to_tensor(val, device).unsqueeze(0)
        else:
            out[key] = val
    return out


class PlutoAlgorithm:
    """
    Adapts PlanningSpace ROS message to Pluto model input/output.
    """

    def __init__(self, cfg: dict, checkpoint_path: str) -> None:
        self._logger = logging.getLogger(self.__class__.__name__)

        self.dt            = float(cfg.get("dt", 0.1))
        self.history_steps = int(cfg.get("history_steps", 21))
        self.future_steps  = int(cfg.get("future_steps", 80))
        self.radius        = float(cfg.get("radius", 100.0))
        self.sample_points = 20

        device_str = str(cfg.get("device", "cuda:0"))
        if device_str.startswith("cuda") and not torch.cuda.is_available():
            self._logger.warning("CUDA not available, falling back to CPU")
            device_str = "cpu"
        self.device = torch.device(device_str)

        model_kwargs = {
            "dim":             int(cfg.get("dim", 128)),
            "state_channel":   int(cfg.get("state_channel", 6)),
            "polygon_channel": int(cfg.get("polygon_channel", 6)),
            "history_channel": int(cfg.get("history_channel", 9)),
            "history_steps":   self.history_steps,
            "future_steps":    self.future_steps,
            "encoder_depth":   int(cfg.get("encoder_depth", 4)),
            "decoder_depth":   int(cfg.get("decoder_depth", 4)),
            "num_heads":       int(cfg.get("num_heads", 8)),
            "num_modes":       int(cfg.get("num_modes", 6)),
            "ref_free_traj":   bool(cfg.get("ref_free_traj", True)),
        }
        self.model = PlutoPlanningModel(**model_kwargs)
        self.model = self._load_checkpoint(self.model, checkpoint_path)
        self.model.to(self.device)
        self.model.eval()

    def UpdateConfig(self, cfg: dict):
        self.dt = float(cfg.get("dt", self.dt))

    # ─── Three-stage pipeline ──────────────────────────────────────────────

    def RunPreprocess(self, planning_space) -> Tuple[dict, dict]:
        raw_data = self._parse_planning_space(planning_space)
        ego_xy_global  = raw_data["_ego_xy_global"]
        ego_hdg_global = raw_data["_ego_hdg_global"]
        del raw_data["_ego_xy_global"]
        del raw_data["_ego_hdg_global"]

        norm_data = normalize_data(raw_data, self.history_steps, self.radius)
        tensor_data = batch_data(norm_data, self.device)

        preprocess_meta = {
            "ego_xy_global":  ego_xy_global,
            "ego_hdg_global": ego_hdg_global,
        }
        return tensor_data, preprocess_meta

    def RunAlgorithm(self, tensor_data: dict) -> dict:
        with torch.no_grad():
            out = self.model(tensor_data)
        return out

    def RunPostprocess(
        self,
        model_out: dict,
        planning_space,
        preprocess_meta: dict,
    ) -> Tuple[autohyu_msgs.Trajectory, autohyu_msgs.PredictObjects]:
        ego_xy  = preprocess_meta["ego_xy_global"]
        ego_hdg = preprocess_meta["ego_hdg_global"]

        traj_ego = model_out["output_trajectory"][0].cpu().numpy().astype(np.float64)  # (T, 3)

        # ego-centric → global
        cos_h = np.cos(ego_hdg)
        sin_h = np.sin(ego_hdg)
        rot_inv = np.array([[cos_h, sin_h], [-sin_h, cos_h]], dtype=np.float64)
        traj_global_xy  = traj_ego[:, :2] @ rot_inv + ego_xy
        traj_global_hdg = _wrap_to_pi(traj_ego[:, 2] + ego_hdg)

        dt = self.dt
        dx = np.diff(traj_global_xy[:, 0], prepend=traj_global_xy[0, 0])
        dy = np.diff(traj_global_xy[:, 1], prepend=traj_global_xy[0, 1])
        vx = dx / dt
        vy = dy / dt

        delay_sec = max((rospy.Time.now() - planning_space.header.stamp).to_sec(), 0.0)
        base_stamp = planning_space.header.stamp + rospy.Duration(delay_sec)

        o_traj = autohyu_msgs.Trajectory()
        o_traj.header = std_msgs.Header()
        o_traj.header.seq      = planning_space.header.seq
        o_traj.header.frame_id = planning_space.header.frame_id
        o_traj.header.stamp    = base_stamp

        prev_speed = 0.0
        cum_dist   = 0.0
        prev_x, prev_y = traj_global_xy[0]

        for i in range(len(traj_global_xy)):
            x, y  = traj_global_xy[i]
            yaw   = traj_global_hdg[i]
            speed = math.sqrt(float(vx[i]) ** 2 + float(vy[i]) ** 2)
            if i > 0:
                cum_dist += math.hypot(x - prev_x, y - prev_y)
            accel = (speed - prev_speed) / dt if i > 0 else 0.0

            pt = autohyu_msgs.TrajectoryPoint()
            pt.time         = dt * i
            pt.distance     = float(cum_dist)
            pt.x            = float(x)
            pt.y            = float(y)
            pt.z            = 0.0
            pt.yaw          = float(yaw)
            pt.curvature    = 0.0
            pt.speed        = float(speed)
            pt.acceleration = float(accel)
            o_traj.point.append(pt)

            prev_x, prev_y = x, y
            prev_speed = speed

        o_pred = autohyu_msgs.PredictObjects()
        o_pred.header = o_traj.header

        return o_traj, o_pred

    # ─── Parsing ──────────────────────────────────────────────────────────

    def _parse_planning_space(self, planning_space) -> dict:
        T_hist = self.history_steps
        T_full = T_hist + self.future_steps

        # ── Ego ──────────────────────────────────────────────────────────
        ego_states = planning_space.ego.state
        latest = ego_states[-1]
        ego_hdg = float(latest.heading)
        vx_g, vy_g = float(latest.vx), float(latest.vy)
        vx_long = vx_g * math.cos(ego_hdg) + vy_g * math.sin(ego_hdg)
        ax_g, ay_g = float(latest.ax), float(latest.ay)
        ax_long = ax_g * math.cos(ego_hdg) + ay_g * math.sin(ego_hdg)
        current_state = np.array(
            [latest.x, latest.y, ego_hdg, vx_long, ax_long,
             float(latest.steering), float(latest.yaw_rate)],
            dtype=np.float64,
        )

        ego_pos     = np.zeros((T_hist, 2), dtype=np.float64)
        ego_hdg_arr = np.zeros(T_hist, dtype=np.float64)
        ego_vel     = np.zeros((T_hist, 2), dtype=np.float64)
        ego_shape   = np.tile([2.297, 5.176], (T_hist, 1))  # Pacifica width, length
        ego_valid   = np.zeros(T_full, dtype=np.bool_)

        for t_rev, s in enumerate(reversed(ego_states)):
            t = T_hist - 1 - t_rev
            if t < 0:
                break
            ego_pos[t]     = [s.x, s.y]
            ego_hdg_arr[t] = s.heading
            ego_vel[t]     = [s.vx, s.vy]
            ego_valid[t]   = True

        # ── Dynamic agents ────────────────────────────────────────────────
        dynamic_objs = [
            o for o in planning_space.objects
            if o.classification not in (ObjectClass.BARRIER, ObjectClass.UNKNOWN)
        ]

        N = len(dynamic_objs)
        ag_pos   = np.zeros((N, T_hist, 2), dtype=np.float64)
        ag_hdg   = np.zeros((N, T_hist), dtype=np.float64)
        ag_vel   = np.zeros((N, T_hist, 2), dtype=np.float64)
        ag_shape = np.zeros((N, T_hist, 2), dtype=np.float64)
        ag_valid = np.zeros((N, T_full), dtype=np.bool_)
        ag_cat   = np.zeros(N, dtype=np.int8)

        for i, obj in enumerate(dynamic_objs):
            cls = obj.classification
            if cls == ObjectClass.PEDESTRIAN:
                ag_cat[i] = CATEGORY_PED
                w, l = 0.9, 0.9
            elif cls in (ObjectClass.BICYCLE, ObjectClass.MOTORCYCLE):
                ag_cat[i] = CATEGORY_BICYCLE
                w, l = obj.width, obj.length
            else:
                ag_cat[i] = CATEGORY_VEHICLE
                w, l = obj.width, obj.length

            for t_rev, s in enumerate(reversed(obj.state)):
                t = T_hist - 1 - t_rev
                if t < 0:
                    break
                ag_pos[i, t]   = [s.x, s.y]
                ag_hdg[i, t]   = s.heading
                ag_vel[i, t]   = [s.vx, s.vy]
                ag_shape[i, t] = [w, l]
                ag_valid[i, t] = True

        all_pos   = np.concatenate([ego_pos[None], ag_pos],   axis=0)
        all_hdg   = np.concatenate([ego_hdg_arr[None], ag_hdg], axis=0)
        all_vel   = np.concatenate([ego_vel[None], ag_vel],   axis=0)
        all_shape = np.concatenate([ego_shape[None], ag_shape], axis=0)
        all_valid = np.concatenate([ego_valid[None], ag_valid], axis=0)
        all_cat   = np.concatenate([[CATEGORY_EGO], ag_cat],  axis=0)

        agent_data = {
            "position":   all_pos,
            "heading":    all_hdg,
            "velocity":   all_vel,
            "shape":      all_shape,
            "valid_mask": all_valid,
            "category":   all_cat.astype(np.int8),
        }

        # ── Map (lanes as polygons) ───────────────────────────────────────
        lanes = planning_space.lanes
        M = len(lanes)
        P = self.sample_points

        pt_pos        = np.zeros((M, 3, P, 2), dtype=np.float64)
        pt_vec        = np.zeros((M, 3, P, 2), dtype=np.float64)
        pt_ori        = np.zeros((M, 3, P),    dtype=np.float64)
        pt_side       = np.tile(np.arange(3), (M, 1)).astype(np.int8)
        poly_ctr      = np.zeros((M, 3),       dtype=np.float64)
        poly_pos      = np.zeros((M, 2),       dtype=np.float64)
        poly_ori      = np.zeros(M,            dtype=np.float64)
        poly_type     = np.zeros(M,            dtype=np.int8)
        poly_on_route = np.zeros(M,            dtype=np.bool_)
        poly_tl       = np.zeros(M,            dtype=np.int8)
        poly_has_sl   = np.ones(M,             dtype=np.bool_)
        poly_sl       = np.full(M, 50.0 / 3.6, dtype=np.float64)
        poly_rb       = np.zeros(M,            dtype=np.int32)

        for i, lane in enumerate(lanes):
            cl = np.array([[p.x, p.y] for p in lane.point],          dtype=np.float64)
            lb = np.array([[p.x, p.y] for p in lane.left_boundary],  dtype=np.float64)
            rb = np.array([[p.x, p.y] for p in lane.right_boundary], dtype=np.float64)

            cl_s = _interpolate_polyline(cl, P + 1)
            lb_s = _interpolate_polyline(lb, P + 1)
            rb_s = _interpolate_polyline(rb, P + 1)

            for side_idx, pts in enumerate([cl_s, lb_s, rb_s]):
                pt_pos[i, side_idx] = pts[:P]
                vec = pts[1:] - pts[:-1]
                pt_vec[i, side_idx] = vec[:P]
                pt_ori[i, side_idx] = np.arctan2(vec[:P, 1], vec[:P, 0])

            mid = P // 2
            poly_ctr[i] = [cl_s[mid, 0], cl_s[mid, 1], pt_ori[i, 0, mid]]
            poly_pos[i] = cl_s[0]
            poly_ori[i] = pt_ori[i, 0, 0]

            tl_color = lane.traffic_light_color
            if tl_color == TrafficLightColor.GREEN:
                poly_tl[i] = TL_GREEN
            elif tl_color == TrafficLightColor.YELLOW:
                poly_tl[i] = TL_YELLOW
            elif tl_color in (TrafficLightColor.RED, TrafficLightColor.RED_YELLOW):
                poly_tl[i] = TL_RED
            else:
                poly_tl[i] = TL_UNKNOWN

        map_data = {
            "point_position":          pt_pos,
            "point_vector":            pt_vec,
            "point_orientation":       pt_ori,
            "point_side":              pt_side,
            "polygon_center":          poly_ctr,
            "polygon_position":        poly_pos,
            "polygon_orientation":     poly_ori,
            "polygon_type":            poly_type,
            "polygon_on_route":        poly_on_route,
            "polygon_tl_status":       poly_tl,
            "polygon_has_speed_limit": poly_has_sl,
            "polygon_speed_limit":     poly_sl,
            "polygon_road_block_id":   poly_rb,
            "valid_mask":              np.ones((M, P), dtype=np.bool_),
        }

        # ── Reference lines ───────────────────────────────────────────────
        ref_data = self._build_reference_lines(planning_space.routes)

        # ── Static objects ────────────────────────────────────────────────
        static_objs = [
            o for o in planning_space.objects
            if o.classification in (ObjectClass.BARRIER, ObjectClass.UNKNOWN)
        ]
        S = len(static_objs)
        n = max(S, 1)
        so_pos   = np.zeros((n, 2), dtype=np.float64)
        so_hdg   = np.zeros(n,      dtype=np.float64)
        so_shape = np.zeros((n, 2), dtype=np.float64)
        so_cat   = np.zeros(n,      dtype=np.int8)
        so_valid = np.zeros(n,      dtype=np.bool_)

        for j, obj in enumerate(static_objs):
            s = obj.state[-1]
            so_pos[j]   = [s.x, s.y]
            so_hdg[j]   = s.heading
            so_shape[j] = [obj.width, obj.length]
            so_cat[j]   = 1 if obj.classification == ObjectClass.BARRIER else 3
            so_valid[j] = True

        static_data = {
            "position":   so_pos,
            "heading":    so_hdg,
            "shape":      so_shape,
            "category":   so_cat.astype(np.int8),
            "valid_mask": so_valid,
        }

        data = {
            "current_state":  current_state,
            "agent":          agent_data,
            "map":            map_data,
            "reference_line": ref_data,
            "static_objects": static_data,
            "_ego_xy_global":  np.array([latest.x, latest.y], dtype=np.float64),
            "_ego_hdg_global": ego_hdg,
        }
        return data

    def _build_reference_lines(self, routes) -> dict:
        """Convert route segments to Pluto reference_line format."""
        if len(routes) == 0:
            return {
                "position":          np.zeros((0, 0, 2), dtype=np.float64),
                "vector":            np.zeros((0, 0, 2), dtype=np.float64),
                "orientation":       np.zeros((0, 0),    dtype=np.float64),
                "valid_mask":        np.zeros((0, 0),    dtype=np.bool_),
                "future_projection": np.zeros((0, 8, 2), dtype=np.float64),
            }

        pts_list = []
        for route in routes:
            cl = np.array([[p.x, p.y] for p in route.point], dtype=np.float64)
            if len(cl) > 0:
                pts_list.append(cl)

        if len(pts_list) == 0:
            return {
                "position":          np.zeros((0, 0, 2), dtype=np.float64),
                "vector":            np.zeros((0, 0, 2), dtype=np.float64),
                "orientation":       np.zeros((0, 0),    dtype=np.float64),
                "valid_mask":        np.zeros((0, 0),    dtype=np.bool_),
                "future_projection": np.zeros((0, 8, 2), dtype=np.float64),
            }

        full_cl = np.concatenate(pts_list, axis=0)
        n_points = int(self.radius / 1.0)
        resampled = _interpolate_polyline(full_cl, n_points + 1)

        position    = resampled[:n_points]
        vector_arr  = resampled[1:n_points + 1] - resampled[:n_points]
        orientation = np.arctan2(vector_arr[:, 1], vector_arr[:, 0])
        valid_mask  = np.ones(n_points, dtype=np.bool_)

        return {
            "position":          position[None],      # (1, n_points, 2)
            "vector":            vector_arr[None],    # (1, n_points, 2)
            "orientation":       orientation[None],   # (1, n_points)
            "valid_mask":        valid_mask[None],    # (1, n_points)
            "future_projection": np.zeros((1, 8, 2), dtype=np.float64),
        }

    def _load_checkpoint(self, model: PlutoPlanningModel, ckpt_path: str) -> PlutoPlanningModel:
        if not os.path.exists(ckpt_path):
            self._logger.error(f"Checkpoint not found: {ckpt_path}")
            return model
        try:
            ckpt = torch.load(ckpt_path, map_location="cpu", weights_only=True)
        except TypeError:
            ckpt = torch.load(ckpt_path, map_location="cpu")

        if isinstance(ckpt, dict):
            weights = None
            for key in ("state_dict", "model", "model_state_dict"):
                if key in ckpt:
                    weights = ckpt[key]
                    break
            if weights is None:
                weights = ckpt
        else:
            self._logger.error("Unsupported checkpoint format")
            return model

        clean = OrderedDict()
        for k, v in weights.items():
            k = k.removeprefix("model.").removeprefix("module.")
            clean[k] = v

        result = model.load_state_dict(clean, strict=False)
        self._logger.info(
            f"Checkpoint loaded from {ckpt_path}. "
            f"Missing: {len(result.missing_keys)}, Unexpected: {len(result.unexpected_keys)}"
        )
        return model
