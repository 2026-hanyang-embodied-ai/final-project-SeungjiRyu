from typing import List, Dict, Any, Optional
import torch

from ..diffusion_utils.sde import VPSDE_linear
from .collision import collision_guidance_fn
from .lane_keeping import lane_keeping_guidance_fn

N = 1
sde = VPSDE_linear()

class GuidanceWrapper:
    """
    Guidance function aggregator.

    Config-based activation/deactivation of each guidance function
    with per-guidance scale parameters.

    Args:
        config: guidance configuration dict, e.g.:
            {
                "collision":    {"enable": True, "scale": 3.0},
                "lane_keeping": {"enable": True, "scale": 2.0, "threshold": 0.3},
            }
            If config is None, only collision guidance is enabled for backward compatibility.
    """
    def __init__(self, config: Optional[Dict[str, Any]] = None):
        self._guidance_fns = []
        self._lk_enabled = False

        if config is None:
            # Backward compatibility: no config → collision only
            self._guidance_fns.append(collision_guidance_fn)
            return

        # Collision guidance
        collision_cfg = config.get("collision", {})
        if collision_cfg.get("enable", False):
            self._guidance_fns.append(collision_guidance_fn)

        # Lane keeping guidance
        lk_cfg = config.get("lane_keeping", {})
        if lk_cfg.get("enable", False):
            _scale = float(lk_cfg.get("scale", 1.0))
            _threshold = float(lk_cfg.get("threshold", 0.3))
            _boundary_scale = float(lk_cfg.get("boundary_scale", 3.0))
            self._lk_enabled = True
            self.first_lateral_dist = None
            self.last_lateral_dist = None

            def _lk_fn(x, t, c, _s=_scale, _t=_threshold, _bs=_boundary_scale, **kw):
                t_val = t[0].item() if hasattr(t, '__getitem__') else float(t)
                if t_val > 0.5:
                    self.first_lateral_dist = None  # Reset at new inference start
                out_debug = {}
                energy = lane_keeping_guidance_fn(x, t, c, scale=_s, threshold=_t, boundary_scale=_bs, out_debug=out_debug, **kw)
                if 0.005 < t_val < 0.1 and "lateral_dist" in out_debug:
                    if self.first_lateral_dist is None:
                        self.first_lateral_dist = out_debug["lateral_dist"]
                    self.last_lateral_dist = out_debug["lateral_dist"]
                return energy

            self._guidance_fns.append(_lk_fn)

        enabled = [k for k, v in config.items()
                   if isinstance(v, dict) and v.get("enable", False)]

    def __call__(self, x_in, t_input, cond, *args, **kwargs):
        """
        Aggregates energy from all registered guidance functions.
        """
        energy = 0

        state_normalizer = kwargs["state_normalizer"]
        observation_normalizer = kwargs["observation_normalizer"]

        B, P, _ = x_in.shape
        model = kwargs["model"]
        model_condition = kwargs["model_condition"]

        x_fix = model(x_in, t_input, **model_condition).detach() - x_in.detach()
        x_fix = x_fix.reshape(B, P, -1, 4)
        x_fix[:, :, 0] = 0.0
        x_in = x_in + x_fix.reshape(B, P, -1)

        x_in = state_normalizer.inverse(x_in.reshape(B, P, -1, 4))
        kwargs["inputs"] = observation_normalizer.inverse(kwargs["inputs"])

        for guidance_fn in self._guidance_fns:
            energy += guidance_fn(x_in, t_input, cond, **kwargs)

        assert not torch.isnan(energy).any()

        return energy
