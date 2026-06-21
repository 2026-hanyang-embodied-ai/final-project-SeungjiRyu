#!/usr/bin/env python3

import logging
import os
from dataclasses import dataclass
from datetime import datetime
from typing import List

os.environ['CUDA_LAUNCH_BLOCKING'] = '1'
os.environ["TORCH_USE_CUDA_DSA"] = '1'
import torch
import numpy as np
import math
import rospy
from collections import OrderedDict
import autohyu_msgs.msg as autohyu_msgs
import std_msgs.msg as std_msgs

from interface_python.interface_objects import ObjectClass, TrafficLightColor
from util_function import function_transform

from diffusion_planner.model.diffusion_planner import Diffusion_Planner as Model
from diffusion_planner.utils.config import Config
from diffusion_planner.model.guidance.guidance_wrapper import GuidanceWrapper
from diffusion_planner.data_process.utils import vector_set_coordinates_to_local_frame

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Interface : Data classes
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
@dataclass
class DiffusionPlannerInput:
    # Ego state
    ego_global: np.ndarray
    ego_local: np.ndarray

    # Dynamic objects
    agents: np.ndarray
    agent_info: np.ndarray

    # Static objects
    statics: np.ndarray

    # Lanes
    lanes: np.ndarray
    lane_speed_limit: np.ndarray
    lane_has_speed_limit: np.ndarray

    # Routes
    routes: np.ndarray
    route_speed_limit: np.ndarray
    route_has_speed_limit: np.ndarray

@dataclass
class PreprocessData:
    planning_space_data_parsed: DiffusionPlannerInput
    planning_space_data_local: DiffusionPlannerInput
    planning_space_data_fixed: DiffusionPlannerInput

@dataclass
class DiffusionPlannerOutput:
    ego_prediction: np.ndarray
    agent_predictions: np.ndarray
    neighbor_current_mask: np.ndarray
    
@dataclass
class ObjectDimension:
    length: float
    width: float
    height: float

@dataclass
class PredictObject:
    object_id: int
    classification: int
    dimension: ObjectDimension
    state_sequence: np.ndarray
    
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Diffusion Planner Algorithm
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #

class DiffusionPlanner:
    def __init__(self, cfg, config_path, ckpt_path, guidance_config=None) -> None:
        self._logger = logging.getLogger(self.__class__.__name__)

        guidance_cfg = guidance_config or {}
        has_any_guidance = any(
            guidance_cfg.get(g, {}).get("enable", False)
            for g in ["collision", "lane_keeping"]
        )
        guidance_fn = GuidanceWrapper(guidance_cfg) if has_any_guidance else None

        self.config_ = Config(
            args_file=config_path,
            guidance_fn=guidance_fn
        )
        self.config_.guidance_scale = float(guidance_cfg.get("global_scale", 0.5))

        self.dt = 0.1
        self.future_steps = int(getattr(self.config_, "future_len", 0))
        self.UpdateConfig(cfg)

        configured_device = str(cfg.get("device", getattr(self.config_, "device", "cpu")))
        if configured_device.startswith("cuda") and not torch.cuda.is_available():
            self._logger.warning(
                "[diffusion_planner/device] CUDA requested but not available. Falling back to cpu."
            )
            configured_device = "cpu"
        self.device = torch.device(configured_device)
        self.config_.device = str(self.device)

        self.max_initial_position_error = 2.0
        self.max_initial_heading_error = np.deg2rad(30.0)

        self.observation_normalizer_ = self.config_.observation_normalizer

        self.ego_state_dim_         = 8
        self.ego_feature_dim_       = 10
        self.agent_feature_dim_     = self.config_.agent_state_dim
        self.static_feature_dim_    = self.config_.static_objects_state_dim
        self.lane_feature_dim_      = self.config_.lane_state_dim
        self.route_feature_dim_     = self.config_.route_state_dim

        self.max_ped_bike_      = 10
        self.max_agent_input_distance_m_ = 100.0
        self.num_agents_        = self.config_.agent_num
        self.num_statics_       = self.config_.static_objects_num
        self.num_lanes_         = self.config_.lane_num
        self.num_routes_        = self.config_.route_num

        model = Model(self.config_)
        self.model = self._load_model(model, ckpt_path)
        self.model.to(self.device)
        self.model.eval()

        self._frame_count = 0
        self._record_scenes = False

    def UpdateConfig(self, cfg):
        self.dt = float(cfg.get("dt", self.dt))
        requested_future_steps = int(cfg.get("future_steps", self.future_steps))
        max_future_steps = int(getattr(self.config_, "future_len", requested_future_steps))
        if requested_future_steps > max_future_steps:
            self._logger.warning(
                "[diffusion_planner/horizon] Requested future_steps=%d exceeds model future_len=%d. Clamping.",
                requested_future_steps,
                max_future_steps,
            )
        self.future_steps = max(0, min(requested_future_steps, max_future_steps))

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    # Main pipeline: Preprocess -> Algorithm -> Postprocess
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    def RunPreprocess(self, planning_space):
        """
        Step 1: Pre-process planning space.

        Args:
            planning_space: Input planning-space message.

        Returns:
            tuple: (model_input, preprocess_data)
                - model_input: Tensor-ready and normalized model input.
                - preprocess_data: Parsed/local/fixed planning-space bundles.

        Pipeline:
            1. Add speed limit to lanes and route segments.
            2. Ego-centric frame transformation.
            3. Ego-based top 32 agents, top 70 lanes, top 25 route segments.
            4. Z-score normalization.
        """
        planning_space_data_parsed = self._parse_planning_space(planning_space)

        planning_space_data_local = self._transform_to_ego_centric(planning_space_data_parsed)

        planning_space_data_fixed = self._convert_data_to_fixed_size(planning_space_data_local)

        if self._record_scenes:
            self._save_scene(planning_space_data_fixed)

        model_input = self._convert_data_to_dict(planning_space_data_fixed)

        model_input = self._convert_to_tensor(model_input, self.device)

        model_input = self._z_score_normalization(model_input)

        preprocess_data = PreprocessData(
            planning_space_data_parsed  = planning_space_data_parsed,
            planning_space_data_local   = planning_space_data_local,
            planning_space_data_fixed   = planning_space_data_fixed,
        )

        return model_input, preprocess_data

    def RunAlgorithm(self, model_input):
        """
        Step 2: Run diffusion planner model.

        Args:
            model_input: Normalized tensor dictionary for the model.

        Returns:
            DiffusionPlannerOutput: Ego prediction, agent predictions, and neighbor-current mask.

        Pipeline:
            1. Run diffusion planner model.
        """
        with torch.no_grad():
            _, outputs = self.model(model_input)

        prediction            = outputs["prediction"][0].detach().cpu().numpy().astype(np.float64)                   # Shape: (ego + num_agents, future_horizon, 4) - [x, y, cos(heading), sin(heading)]
        current_states        = outputs["current_states_denormalized"][0].detach().cpu().numpy().astype(np.float64)  # Shape: (ego + num_agents, 4) - [x, y, cos(heading), sin(heading)]
        neighbor_current_mask = outputs["neighbor_current_mask"][0].detach().cpu().numpy().astype(bool)              # Shape: (num_agents)

        prediction = np.concatenate([current_states[:, None, :], prediction], axis=1)  # Shape: (ego + num_agents, 1 + future_horizon, 4)

        ego_prediction = prediction[0]      # Shape: (1 + future_horizon, 4)
        agent_predictions = prediction[1:]  # Shape: (num_agents, 1 + future_horizon, 4)

        # Cache lateral distances from lane keeping guidance
        guidance_fn = self.config_.guidance_fn
        if guidance_fn is not None and hasattr(guidance_fn, 'last_lateral_dist'):
            self.lateral_dist_before = guidance_fn.first_lateral_dist[0].numpy() if guidance_fn.first_lateral_dist is not None else None
            self.lateral_dist_after  = guidance_fn.last_lateral_dist[0].numpy()  if guidance_fn.last_lateral_dist  is not None else None
        else:
            self.lateral_dist_before = None
            self.lateral_dist_after  = None

        return DiffusionPlannerOutput(
            ego_prediction          = ego_prediction,
            agent_predictions       = agent_predictions,
            neighbor_current_mask   = neighbor_current_mask,
        )

    def RunPostprocess(self, inference_output: DiffusionPlannerOutput, planning_space, preprocess_data):
        """
        Step 3: Post-process.

        Args:
            inference_output (DiffusionPlannerOutput): Model output bundle.
            planning_space: Original planning-space message.
            preprocess_data (PreprocessData): Preprocess intermediate data.
        Returns:
            tuple: (o_trajectory, o_predict_objects)
                - o_trajectory: Ego trajectory message.
                - o_predict_objects: Predicted objects message.

        Pipeline:
            1. Transform model outputs to global frame.
            2. Refine agent predictions (position/heading sanity checks).
            3. Compensate prediction delay.
            4. Truncate to prediction horizon.
            5. Compute global velocities.
            6. Update Trajectory and PredictObjects message.
        """

        ego_prediction_global, agent_predictions_global = self._transform_to_global_frame(inference_output, preprocess_data)

        # agent_predictions_global = self._refine_agent_predictions(agent_predictions_global, preprocess_data, inference_output)    # Disabled to see pure model output

        ego_prediction_global, agent_predictions_global, delay_sec = self._compensate_prediction_delay(ego_prediction_global, agent_predictions_global, planning_space)

        ego_prediction_global, agent_predictions_global = self._truncate_predictions_to_horizon(ego_prediction_global, agent_predictions_global)

        # Compute ego velocity in global frame
        ego_velocities = self._calculate_velocity(np.expand_dims(ego_prediction_global, axis=0))[0]
        ego_prediction_global_with_velocity = np.concatenate([ego_prediction_global, ego_velocities], axis=-1)
        o_trajectory = self._update_trajectory(ego_prediction_global_with_velocity, planning_space, delay_sec=delay_sec)

        # Compute velocity in global frame
        agent_velocities = self._calculate_velocity(agent_predictions_global)
        agent_predictions_global_with_velocity = np.concatenate([agent_predictions_global, agent_velocities], axis=-1)
        
        # Mask out invalid agents
        planning_space_agent_info_masked, valid_agent_predictions = self._apply_agent_mask(
            agent_predictions_global_with_velocity,
            preprocess_data,
            inference_output,
        )
        
        # Prepare predict objects from predictions and planning-space metadata
        predict_objects = self._prepare_predict_objects(
            planning_space_agent_info_masked,
            valid_agent_predictions,
            planning_space,
        )

        o_predict_objects = self._update_predict_objects(
            planning_space,
            predict_objects,
            delay_sec=delay_sec,
        )

        return o_trajectory, o_predict_objects

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    # Preprocess : Parse planning space
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    def _parse_planning_space(self, planning_space):

        # Count inputs and sequence lengths
        num_of_objects = len(planning_space.objects)
        num_of_dynamic, num_of_static = self._count_dynamic_static_objects(planning_space)

        num_of_lane_segments  = len(planning_space.lanes)
        num_of_route_segments = len(planning_space.routes)

        self._logger.info(
            "[motion_prediction/preprocess] "
            f"Objects(total={num_of_objects}, dynamic={num_of_dynamic}, static={num_of_static}) | "
            f"Lanes(seg={num_of_lane_segments}) | "
            f"Routes(seg={num_of_route_segments})"
        )

        ego_current_state_global, ego_current_state_local = self._parse_ego_state(planning_space)

        planning_space_agent_global, planning_space_agent_info = self._parse_agents(planning_space, num_of_dynamic)

        planning_space_static_global = self._parse_static_objects(planning_space, num_of_static)

        planning_space_lanes_global, planning_space_lanes_speed_limit, planning_space_lanes_has_speed_limit = self._parse_lanes(planning_space, num_of_lane_segments)

        planning_space_routes_global, planning_space_routes_speed_limit, planning_space_routes_has_speed_limit = self._parse_routes(planning_space, num_of_route_segments)

        return DiffusionPlannerInput(
            ego_global              = ego_current_state_global,
            ego_local               = ego_current_state_local,
            agents                  = planning_space_agent_global,
            agent_info              = planning_space_agent_info,
            statics                 = planning_space_static_global,
            lanes                   = planning_space_lanes_global,
            lane_speed_limit        = planning_space_lanes_speed_limit,
            lane_has_speed_limit    = planning_space_lanes_has_speed_limit,
            routes                  = planning_space_routes_global,
            route_speed_limit       = planning_space_routes_speed_limit,
            route_has_speed_limit   = planning_space_routes_has_speed_limit,
        )

    def _parse_ego_state(self, planning_space):

        # Extract ego current state in global frame
        ego_current_state_global = np.zeros((self.ego_state_dim_))
        ego_current_state_global[0] = planning_space.ego.state[-1].x
        ego_current_state_global[1] = planning_space.ego.state[-1].y
        ego_current_state_global[2] = planning_space.ego.state[-1].heading

        # Fix ego current state in local frame
        ego_current_state_local = np.zeros((self.ego_feature_dim_))
        ego_current_state_local[0] = 0.0    # x
        ego_current_state_local[1] = 0.0    # y
        ego_current_state_local[2] = 1.0    # cos(heading)
        ego_current_state_local[3] = 0.0    # sin(heading)
        ego_current_state_local[4] = 0.0    # vx
        ego_current_state_local[5] = 0.0    # vy
        ego_current_state_local[6] = 0.0    # ax
        ego_current_state_local[7] = 0.0    # ay
        ego_current_state_local[8] = 0.0    # steering angle
        ego_current_state_local[9] = 0.0    # yaw rate

        return ego_current_state_global, ego_current_state_local

    def _parse_agents(self, planning_space, num_of_dynamic):

        # Initialzation
        historical_step = len(planning_space.ego.state)

        planning_space_agent_global = np.zeros((num_of_dynamic, historical_step, self.agent_feature_dim_)) # x, y, cos_h, sin_h, vx, vy, ax, ay, width, length, is_valid
        planning_space_agent_info   = np.zeros((num_of_dynamic, 5))  # Object ID, length, width, height, classification
        dynamic_objects = []

        # Extract dynamic objects from planning space
        for obj in planning_space.objects:
            if obj.classification != ObjectClass.BARRIER:   # Only consider non-barrier and non-unknown objects as dynamic objects
                dynamic_objects.append(obj)

        for agent_idx, obj in enumerate(dynamic_objects):
            dynamic_object_type = self._dynamic_object_type_one_hot(obj.classification)

            # Fill in the agent features
            for history_idx in range(historical_step):
                planning_space_agent_global[agent_idx, history_idx, 0]  = obj.state[history_idx].x
                planning_space_agent_global[agent_idx, history_idx, 1]  = obj.state[history_idx].y
                planning_space_agent_global[agent_idx, history_idx, 2]  = obj.state[history_idx].heading
                planning_space_agent_global[agent_idx, history_idx, 3]  = 0.0                               # Reserved for future use after transformation to ego-centric frame
                planning_space_agent_global[agent_idx, history_idx, 4]  = obj.state[history_idx].vx
                planning_space_agent_global[agent_idx, history_idx, 5]  = obj.state[history_idx].vy
                agent_width  = 1.8 if obj.classification == ObjectClass.PEDESTRIAN else obj.width
                agent_length = 1.8 if obj.classification == ObjectClass.PEDESTRIAN else obj.length
                planning_space_agent_global[agent_idx, history_idx, 6]  = agent_width
                planning_space_agent_global[agent_idx, history_idx, 7]  = agent_length
                planning_space_agent_global[agent_idx, history_idx, 8:] = dynamic_object_type

            planning_space_agent_info[agent_idx, 0] = obj.id
            planning_space_agent_info[agent_idx, 1] = 1.8 if obj.classification == ObjectClass.PEDESTRIAN else obj.length
            planning_space_agent_info[agent_idx, 2] = 1.8 if obj.classification == ObjectClass.PEDESTRIAN else obj.width
            planning_space_agent_info[agent_idx, 3] = obj.height
            planning_space_agent_info[agent_idx, 4] = obj.classification

        return planning_space_agent_global, planning_space_agent_info

    def _parse_static_objects(self, planning_space, num_of_static):

        # Initialzation
        planning_space_static_global = np.zeros((num_of_static, self.static_feature_dim_))
        static_objects = []

        # Extract static objects from planning space
        for obj in planning_space.objects:
            if obj.classification == ObjectClass.BARRIER or obj.classification == ObjectClass.UNKNOWN:
                static_objects.append(obj)

        for static_idx, obj in enumerate(static_objects):
            static_object_type = self._static_object_type_one_hot(obj)

            # Fill in the static object features
            planning_space_static_global[static_idx, 0]  = obj.state[-1].x
            planning_space_static_global[static_idx, 1]  = obj.state[-1].y
            planning_space_static_global[static_idx, 2]  = obj.state[-1].heading
            planning_space_static_global[static_idx, 3]  = 0.0                      # Reserved for future use after transformation to ego-centric frame
            planning_space_static_global[static_idx, 4]  = obj.width
            planning_space_static_global[static_idx, 5]  = obj.length
            planning_space_static_global[static_idx, 6:] = static_object_type

        return planning_space_static_global

    def _parse_lanes(self, planning_space, num_of_lane_segments):

        # Sanity check
        if not (num_of_lane_segments > 0):
            self._logger.warning("No lane information")
            return np.zeros((1, 20, self.lane_feature_dim_)), np.zeros((1, 1)), np.zeros((1, 1))

        # Initialization
        lane_points_per_segment = self.config_.lane_len

        planning_space_lanes_global          = np.zeros((num_of_lane_segments, lane_points_per_segment, self.lane_feature_dim_)) # [70, 20, 12]
        planning_space_lanes_speed_limit     = np.zeros((num_of_lane_segments, 1))
        planning_space_lanes_has_speed_limit = np.zeros((num_of_lane_segments, 1))

        for i in range(num_of_lane_segments):
            lane_msg = planning_space.lanes[i]

            # Extract lane features
            centerline_points       = self._points_to_xy(lane_msg.point)
            left_boundary_points    = self._points_to_xy(lane_msg.left_boundary)
            right_boundary_points   = self._points_to_xy(lane_msg.right_boundary)
            
            if lane_msg.is_dividing_lane:
                traffic_light           = self._traffic_light_one_hot(lane_msg.traffic_light_color, lane_points_per_segment)
            else:
                traffic_light           = np.zeros((lane_points_per_segment, 4), dtype=np.float64)
                traffic_light[:, 3]     = 1.0    # Unknown
                
            # Fill in the lane features
            planning_space_lanes_global[i, :, 0:2]  = centerline_points
            planning_space_lanes_global[i, :, 2:4]  = left_boundary_points
            planning_space_lanes_global[i, :, 4:6]  = right_boundary_points
            planning_space_lanes_global[i, :, 6:8]  = 0.0                      # Reserved for future use after transformation to ego-centric frame
            planning_space_lanes_global[i, :, 8:12] = traffic_light

            # if lane_msg.max_speed > 0:
            #     planning_space_lanes_speed_limit[i] = self._kph_to_mps(lane_msg.max_speed)
            #     planning_space_lanes_has_speed_limit[i] = True
            # else:
            #     planning_space_lanes_speed_limit[i] = 0.0
            #     planning_space_lanes_has_speed_limit[i] = False
            planning_space_lanes_speed_limit[i] = self._kph_to_mps(50.0)
            planning_space_lanes_has_speed_limit[i] = True

        return planning_space_lanes_global, planning_space_lanes_speed_limit, planning_space_lanes_has_speed_limit

    def _parse_routes(self, planning_space, num_of_route_segments):

        # Sanity check
        if not (num_of_route_segments > 0):
            self._logger.warning("No route information")
            return np.zeros((1, 20, self.route_feature_dim_)), np.zeros((1, 1)), np.zeros((1, 1))

        # Initialization
        route_points_per_segment = self.config_.route_len

        planning_space_routes_global          = np.zeros((num_of_route_segments, route_points_per_segment, self.route_feature_dim_))
        planning_space_routes_speed_limit     = np.zeros((num_of_route_segments, 1))
        planning_space_routes_has_speed_limit = np.zeros((num_of_route_segments, 1))

        for i in range(num_of_route_segments):
            route_msg = planning_space.routes[i]

            # Extract route features
            centerline_points       = self._points_to_xy(route_msg.point)
            left_boundary_points    = self._points_to_xy(route_msg.left_boundary)
            right_boundary_points   = self._points_to_xy(route_msg.right_boundary)
            traffic_light           = self._traffic_light_one_hot(route_msg.traffic_light_color, route_points_per_segment)

            # Fill in the route features
            planning_space_routes_global[i, :, 0:2]  = centerline_points
            planning_space_routes_global[i, :, 2:4]  = left_boundary_points
            planning_space_routes_global[i, :, 4:6]  = right_boundary_points
            planning_space_routes_global[i, :, 6:8]  = 0.0                      # Reserved for future use after transformation to ego-centric frame
            planning_space_routes_global[i, :, 8:12] = traffic_light
            
            # if route_msg.max_speed > 0:
            #     planning_space_routes_speed_limit[i] = self._kph_to_mps(route_msg.max_speed)
            #     planning_space_routes_has_speed_limit[i] = True
            # else:
            #     planning_space_routes_speed_limit[i] = 0.0
            #     planning_space_routes_has_speed_limit[i] = False
            planning_space_routes_speed_limit[i] = self._kph_to_mps(50.0)
            planning_space_routes_has_speed_limit[i] = True

        return planning_space_routes_global, planning_space_routes_speed_limit, planning_space_routes_has_speed_limit

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    # Preprocess : Transform to ego-centric frame
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    def _transform_to_ego_centric(self, planning_space_data: DiffusionPlannerInput):
        ego_origin_global = planning_space_data.ego_global[0:2]
        ego_yaw = planning_space_data.ego_global[2]

        planning_space_agent_local = self._transform_agents_to_ego_centric(
            planning_space_data.agents, ego_origin_global, ego_yaw
        )
        planning_space_static_local = self._transform_statics_to_ego_centric(
            planning_space_data.statics, ego_origin_global, ego_yaw
        )
        planning_space_lanes_local = self._transform_lanes_to_ego_centric_and_compute_features(
            planning_space_data.lanes, ego_origin_global, ego_yaw
        )
        planning_space_routes_local, route_keep_indices = self._transform_routes_to_ego_centric_and_compute_features(
            planning_space_data.routes, ego_origin_global, ego_yaw
        )
        planning_space_routes_speed_limit = planning_space_data.route_speed_limit[route_keep_indices]
        planning_space_routes_has_speed_limit = planning_space_data.route_has_speed_limit[route_keep_indices]

        return DiffusionPlannerInput(
            ego_global              = planning_space_data.ego_global,
            ego_local               = planning_space_data.ego_local,
            agents                  = planning_space_agent_local,
            agent_info              = planning_space_data.agent_info,
            statics                 = planning_space_static_local,
            lanes                   = planning_space_lanes_local,
            lane_speed_limit        = planning_space_data.lane_speed_limit,
            lane_has_speed_limit    = planning_space_data.lane_has_speed_limit,
            routes                  = planning_space_routes_local,
            route_speed_limit       = planning_space_routes_speed_limit,
            route_has_speed_limit   = planning_space_routes_has_speed_limit,
        )

    def _transform_agents_to_ego_centric(self, planning_space_agent_global, ego_origin_global, ego_yaw):
        planning_space_agent_local = planning_space_agent_global.copy()
        if planning_space_agent_local.size == 0:
            return planning_space_agent_local

        agent_pose_local = function_transform.global_to_local(
            ego_origin=ego_origin_global,
            ego_yaw=ego_yaw,
            global_points=planning_space_agent_global[:, :, :3]
        )
        planning_space_agent_local[:, :, 0:2] = agent_pose_local[:, :, 0:2]

        agent_heading_local = self._wrap_to_pi(agent_pose_local[:, :, 2])
        planning_space_agent_local[:, :, 2] = np.cos(agent_heading_local)
        planning_space_agent_local[:, :, 3] = np.sin(agent_heading_local)

        agent_velocity_local = function_transform.global_to_local_velocity(
            ego_yaw=ego_yaw,
            global_velocity=planning_space_agent_global[:, :, 4:6].reshape(-1, 2)
        )
        planning_space_agent_local[:, :, 4:6] = agent_velocity_local.reshape(
            planning_space_agent_local.shape[0], planning_space_agent_local.shape[1], 2
        )
        return planning_space_agent_local

    def _transform_statics_to_ego_centric(self, planning_space_static_global, ego_origin_global, ego_yaw):
        planning_space_static_local = planning_space_static_global.copy()
        if planning_space_static_local.size == 0:
            return planning_space_static_local

        static_pose_local = function_transform.global_to_local(
            ego_origin=ego_origin_global,
            ego_yaw=ego_yaw,
            global_points=planning_space_static_global[:, :3]
        )
        planning_space_static_local[:, 0:2] = static_pose_local[:, 0:2]

        static_heading_local = self._wrap_to_pi(static_pose_local[:, 2])
        planning_space_static_local[:, 2] = np.cos(static_heading_local)
        planning_space_static_local[:, 3] = np.sin(static_heading_local)

        return planning_space_static_local

    def _transform_lanes_to_ego_centric_and_compute_features(self, polylines_global, ego_origin_global, ego_yaw):
        polylines_local = polylines_global.copy()
        if polylines_local.size == 0:
            return polylines_local

        num_of_elements, num_of_points, _ = polylines_global.shape
        anchor_state = np.array(
            [ego_origin_global[0], ego_origin_global[1], ego_yaw], dtype=np.float64
        )
        availabilities = np.ones((num_of_elements, num_of_points), dtype=np.bool_)

        centerline_global = polylines_global[:, :, 0:2]
        centerline_local = vector_set_coordinates_to_local_frame(
            centerline_global, availabilities, anchor_state, output_precision=np.float64
        )

        left_boundary_global_xy  = polylines_global[:, :, 2:4]
        right_boundary_global_xy = polylines_global[:, :, 4:6]

        left_boundary_local = vector_set_coordinates_to_local_frame(
            left_boundary_global_xy, availabilities, anchor_state, output_precision=np.float64
        )

        right_boundary_local = vector_set_coordinates_to_local_frame(
            right_boundary_global_xy, availabilities, anchor_state, output_precision=np.float64
        )

        # Match boundary point order with centerline direction.
        for i in range(num_of_elements):
            if np.linalg.norm(left_boundary_local[i, -1] - centerline_local[i, 0]) < np.linalg.norm(left_boundary_local[i, 0] - centerline_local[i, 0]):
                left_boundary_local[i] = np.flip(left_boundary_local[i], axis=0)

            if np.linalg.norm(right_boundary_local[i, -1] - centerline_local[i, 0]) < np.linalg.norm(right_boundary_local[i, 0] - centerline_local[i, 0]):
                right_boundary_local[i] = np.flip(right_boundary_local[i], axis=0)

        centerline_vector_local = np.zeros_like(centerline_local)
        if num_of_points > 1:
            centerline_vector_local[:, :-1, :] = centerline_local[:, 1:, :] - centerline_local[:, :-1, :]

        to_left_boundary_local = left_boundary_local - centerline_local
        to_right_boundary_local = right_boundary_local - centerline_local

        polylines_local[:, :, 0:2] = centerline_local
        polylines_local[:, :, 2:4] = centerline_vector_local
        polylines_local[:, :, 4:6] = to_left_boundary_local
        polylines_local[:, :, 6:8] = to_right_boundary_local

        return polylines_local
    
    def _transform_routes_to_ego_centric_and_compute_features(self, polylines_global, ego_origin_global, ego_yaw):
        polylines_local = polylines_global.copy()
        if polylines_local.size == 0:
            return polylines_local, np.array([], dtype=np.int64)

        num_of_elements, num_of_points, _ = polylines_global.shape
        anchor_state = np.array(
            [ego_origin_global[0], ego_origin_global[1], ego_yaw], dtype=np.float64
        )
        availabilities = np.ones((num_of_elements, num_of_points), dtype=np.bool_)

        centerline_global = polylines_global[:, :, 0:2]
        centerline_local = vector_set_coordinates_to_local_frame(
            centerline_global, availabilities, anchor_state, output_precision=np.float64
        )

        left_boundary_global_xy  = polylines_global[:, :, 2:4]
        right_boundary_global_xy = polylines_global[:, :, 4:6]

        left_boundary_local = vector_set_coordinates_to_local_frame(
            left_boundary_global_xy, availabilities, anchor_state, output_precision=np.float64
        )

        right_boundary_local = vector_set_coordinates_to_local_frame(
            right_boundary_global_xy, availabilities, anchor_state, output_precision=np.float64
        )

        # Prune disconnected route segments far from ego
        keep_indices = self._select_connected_routes_from_ego(centerline_local=centerline_local, endpoint_margin=5.0)
        
        centerline_local     = centerline_local[keep_indices]
        left_boundary_local  = left_boundary_local[keep_indices]
        right_boundary_local = right_boundary_local[keep_indices]
        polylines_local      = polylines_local[keep_indices]

        # Match boundary point align order with centerline direction if necessary
        num_of_elements = centerline_local.shape[0]
        for i in range(num_of_elements):
            if np.linalg.norm(left_boundary_local[i, -1] - centerline_local[i, 0]) < np.linalg.norm(left_boundary_local[i, 0] - centerline_local[i, 0]):
                left_boundary_local[i] = np.flip(left_boundary_local[i], axis=0)
            if np.linalg.norm(right_boundary_local[i, -1] - centerline_local[i, 0]) < np.linalg.norm(right_boundary_local[i, 0] - centerline_local[i, 0]):
                right_boundary_local[i] = np.flip(right_boundary_local[i], axis=0)

        centerline_vector_local = np.zeros_like(centerline_local)
        if num_of_points > 1:
            centerline_vector_local[:, :-1, :] = centerline_local[:, 1:, :] - centerline_local[:, :-1, :]

        to_left_boundary_local = left_boundary_local - centerline_local
        to_right_boundary_local = right_boundary_local - centerline_local

        polylines_local[:, :, 0:2] = centerline_local
        polylines_local[:, :, 2:4] = centerline_vector_local
        polylines_local[:, :, 4:6] = to_left_boundary_local
        polylines_local[:, :, 6:8] = to_right_boundary_local

        return polylines_local, keep_indices

    def _select_connected_routes_from_ego(self, centerline_local, endpoint_margin=5.0):
        num_of_routes = centerline_local.shape[0]
        if num_of_routes == 0:
            return np.array([], dtype=np.int64)

        start_points = centerline_local[:, 0, :]
        end_points = centerline_local[:, -1, :]
        mid_points = 0.5 * (start_points + end_points)

        # Local frame origin is ego pose, so nearest midpoint is used as seed.
        seed_idx = int(np.argmin(np.linalg.norm(mid_points, axis=-1)))
        connected_indices = {seed_idx}
        remaining_indices = set(range(num_of_routes))
        remaining_indices.remove(seed_idx)

        while remaining_indices:
            expanded = False
            connected_array = np.array(sorted(connected_indices), dtype=np.int64)
            connected_start_end_points = np.concatenate(
                [start_points[connected_array], end_points[connected_array]], axis=0
            )

            newly_connected = []
            for route_idx in remaining_indices:
                candidate_start_end_points = np.stack(
                    [start_points[route_idx], end_points[route_idx]], axis=0
                )
                min_endpoint_dist = np.linalg.norm(
                    candidate_start_end_points[:, None, :] - connected_start_end_points[None, :, :],
                    axis=-1,
                ).min()

                if min_endpoint_dist <= endpoint_margin:
                    newly_connected.append(route_idx)
                    expanded = True

            for route_idx in newly_connected:
                connected_indices.add(route_idx)
                remaining_indices.remove(route_idx)

            if not expanded:
                break

        return np.array(sorted(connected_indices), dtype=np.int64)

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    # Preprocess : Convert to fixed size for model input
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    def _convert_data_to_fixed_size(self, planning_space_data: DiffusionPlannerInput):
        planning_space_agent_local_fixed, planning_space_agent_info_fixed \
            = self._convert_agents_to_fixed_size( planning_space_data.agents, planning_space_data.agent_info)
        
        planning_space_static_local_fixed \
            = self._convert_statics_to_fixed_size(planning_space_data.statics)
        
        planning_space_lanes_local_fixed, planning_space_lanes_speed_limit_fixed, planning_space_lanes_has_speed_limit_fixed \
            = self._convert_lanes_to_fixed_size( planning_space_data.lanes, planning_space_data.lane_speed_limit, planning_space_data.lane_has_speed_limit)
        
        planning_space_routes_local_fixed, planning_space_routes_speed_limit_fixed, planning_space_routes_has_speed_limit_fixed \
            = self._convert_routes_to_fixed_size( planning_space_data.routes, planning_space_data.route_speed_limit, planning_space_data.route_has_speed_limit)

        return DiffusionPlannerInput(
            ego_global              = planning_space_data.ego_global,
            ego_local               = planning_space_data.ego_local,
            agents                  = planning_space_agent_local_fixed,
            agent_info              = planning_space_agent_info_fixed,
            statics                 = planning_space_static_local_fixed,
            lanes                   = planning_space_lanes_local_fixed,
            lane_speed_limit        = planning_space_lanes_speed_limit_fixed,
            lane_has_speed_limit    = planning_space_lanes_has_speed_limit_fixed,
            routes                  = planning_space_routes_local_fixed,
            route_speed_limit       = planning_space_routes_speed_limit_fixed,
            route_has_speed_limit   = planning_space_routes_has_speed_limit_fixed,
        )

    def _convert_agents_to_fixed_size(self, planning_space_agent_local, planning_space_agent_info):
        planning_space_agent_local_fixed = np.zeros((self.num_agents_, planning_space_agent_local.shape[1], planning_space_agent_local.shape[2]))
        planning_space_agent_info_fixed  = np.zeros((self.num_agents_, planning_space_agent_info.shape[1]))

        if planning_space_agent_local.shape[0] == 0:
            return planning_space_agent_local_fixed, planning_space_agent_info_fixed

        # Agents outside the ego-centric distance threshold remain zero-padded
        distance_to_ego = np.linalg.norm(planning_space_agent_local[:, -1, :2], axis=-1)
        valid_distance_mask = distance_to_ego <= self.max_agent_input_distance_m_

        planning_space_agent_local = planning_space_agent_local[valid_distance_mask]
        planning_space_agent_info = planning_space_agent_info[valid_distance_mask]
        distance_to_ego = distance_to_ego[valid_distance_mask]

        if planning_space_agent_local.shape[0] == 0:
            return planning_space_agent_local_fixed, planning_space_agent_info_fixed

        # Select top agents based on distance to ego.
        sorted_indices = np.argsort(distance_to_ego)

        ped_bike_indices = [i for i in sorted_indices if not np.all(planning_space_agent_local[i, 0, 8:] == [1, 0, 0])]  # Pedestrian or Cyclist
        vehicle_indices  = [i for i in sorted_indices if np.all(planning_space_agent_local[i, 0, 8:] == [1, 0, 0])]  # Vehicle

        if len(ped_bike_indices) + len(vehicle_indices) <= self.num_agents_:
            selected_indices = sorted_indices[:self.num_agents_]
        else:
            # Limit the number of pedestrians and bicycles to max_ped_bike_.
            selected_ped_bike_indices = ped_bike_indices[:self.max_ped_bike_]
            remaining_ped_bike_indices = ped_bike_indices[self.max_ped_bike_:]

            # Combine selected pedestrians/bicycles with vehicles.
            selected_indices = selected_ped_bike_indices + vehicle_indices

            # If there are still slots remaining, fill them with the closest remaining pedestrians/bicycles.
            remaining_slots = self.num_agents_ - len(selected_indices)
            if remaining_slots > 0:
                selected_indices += remaining_ped_bike_indices[:remaining_slots]

            # Sort and limit the selected indices to num_agents.
            selected_indices = sorted(selected_indices, key=lambda idx: distance_to_ego[idx])[:self.num_agents_]

        for i, j in enumerate(selected_indices):
            planning_space_agent_local_fixed[i, :, :planning_space_agent_local.shape[-1]] = planning_space_agent_local[j, :, :planning_space_agent_local.shape[-1]]
            planning_space_agent_info_fixed[i, :] = planning_space_agent_info[j, :]

        return planning_space_agent_local_fixed, planning_space_agent_info_fixed

    def _convert_statics_to_fixed_size(self, planning_space_static_local):
        planning_space_static_local_fixed = np.zeros((self.num_statics_, planning_space_static_local.shape[1]))

        # Select top static objects based on distance to ego.
        distance_to_ego_static = np.linalg.norm(planning_space_static_local[:, :2], axis=-1)
        sorted_indices_static = list(np.argsort(distance_to_ego_static))[:self.num_statics_]

        for i, j in enumerate(sorted_indices_static):
            planning_space_static_local_fixed[i, :planning_space_static_local.shape[-1]] = planning_space_static_local[j, :planning_space_static_local.shape[-1]]

        return planning_space_static_local_fixed

    def _convert_lanes_to_fixed_size(self, planning_space_lanes_local, planning_space_lanes_speed_limit, planning_space_lanes_has_speed_limit):
        planning_space_lanes_local_fixed            = np.zeros((self.num_lanes_, planning_space_lanes_local.shape[1], planning_space_lanes_local.shape[2]))
        planning_space_lanes_speed_limit_fixed      = np.zeros((self.num_lanes_, planning_space_lanes_speed_limit.shape[1]))
        planning_space_lanes_has_speed_limit_fixed  = np.zeros((self.num_lanes_, planning_space_lanes_has_speed_limit.shape[1]), dtype=np.bool_)

        # Select top lanes based on distance to ego.
        distance_to_ego_lane = np.min(np.linalg.norm(planning_space_lanes_local[:, :, :2], axis=-1), axis=-1)
        sorted_indices_lane = np.argsort(distance_to_ego_lane)[:self.num_lanes_]

        for i, j in enumerate(sorted_indices_lane):
            planning_space_lanes_local_fixed[i, :, :planning_space_lanes_local.shape[-1]] = planning_space_lanes_local[j, :, :planning_space_lanes_local.shape[-1]]
            planning_space_lanes_speed_limit_fixed[i, :planning_space_lanes_speed_limit.shape[-1]] = (planning_space_lanes_speed_limit[j, :planning_space_lanes_speed_limit.shape[-1]])
            planning_space_lanes_has_speed_limit_fixed[i, :planning_space_lanes_has_speed_limit.shape[-1]] = (planning_space_lanes_has_speed_limit[j, :planning_space_lanes_has_speed_limit.shape[-1]])

        return planning_space_lanes_local_fixed, planning_space_lanes_speed_limit_fixed, planning_space_lanes_has_speed_limit_fixed

    def _convert_routes_to_fixed_size(self, planning_space_routes_local, planning_space_routes_speed_limit, planning_space_routes_has_speed_limit):
        planning_space_routes_local_fixed           = np.zeros((self.num_routes_, planning_space_routes_local.shape[1], planning_space_routes_local.shape[2]))
        planning_space_routes_speed_limit_fixed     = np.zeros((self.num_routes_, planning_space_routes_speed_limit.shape[1]))
        planning_space_routes_has_speed_limit_fixed = np.zeros((self.num_routes_, planning_space_routes_has_speed_limit.shape[1]), dtype=np.bool_)

        # Select top routes based on distance to ego.
        distance_to_ego_route = np.min(np.linalg.norm(planning_space_routes_local[:, :, :2], axis=-1), axis=-1)
        sorted_indices_route = np.argsort(distance_to_ego_route)[:self.num_routes_]

        for i, j in enumerate(sorted_indices_route):
            planning_space_routes_local_fixed[i, :, :planning_space_routes_local.shape[-1]] = planning_space_routes_local[j, :, :planning_space_routes_local.shape[-1]]
            planning_space_routes_speed_limit_fixed[i, :planning_space_routes_speed_limit.shape[-1]] = (planning_space_routes_speed_limit[j, :planning_space_routes_speed_limit.shape[-1]])
            planning_space_routes_has_speed_limit_fixed[i, :planning_space_routes_has_speed_limit.shape[-1]] = (planning_space_routes_has_speed_limit[j, :planning_space_routes_has_speed_limit.shape[-1]])

        return planning_space_routes_local_fixed, planning_space_routes_speed_limit_fixed, planning_space_routes_has_speed_limit_fixed

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    # Preprocess : Helper functions
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    def _dynamic_object_type_one_hot(self, classification):
        dynamic_object_type = np.zeros((3,), dtype=np.float64)
        if classification == ObjectClass.CAR:
            dynamic_object_type[0] = 1.0
        elif classification == ObjectClass.PEDESTRIAN:
            dynamic_object_type[1] = 1.0
        elif classification == ObjectClass.MOTORCYCLE or classification == ObjectClass.BICYCLE:
            dynamic_object_type[2] = 1.0
        else:
            dynamic_object_type[0] = 1.0  # Unknown dynamic objects are treated as car.

        return dynamic_object_type

    def _static_object_type_one_hot(self, obj):
        static_object_type = np.zeros((4,), dtype=np.float64)
        if obj.classification == ObjectClass.UNKNOWN and (obj.length * obj.width < 1.0):
            static_object_type[0] = 1.0  # CZONE_SIGN
        elif obj.classification == ObjectClass.BARRIER:
            static_object_type[1] = 1.0  # BARRIER
        else :
            static_object_type[3] = 1.0  # GENERIC_OB

        return static_object_type

    def _traffic_light_one_hot(self, color, num_points):
        traffic_light = np.zeros((num_points, 4), dtype=np.float64)
        if color in [TrafficLightColor.GREEN]:
            traffic_light[:, 0] = 1
        elif color in [TrafficLightColor.YELLOW]:
            traffic_light[:, 1] = 1
        elif color in [TrafficLightColor.RED, TrafficLightColor.RED_YELLOW]:
            traffic_light[:, 2] = 1
        else:
            traffic_light[:, 3] = 1
        return traffic_light
    
    def _count_dynamic_static_objects(self, planning_space):
        num_of_dynamic = 0
        num_of_static = 0
        for obj in planning_space.objects:
            if obj.classification == ObjectClass.BARRIER:
                num_of_static += 1
            else:
                num_of_dynamic += 1
        return num_of_dynamic, num_of_static

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    # Scene recording
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    def _save_scene(self, data: DiffusionPlannerInput):
        path = os.path.join(self._save_dir, f"frame_{self._frame_count:06d}.npz")
        np.savez(
            path,
            ego_global             = data.ego_global,
            ego_local              = data.ego_local,
            agents                 = data.agents,
            agent_info             = data.agent_info,
            statics                = data.statics,
            lanes                  = data.lanes,
            lane_speed_limit       = data.lane_speed_limit,
            lane_has_speed_limit   = data.lane_has_speed_limit,
            routes                 = data.routes,
            route_speed_limit      = data.route_speed_limit,
            route_has_speed_limit  = data.route_has_speed_limit,
        )
        self._frame_count += 1

    def _convert_data_to_dict(self, planning_space_data: DiffusionPlannerInput):
        model_input = {
            "neighbor_agents_past": planning_space_data.agents,
            "ego_current_state": planning_space_data.ego_local,
            "static_objects": planning_space_data.statics,
            "lanes": planning_space_data.lanes,
            "lanes_speed_limit": planning_space_data.lane_speed_limit,
            "lanes_has_speed_limit": planning_space_data.lane_has_speed_limit,
            "route_lanes": planning_space_data.routes,
            "route_lanes_speed_limit": planning_space_data.route_speed_limit,
            "route_lanes_has_speed_limit": planning_space_data.route_has_speed_limit,
        }
        return model_input

    def _z_score_normalization(self, model_input):
        model_input = self.observation_normalizer_(model_input)

        return model_input

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    # Postprocess
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    def _transform_to_global_frame(self, inference_output: DiffusionPlannerOutput, preprocess_data):
        ego_origin = preprocess_data.planning_space_data_parsed.ego_global[:2]
        ego_heading = preprocess_data.planning_space_data_parsed.ego_global[2]

        # Extract x, y, and heading from ego prediction and transform to global frame
        ego_prediction_position      = inference_output.ego_prediction[:, :2]
        ego_prediction_heading       = np.expand_dims(np.arctan2(inference_output.ego_prediction[:, 3], inference_output.ego_prediction[:, 2]), axis=-1)
        ego_prediction_xy_heading    = np.concatenate([ego_prediction_position, ego_prediction_heading], axis=-1)
        ego_prediction_global        = function_transform.local_to_global(ego_origin, ego_heading, ego_prediction_xy_heading)

        # Extract x, y, and heading from predictions
        agent_predictions_position   = inference_output.agent_predictions[:, :, :2]
        agent_predictions_heading    = np.expand_dims(np.arctan2(inference_output.agent_predictions[:, :, 3], inference_output.agent_predictions[:, :, 2]), axis=-1)
        agent_predictions_xy_heading = np.concatenate([agent_predictions_position, agent_predictions_heading], axis=-1)
        agent_predictions_global     = function_transform.local_to_global(ego_origin, ego_heading, agent_predictions_xy_heading)

        return ego_prediction_global, agent_predictions_global

    # def _refine_agent_predictions(self, agent_predictions_global, preprocess_data, inference_output: DiffusionPlannerOutput):
        
    #     # Sanity check
    #     if agent_predictions_global.size == 0:
    #         return agent_predictions_global

    #     fixed_agents = preprocess_data.planning_space_data_fixed.agents
    #     neighbor_current_mask = inference_output.neighbor_current_mask

    #     if fixed_agents.size == 0 or neighbor_current_mask.size == 0:
    #         return agent_predictions_global

    #     num_agents = agent_predictions_global.shape[0]
    #     if num_agents <= 0:
    #         return agent_predictions_global

    #     # Local to global transformantion
    #     ego_origin = preprocess_data.planning_space_data_parsed.ego_global[:2]
    #     ego_heading = preprocess_data.planning_space_data_parsed.ego_global[2]

    #     current_local = fixed_agents[:num_agents, -1, :]
    #     current_local_xy_heading = np.zeros((num_agents, 3), dtype=np.float64)
    #     current_local_xy_heading[:, :2] = current_local[:, :2]
    #     current_local_xy_heading[:, 2] = np.arctan2(current_local[:, 3], current_local[:, 2])
    #     current_global = function_transform.local_to_global(ego_origin, ego_heading, current_local_xy_heading)

    #     rotation = np.array([[np.cos(ego_heading), -np.sin(ego_heading)], [np.sin(ego_heading), np.cos(ego_heading)]], dtype=np.float64)
    #     current_velocity_global = np.dot(current_local[:, 4:6], rotation.T)

    #     # Refinement
    #     refined_prediction = agent_predictions_global.copy()

    #     for i in range(num_agents):
    #         if bool(neighbor_current_mask[i]):
    #             continue

    #         prediction = agent_predictions_global[i]
    #         if prediction.shape[0] == 0:
    #             continue

    #         adjusted_prediction = prediction.copy()

    #         if prediction.shape[0] > 2 and self.dt > 1e-6:
    #             reference_position = current_global[i, :2] + current_velocity_global[i] * self.dt   # cv model
    #             initial_position_error = float(np.linalg.norm(prediction[1, :2] - reference_position))

    #             reference_heading = float(adjusted_prediction[0, 2])
    #             position_vector = adjusted_prediction[2, :2] - adjusted_prediction[1, :2]
    #             if float(np.linalg.norm(position_vector)) > 1e-6:
    #                 initial_heading = math.atan2(position_vector[1], position_vector[0])
    #                 initial_heading_error = float(self._wrap_to_pi(initial_heading - reference_heading))
    #             else:
    #                 initial_heading_error = 0.0

    #             # Check initial position feasibility
    #             if initial_position_error > self.max_initial_position_error:
    #                 adjusted_prediction[1:] = self._translate_prediction(adjusted_prediction[1:], reference_position)
    #                 adjusted_prediction = self._rotate_prediction(adjusted_prediction, -initial_heading_error)
    #             # Check initial heading feasibility
    #             elif abs(initial_heading_error) > self.max_initial_heading_error:
    #                 adjusted_prediction = self._rotate_prediction(adjusted_prediction, -initial_heading_error)
    #         elif prediction.shape[0] > 1 and self.dt > 1e-6:
    #             reference_position = current_global[i, :2] + current_velocity_global[i] * self.dt   # cv model
    #             initial_position_error = float(np.linalg.norm(prediction[1, :2] - reference_position))

    #             # Check initial position feasibility
    #             if initial_position_error > self.max_initial_position_error:
    #                 adjusted_prediction[1:] = self._translate_prediction(adjusted_prediction[1:], reference_position)

    #         refined_prediction[i] = adjusted_prediction

    #     return refined_prediction
    
    # def _translate_prediction(self, prediction, target_position):
    #     if prediction.shape[0] == 0:
    #         return prediction

    #     position_error = target_position - prediction[0, :2]
    #     adjusted_prediction = prediction.copy()
    #     adjusted_prediction[:, :2] += position_error

    #     return adjusted_prediction

    # def _rotate_prediction(self, prediction, delta_heading):
    #     if prediction.shape[0] <= 1:
    #         return prediction
    #     if delta_heading == 0.0:
    #         return prediction

    #     rotated_prediction = prediction.copy()

    #     rotation_center_xy = prediction[1, :2]

    #     cos_delta = math.cos(delta_heading)
    #     sin_delta = math.sin(delta_heading)
    #     rotation_matrix = np.array(
    #         [[cos_delta, -sin_delta], [sin_delta, cos_delta]], dtype=np.float64
    #     )

    #     relative_xy = rotated_prediction[1:, :2] - rotation_center_xy
    #     rotated_prediction[1:, :2] = np.dot(relative_xy, rotation_matrix.T) + rotation_center_xy
    #     rotated_prediction[1:, 2] = self._wrap_to_pi(rotated_prediction[1:, 2] + delta_heading)

    #     return rotated_prediction

    def _compensate_prediction_delay(self, ego_prediction_global, agent_predictions_global, planning_space, delay_sec=None):
        if delay_sec is None:
            delay_sec = (rospy.Time.now() - planning_space.header.stamp).to_sec()
            delay_sec = max(delay_sec, 0.0)

        ego_prediction_global = np.expand_dims(ego_prediction_global, axis=0)
        max_delay_ego = max((ego_prediction_global.shape[1] - 1) * self.dt, 0.0)
        max_delay_agent = max((agent_predictions_global.shape[1] - 1) * self.dt, 0.0)
        max_delay = min(max_delay_ego, max_delay_agent)
        delay_sec = float(np.clip(delay_sec, 0.0, max_delay))

        ego_prediction_global = self._shift_predictions(ego_prediction_global, delay_sec)
        agent_predictions_global = self._shift_predictions(agent_predictions_global, delay_sec)

        return ego_prediction_global[0], agent_predictions_global, delay_sec
    
    def _shift_predictions(self, predictions_global, delay_sec=None):
        if predictions_global.size == 0:
            return predictions_global

        num_agents, num_steps, _ = predictions_global.shape
        if num_steps <= 1:
            return predictions_global

        t = np.arange(num_steps, dtype=np.float64) * self.dt
        t_end = t[-1]
        if t_end <= 0.0 or delay_sec <= 1e-6:
            return predictions_global

        tq = np.clip(t + delay_sec, 0.0, t_end)
        shifted = np.zeros_like(predictions_global)

        for i in range(num_agents):
            x = predictions_global[i, :, 0]
            y = predictions_global[i, :, 1]
            yaw = predictions_global[i, :, 2]

            shifted[i, :, 0] = np.interp(tq, t, x)
            shifted[i, :, 1] = np.interp(tq, t, y)

            yaw_unwrapped = np.unwrap(yaw)
            yaw_shifted = np.interp(tq, t, yaw_unwrapped)
            shifted[i, :, 2] = self._wrap_to_pi(yaw_shifted)

        return shifted

    def _truncate_predictions_to_horizon(self, ego_prediction_global, agent_predictions_global):
        num_total_steps = max(self.future_steps + 1, 1)
        ego_prediction_global = ego_prediction_global[:num_total_steps, :]
        agent_predictions_global = agent_predictions_global[:, :num_total_steps, :]

        return ego_prediction_global, agent_predictions_global

    def _calculate_velocity(self, agent_predictions):

        dt = self.dt
        delta_pos = agent_predictions[:, 1:, :2] - agent_predictions[:, :-1, :2]
        velocity = delta_pos / dt
        velocity = np.concatenate([velocity, velocity[:, -1:]], axis=1)

        return velocity
    
    # Apply neighbor mask to keep only valid agents and their predictions
    def _apply_agent_mask(self, agent_predictions_global_with_velocity, preprocess_data, inference_output: DiffusionPlannerOutput):
        planning_space_agent_info_fixed = preprocess_data.planning_space_data_fixed.agent_info
        neighbor_current_mask = inference_output.neighbor_current_mask
        planning_space_agent_info_fixed = planning_space_agent_info_fixed[:neighbor_current_mask.shape[0]]
        planning_space_agent_info_masked = planning_space_agent_info_fixed[~neighbor_current_mask]
        valid_agent_predictions = agent_predictions_global_with_velocity[~neighbor_current_mask]

        return planning_space_agent_info_masked, valid_agent_predictions

    # Build final predict-object entries from dynamic predictions and static objects.
    def _prepare_predict_objects(self, planning_space_agent_info_masked, valid_agent_predictions, planning_space) -> List[PredictObject]:
        predict_objects = []
        predicted_object_ids = set()
        prediction_steps = valid_agent_predictions.shape[1] if valid_agent_predictions.ndim >= 2 else 0
        if prediction_steps <= 0:
            prediction_steps = max(self.future_steps + 1, 1)
        prediction_steps = max(prediction_steps, 1)

        # Dynamic objects
        for agent_info, prediction in zip(planning_space_agent_info_masked, valid_agent_predictions):
            if prediction.shape[0] == 0:
                continue

            object_id = int(agent_info[0])
            predicted_object_ids.add(object_id)

            # Build PredictObject entry
            predict_objects.append(
                self._build_predict_object(
                    object_id,
                    int(agent_info[4]),         # classification
                    ObjectDimension(
                        length=float(agent_info[1]),   # length
                        width=float(agent_info[2]),    # width
                        height=float(agent_info[3]),   # height
                    ),
                    prediction,
                )
            )
        
        # Static-class objects from planning space
        for obj in planning_space.objects:
            if obj.classification not in (ObjectClass.BARRIER, ObjectClass.UNKNOWN):
                continue
            if len(obj.state) == 0:
                continue
            if int(obj.id) in predicted_object_ids:
                continue

            static_state = obj.state[-1]
            static_state_vector = np.array(
                [static_state.x, static_state.y, static_state.heading, 0.0, 0.0],
                dtype=np.float64,
            )
            prediction = np.repeat(static_state_vector[None, :], prediction_steps, axis=0)

            # Build predict object class
            predict_objects.append(
                self._build_predict_object(
                    int(obj.id),
                    int(obj.classification),
                    ObjectDimension(
                        length=float(obj.length),
                        width=float(obj.width),
                        height=float(obj.height),
                    ),
                    prediction,
                )
            )

        return predict_objects
    
    def _build_predict_object(self, object_id, classification, dimension: ObjectDimension, state_sequence) -> PredictObject:
        return PredictObject(
            object_id=int(object_id),
            classification=int(classification),
            dimension=ObjectDimension(
                length=float(dimension.length),
                width=float(dimension.width),
                height=float(dimension.height),
            ),
            state_sequence=state_sequence.astype(np.float64, copy=False),
        )


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    # Update ROS messages
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    def _update_trajectory(self, ego_prediction, planning_space, delay_sec=None):
        o_trajectory = autohyu_msgs.Trajectory()

        if delay_sec is None:
            base_stamp = planning_space.header.stamp
        else:
            base_stamp = planning_space.header.stamp + rospy.Duration(delay_sec)

        o_trajectory.header = std_msgs.Header()
        o_trajectory.header.seq = planning_space.header.seq
        o_trajectory.header.frame_id = planning_space.header.frame_id
        o_trajectory.header.stamp = base_stamp
        o_trajectory.point = []

        if ego_prediction.size == 0:
            return o_trajectory

        cumulative_distance = 0.0
        prev_x = float(ego_prediction[0, 0])
        prev_y = float(ego_prediction[0, 1])
        prev_speed = 0.0

        for i in range(ego_prediction.shape[0]):
            x = float(ego_prediction[i, 0])
            y = float(ego_prediction[i, 1])
            yaw = float(ego_prediction[i, 2])
            vx = float(ego_prediction[i, 3])
            vy = float(ego_prediction[i, 4])
            speed = math.sqrt(vx * vx + vy * vy)

            if i > 0:
                cumulative_distance += math.hypot(x - prev_x, y - prev_y)

            acceleration = 0.0
            if i > 0 and self.dt > 1e-6:
                acceleration = (speed - prev_speed) / self.dt

            point = autohyu_msgs.TrajectoryPoint()
            point.time = float(self.dt * i)
            point.distance = float(cumulative_distance)
            point.x = x
            point.y = y
            point.z = 0.0
            point.yaw = yaw
            point.curvature = 0.0
            point.speed = float(speed)
            point.acceleration = float(acceleration)
            o_trajectory.point.append(point)

            prev_x = x
            prev_y = y
            prev_speed = speed

        return o_trajectory

    def _update_predict_objects(self, planning_space, predict_objects: List[PredictObject], delay_sec=None):
        o_predict_objects = autohyu_msgs.PredictObjects()

        if delay_sec is None:
            base_stamp = planning_space.header.stamp
        else:
            base_stamp = planning_space.header.stamp + rospy.Duration(delay_sec)

        o_predict_objects.header = std_msgs.Header()
        o_predict_objects.header.seq = planning_space.header.seq
        o_predict_objects.header.frame_id = planning_space.header.frame_id
        o_predict_objects.header.stamp = base_stamp

        for predict_object in predict_objects:
            obj_msg = autohyu_msgs.PredictObject()
            obj_msg.id = int(predict_object.object_id)
            obj_msg.classification = int(predict_object.classification)
            obj_msg.dynamic_state = 1 if predict_object.classification in (ObjectClass.BARRIER, ObjectClass.UNKNOWN) else 2
            obj_msg.dimension.length = float(predict_object.dimension.length)
            obj_msg.dimension.width  = float(predict_object.dimension.width)
            obj_msg.dimension.height = float(predict_object.dimension.height)

            state_sequence = predict_object.state_sequence
            for t in range(state_sequence.shape[0]):
                state = autohyu_msgs.Object3DState()
                state.header          = std_msgs.Header()
                state.header.seq      = planning_space.header.seq
                state.header.frame_id = planning_space.header.frame_id
                state.header.stamp    = base_stamp + rospy.Duration(self.dt * t)
                state.x          = float(state_sequence[t, 0])
                state.y          = float(state_sequence[t, 1])
                state.z          = 0.0
                state.roll       = 0.0
                state.pitch      = 0.0
                state.yaw        = float(state_sequence[t, 2])
                state.vx         = float(state_sequence[t, 3])
                state.vy         = float(state_sequence[t, 4])
                state.vz         = 0.0
                state.ax         = 0.0
                state.ay         = 0.0
                state.az         = 0.0
                state.roll_rate  = 0.0
                state.pitch_rate = 0.0
                state.yaw_rate   = 0.0

                obj_msg.state.append(state)

            o_predict_objects.object.append(obj_msg)

        return o_predict_objects

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    # Util functions
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    def _points_to_xy(self, points):
        if len(points) == 0:
            return np.zeros((0, 2), dtype=np.float64)
        return np.array([[point.x, point.y] for point in points], dtype=np.float64)

    def _kph_to_mps(self, speed_kph):
        return float(speed_kph) / 3.6

    def _wrap_to_pi(self, angle):
        return (angle + np.pi) % (2.0 * np.pi) - np.pi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    # Util functions for ML
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    def _load_model(self, model, model_path):
        try:
            ckpt = torch.load(model_path, map_location="cpu", weights_only=True)
        except TypeError:
            ckpt = torch.load(model_path, map_location="cpu")

        if isinstance(ckpt, dict):
            if "ema_state_dict" in ckpt and self._is_state_dict_like(ckpt["ema_state_dict"]):
                weights = ckpt["ema_state_dict"]
                source = "ema_state_dict"
            elif "state_dict" in ckpt and self._is_state_dict_like(ckpt["state_dict"]):
                weights = ckpt["state_dict"]
                source = "state_dict"
            elif "model" in ckpt and self._is_state_dict_like(ckpt["model"]):
                weights = ckpt["model"]
                source = "model"
            elif self._is_state_dict_like(ckpt):
                weights = ckpt
                source = "checkpoint_dict"
            else:
                raise ValueError(
                    "[diffusion_planner/checkpoint] Unsupported checkpoint dict format. "
                    f"keys={list(ckpt.keys())[:20]}"
                )
        elif self._is_state_dict_like(ckpt):
            weights = ckpt
            source = "raw_checkpoint"
        else:
            raise ValueError(
                "[diffusion_planner/checkpoint] Unsupported checkpoint type. "
                f"type={type(ckpt)}"
            )

        new_state_dict = OrderedDict()
        for key, value in weights.items():
            new_key = key
            if new_key.startswith("module."):
                new_key = new_key[len("module."):]
            if new_key.startswith("model."):
                new_key = new_key[len("model."):]
            new_state_dict[new_key] = value

        incompatible = model.load_state_dict(new_state_dict, strict=False)

        return model
    
    def _is_state_dict_like(self, obj):
        if not isinstance(obj, dict) or len(obj) == 0:
            return False
        return all(isinstance(k, str) and torch.is_tensor(v) for k, v in obj.items())

    def _convert_to_tensor(self, model_input, device):
        tensor_model_input = {}
        for k, v in model_input.items():
            if isinstance(v, np.ndarray) and v.dtype == np.bool_:
                tensor_model_input[k] = torch.tensor(v, dtype=torch.bool).unsqueeze(0).to(device)
            else:
                tensor_model_input[k] = torch.tensor(v, dtype=torch.float32).unsqueeze(0).to(device)

        return tensor_model_input
