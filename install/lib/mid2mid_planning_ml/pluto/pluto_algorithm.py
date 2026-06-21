#!/usr/bin/env python3
'''
  @file         pluto_algorithm.py
  @brief        PLUTO (Planning with Learned User-dependent Trajectory Optimization) algorithm implementation

  @authors      Yuseung Na (yuseungna@hanyang.ac.kr)
                Jonghyun Lee (jonghyunlee@hanyang.ac.kr)
                Seungji Ryu (seungjiryu@hanyang.ac.kr)

  @date         2024-12-01 Refactorized by Seungji Ryu following PEP8 guidelines
'''
import sys
import os
import torch
from torch.nn.utils.rnn import pad_sequence
import numpy as np
import time
import rospy
import gc
from collections import OrderedDict
from scipy.special import softmax

# Set CUDA environment variables
os.environ["CUDA_VISIBLE_DEVICES"] = "0"
os.environ['CUDA_LAUNCH_BLOCKING'] = '1'
os.environ["TORCH_USE_CUDA_DSA"] = '1'

# ----------------------------------------------------------------------------
# Path Setup (Release Version)
# ------------------------------------------------------------------------------
# Go up four levels from the current file to reach the repository root.
BASE = os.path.abspath(os.path.join(os.path.dirname(__file__), "../../../.."))

# Add paths to sys.path for module imports
sys.path.insert(0, os.path.join(BASE, "install", "lib"))
sys.path.insert(0, os.path.join(BASE, "install", "lib", "python3", "dist-packages"))

# Import system modules
from util_function import function_transform
from mid2mid_planning_ml.pluto.src.models.pluto.pluto_model import PlanningModel as Model

# ------------------------------------------------------------------------------
# Constants
# ------------------------------------------------------------------------------

# Unit conversion constants
KPH_TO_MPS = 1.0 / 3.6  # Convert kilometers per hour to meters per second


class CarmakerTrafficLight:
    """Traffic light state mapping for CarMaker simulator."""
    GREEN      = 1
    YELLOW     = 2
    RED        = 3
    RED_YELLOW = 4


class CarmakerObject:
    """Object classification mapping for CarMaker simulator."""
    UNKNOWN    = 0
    CAR        = 1
    BICYCLE    = 2
    MOTORCYCLE = 3
    TRUCK      = 4
    PEDESTRIAN = 5
    BARRIER    = 7


class nuPlanTrafficLight:
    """Traffic light state mapping for nuPlan dataset."""
    GREEN   = 0
    YELLOW  = 1
    RED     = 2
    UNKNOWN = 3


class nuPlanObject:
    """Object classification mapping for nuPlan dataset."""
    EGO        = 0
    VEHICLE    = 1
    PEDESTRIAN = 2
    BICYCLE    = 3


class nuPlanPolygon:
    """Polygon type mapping for nuPlan dataset."""
    LANE           = 0
    LANE_CONNECTOR = 1


class nuPlanOnRoute:
    """On-route status mapping for nuPlan dataset."""
    FALSE = 0
    TRUE  = 1


# ------------------------------------------------------------------------------
# Helper Functions
# ------------------------------------------------------------------------------

def load_pluto_model(model, model_path):
    """
    Load PLUTO model weights from checkpoint file.

    Args:
        model: PLUTO model instance
        model_path: Path to the checkpoint file

    Returns:
        Model with loaded weights
    """
    weights = torch.load(model_path)["state_dict"]

    new_state_dict = OrderedDict()
    for key, value in weights.items():
        new_key = key.replace("model.", "", 1)
        new_state_dict[new_key] = value

    model.load_state_dict(new_state_dict, strict=False)

    return model


# ------------------------------------------------------------------------------
# PLUTO Algorithm Class
# ------------------------------------------------------------------------------

class PLUTO:
    """
    PLUTO (Planning with Learned User-dependent Trajectory Optimization) Algorithm.

    This class implements the PLUTO algorithm for autonomous vehicle trajectory planning
    using deep learning-based prediction and optimization.
    """

    def __init__(self) -> None:
        """
        Initialize PLUTO algorithm with model loading and configuration.
        """
        # Vehicle dimensions (constants)
        self.VEHICLE_WIDTH = 1.890  # [m]
        self.VEHICLE_LENGTH = 4.635  # [m]

        # Algorithm configuration
        self.use_ref_free = False

        # Output variables
        self.o_trajectory_ = None
        self.o_predict_objects_ = None
        self.o_trajectories_ = None
        self.device = torch.device("cuda:0")

        # Load PLUTO model
        print("Loading PLUTO model...")

        ckpt_dir = "/home/ailab/AILabDataset/03_Shared_Repository/seungji/pluto/outputs/pluto_50_m2_no_boundary_no_cross/2025-06-26-14-18-04/checkpoints"
        ckpt_name = "last.ckpt"

        model_path = os.path.join(ckpt_dir, ckpt_name)
        model = Model(future_steps=50)
        self.model = load_pluto_model(model, model_path)
        self.model.to(self.device)
        self.model.eval()
        print("PLUTO model loaded successfully")

    # ==========================================================================
    # External API (Called from mid2mid_planning_ml_node.py)
    # ==========================================================================

    def run_preprocess(self, planning_space):
        """
        Preprocess planning space data into PLUTO model input format.

        Args:
            planning_space: ROS planning space message

        Returns:
            Tuple containing:
                - data: Model input dictionary
                - ego_origin_global_m: Ego position in global frame
                - ego_theta_theta_global_rad: Ego heading angle
                - planning_space_lanes_global: Lane information
                - data_npy: Numpy version of data
        """
        # Parse planning space
        ego_current_state_local, planning_space_ego_agent_global, planning_space_objects_global, planning_space_lanes_global, planning_space_boundary_lanes_global, ego_origin_global_m, ego_theta_theta_global_rad, ref_lines = self._parse_planning_space(planning_space)

        # Convert to nuPlan format
        nuplan_ego_objects_global = self._parse_object_as_nuplan(planning_space_ego_agent_global)
        nuplan_objects_global = self._parse_static_object_as_nuplan(planning_space_objects_global)
        nuplan_lanes_global = self._parse_map_as_nuplan(planning_space_lanes_global, planning_space_boundary_lanes_global)
        nuplan_reference_line = self._parse_reference_line_as_nuplan(ref_lines)

        # Construct data dictionary
        data = {}
        data["agent"] = nuplan_ego_objects_global
        data["static_objects"] = nuplan_objects_global
        data["map"] = nuplan_lanes_global
        data["current_state"] = torch.tensor(ego_current_state_local, dtype=torch.float32).to(self.device)
        data["reference_line"] = nuplan_reference_line

        # Convert to local frame and tensor
        data_npy = self._normalize(data, ego_origin_global_m, ego_theta_theta_global_rad)
        data = self._to_feature_tensor(data_npy)
        data = self._collate([data])

        gc.collect()

        return data, ego_origin_global_m, ego_theta_theta_global_rad, planning_space_lanes_global, data_npy

    def run_algorithm(self, model_input):
        """
        Run PLUTO algorithm to generate trajectory and predictions.

        Args:
            model_input: Preprocessed model input dictionary

        Returns:
            Tuple containing:
                - best_trajectory_reshaped: Selected trajectory [1, 80, 3]
                - prediction: Object predictions [1, A-1, 80, 2]
        """
        with torch.no_grad():
            out = self.model(model_input)

        # Extract prediction output
        prediction = out["prediction"][0].cpu().numpy().astype(np.float64)  # (A-1, T=80, 2)
        prediction = np.expand_dims(prediction, axis=0)  # Reshape to (1, A-1, T=80, 2)

        # Extract trajectory candidates and probabilities
        candidate_trajectories = out["candidate_trajectories"][0].cpu().numpy().astype(np.float64)
        probability = out["probability"][0].cpu().numpy()

        # Extract reference-free trajectory if enabled
        if self.use_ref_free:
            ref_free_trajectory = (
                (out["output_ref_free_trajectory"][0].cpu().numpy().astype(np.float64))
                if "output_ref_free_trajectory" in out
                else None
            )
        else:
            ref_free_trajectory = None

        # Trim candidates using scoring method
        candidate_trajectories, learning_based_score = self._trim_candidates(
            candidate_trajectories, ref_free_trajectory, probability
        )

        # Select best trajectory based on learning score
        best_candidate_idx = learning_based_score.argmax()
        best_trajectory = candidate_trajectories[best_candidate_idx]

        # Reshape from (80, 3) to (1, 80, 3) to match expected format
        best_trajectory_reshaped = np.expand_dims(best_trajectory, axis=0)

        return best_trajectory_reshaped, prediction

    def run_postprocess(self, trajectory):
        """
        Attach speed information to trajectory.

        Args:
            trajectory: Trajectory array [1, 80, 3] containing (x, y, yaw)

        Returns:
            Trajectory with speed [1, 80, 4] containing (x, y, yaw, speed)
        """
        dt = 0.1  # Time step in seconds

        # Extract x, y coordinates
        x = trajectory[:, :, 0]  # (1, 80)
        y = trajectory[:, :, 1]  # (1, 80)
        future_step = trajectory.shape[1]
        speed_profile = np.zeros((1, future_step, 1))  # (1, 80, 1)

        # Calculate dx, dy
        dx = x[:, 1:] - x[:, :-1]  # (1, 79)
        dy = y[:, 1:] - y[:, :-1]  # (1, 79)

        # Calculate speed: v_t = sqrt(dx^2 + dy^2) / dt
        speed = np.sqrt(dx**2 + dy**2) / dt  # (1, 79)
        speed_profile[:, :-1, :] = np.expand_dims(speed, -1)  # (1, 79, 1)
        speed_profile[:, -1, :] = speed_profile[:, -2, :]  # (1, 80, 1)

        # Concatenate trajectory with speed
        trajectory_with_speed = np.concatenate([trajectory, speed_profile], axis=-1)  # (1, 80, 4)

        return trajectory_with_speed

    # ==========================================================================
    # Internal Helper Methods (Data parsing and conversion)
    # ==========================================================================

    def _parse_object_as_nuplan(self, planning_space_ego_agent_global):
        """
        Parse ego and agent objects into nuPlan format.

        Args:
            planning_space_ego_agent_global: Array containing ego and agent states

        Returns:
            Dictionary with parsed object information
        """
        position = planning_space_ego_agent_global[:, :, 4:6]
        agent_num = position.shape[0]
        print("Number of agents: ", agent_num)

        heading = planning_space_ego_agent_global[:, :, 6]
        velocity = planning_space_ego_agent_global[:, :, 7:9]
        width = planning_space_ego_agent_global[:, :, 1][..., None]  # (num_objects, historical_steps, 1)
        length = planning_space_ego_agent_global[:, :, 2][..., None]

        # Set pedestrian size to 1.5 x 1.5
        for i in range(planning_space_ego_agent_global.shape[0]):
            obj_cls = planning_space_ego_agent_global[i, :, 3]
            if obj_cls[0] == CarmakerObject.PEDESTRIAN:
                length[i, :, :] = 1.5
                width[i, :, :] = 1.5

        shape = np.concatenate([length, width], axis=-1)

        # Convert planning_space classification to PLUTO categories
        category = np.zeros((planning_space_ego_agent_global.shape[0]), dtype=np.int64)

        for i in range(planning_space_ego_agent_global.shape[0]):
            obj_cls = planning_space_ego_agent_global[i, :, 3]

            # Ego category mapping
            if i == 0:
                category[i] = nuPlanObject.EGO

            # Agent category mapping
            if obj_cls[0] == CarmakerObject.CAR:
                category[i] = nuPlanObject.VEHICLE
            elif (obj_cls[0] == CarmakerObject.BICYCLE) | (obj_cls[0] == CarmakerObject.MOTORCYCLE):
                category[i] = nuPlanObject.BICYCLE
            elif obj_cls[0] == CarmakerObject.PEDESTRIAN:
                category[i] = nuPlanObject.PEDESTRIAN
            else:  # Default to vehicle if unknown
                category[i] = nuPlanObject.VEHICLE

        valid_mask = np.ones((planning_space_ego_agent_global.shape[0], planning_space_ego_agent_global.shape[1]), dtype=bool)

        return {
            "position": position,
            "heading": heading,
            "velocity": velocity,
            "shape": shape,
            "category": category,
            "valid_mask": valid_mask,
        }

    def _parse_static_object_as_nuplan(self, planning_space_objects_global):
        """
        Parse static objects into nuPlan format.

        Args:
            planning_space_objects_global: Array containing static object information

        Returns:
            Dictionary with parsed static object information
        """
        # Handle empty static objects case
        if planning_space_objects_global.shape[0] == 0:
            return {
                "position": np.zeros((0, 2), dtype=np.float32),
                "heading": np.zeros(0, dtype=np.float32),
                "shape": np.zeros((0, 2), dtype=np.float32),
                "category": np.zeros(0, dtype=np.int64),
                "valid_mask": np.zeros(0, dtype=bool),
            }

        position = planning_space_objects_global[:, 4:6]
        heading = planning_space_objects_global[:, 6]
        width = planning_space_objects_global[:, 1][..., None]
        length = planning_space_objects_global[:, 2][..., None]
        shape = np.concatenate([length, width], axis=-1)

        # Category mapping using length and width
        # [PLUTO Classification] 0: Construction zone sign, 1: Barrier, 2: Traffic_cone, 3: Generic_object
        category = np.zeros((planning_space_objects_global.shape[0]), dtype=np.int64)
        for i in range(planning_space_objects_global.shape[0]):
            # Small objects (< 1.3m in any dimension) are traffic cones
            if length[i, 0] < 1.3 or width[i, 0] < 1.3:
                category[i] = 2  # Traffic_cone
            else:  # Large objects are barriers
                category[i] = 1  # Barrier

        valid_mask = np.ones((planning_space_objects_global.shape[0]), dtype=bool)

        return {
            "position": position,
            "heading": heading,
            "shape": shape,
            "category": category,
            "valid_mask": valid_mask,
        }

    def _parse_map_as_nuplan(self, planning_space_lanes_global, planning_space_boundary_lanes_global):
        """
        Parse map lane information into nuPlan format.

        Args:
            planning_space_lanes_global: Array containing lane centerline information
            planning_space_boundary_lanes_global: Array containing lane boundary information

        Returns:
            Dictionary with parsed map information
        """
        num_of_segment, sample_points, num_of_feature = planning_space_lanes_global.shape  # (R, 20, 8)

        # Calculate point vectors (differences between consecutive points)
        point_position_diff = np.zeros((planning_space_lanes_global.shape[0], planning_space_lanes_global.shape[1], 2))  # (R, 20, 2)
        point_position_diff[:, :-1, :] = planning_space_lanes_global[:, 1:, 0:2] - planning_space_lanes_global[:, :-1, 0:2]
        point_position_diff[:, -1, :] = point_position_diff[:, -2, :]  # (R, 20, 2)
        point_position_diff = np.expand_dims(point_position_diff, 1)  # (R, 1, 20, 2)

        # Point positions - shape (R, 3, 20, 2)
        # 0: centerline, 1: left boundary, 2: right boundary
        point_position = np.zeros((num_of_segment, 3, sample_points, 2))
        point_position[:, 0, :, :] = planning_space_lanes_global[:, :, 0:2]  # Centerline
        point_position[:, 1, :, :] = planning_space_boundary_lanes_global[:, :, 0:2]  # Left boundary
        point_position[:, 2, :, :] = planning_space_boundary_lanes_global[:, :, 2:]  # Right boundary

        # Point orientation
        point_orientation = np.arctan2(point_position_diff[:, :, :, 1], point_position_diff[:, :, :, 0])  # (R, 1, 20)

        # Polygon (lane segment) properties
        polygon_center = np.concatenate([
            planning_space_lanes_global[:, int(sample_points / 2), :2],
            np.expand_dims(point_orientation[:, 0, int(sample_points / 2)], -1)
        ], axis=-1)

        polygon_position = planning_space_lanes_global[:, 0, :2]
        polygon_orientation = point_orientation[:, 0, 0]
        polygon_type = planning_space_lanes_global[:, 0, 6]
        polygon_on_route = planning_space_lanes_global[:, 0, 4].astype(bool)
        polygon_tl_status = planning_space_lanes_global[:, 0, 3]
        polygon_has_speed_limit = np.array([True] * num_of_segment)
        polygon_speed_limit = planning_space_lanes_global[:, 0, 7] * KPH_TO_MPS * 0.3  # kph to mps

        valid_mask = np.ones((planning_space_lanes_global.shape[0], planning_space_lanes_global.shape[1]), dtype=bool)

        return {
            "point_position": point_position,
            "point_vector": point_position_diff,
            "point_orientation": point_orientation,
            "polygon_center": polygon_center,
            "polygon_position": polygon_position,
            "polygon_orientation": polygon_orientation,
            "polygon_type": polygon_type,
            "polygon_on_route": polygon_on_route,
            "polygon_tl_status": polygon_tl_status,
            "polygon_has_speed_limit": polygon_has_speed_limit,
            "polygon_speed_limit": polygon_speed_limit,
            "valid_mask": valid_mask,
        }

    def _parse_reference_line_as_nuplan(self, ref_lines):
        """
        Convert reference lines to nuPlan format.

        Args:
            ref_lines: Reference line array [num_lines, num_points, 2]

        Returns:
            Dictionary with parsed reference line information
        """
        num_lines, num_points, _ = ref_lines.shape

        # Initialize arrays
        position = ref_lines.copy()
        vector = np.zeros((num_lines, num_points, 2), dtype=np.float64)
        orientation = np.zeros((num_lines, num_points), dtype=np.float64)
        valid_mask = np.zeros((num_lines, num_points), dtype=bool)

        for i in range(num_lines):
            # Find valid points (non-NaN)
            valid_points = ~(np.isnan(ref_lines[i, :, 0]) | np.isnan(ref_lines[i, :, 1]))
            valid_indices = np.where(valid_points)[0]

            if len(valid_indices) > 1:
                n_valid = len(valid_indices)

                # Set valid mask
                valid_mask[i, valid_indices[:-1]] = True

                # Calculate vector (difference between consecutive points)
                for j in range(n_valid - 1):
                    curr_idx = valid_indices[j]
                    next_idx = valid_indices[j + 1]
                    vector[i, curr_idx] = ref_lines[i, next_idx] - ref_lines[i, curr_idx]

                # Calculate orientation (heading) from vector
                for j in range(n_valid - 1):
                    curr_idx = valid_indices[j]
                    dx, dy = vector[i, curr_idx]
                    if np.sqrt(dx**2 + dy**2) > 1e-6:  # Avoid division by zero
                        orientation[i, curr_idx] = np.arctan2(dy, dx)

        return {
            "position": position,
            "vector": vector,
            "orientation": orientation,
            "valid_mask": valid_mask,
        }

    def _parse_planning_space(self, planning_space):
        """
        Parse ROS planning space message into numpy arrays.

        Args:
            planning_space: ROS PlanningSpace message

        Returns:
            Tuple containing:
                - ego_current_state_local: Ego state in local frame [6]
                - planning_space_ego_agent_global: Ego and agents [num_objects, historical_step, 11]
                - planning_space_objects_global: Static objects [num_static, 7]
                - planning_space_lanes_global: Lane information [num_lanes, num_points, 8]
                - planning_space_boundary_lanes_global: Boundary information [num_lanes, num_points, 4]
                - ego_origin_global_m: Ego position [2]
                - ego_theta_theta_global_rad: Ego heading angle
                - ref_lines: Reference lines [num_refs, 120, 2]
        """
        t1 = time.time()
        historical_step = len(planning_space.ego.state)

        # Count dynamic and static objects
        num_of_objects = len(planning_space.objects)
        num_of_dynamic = 0
        num_of_static = 0

        for obj in planning_space.objects:
            is_static = ((obj.length * obj.width < 5.0) and (obj.classification != CarmakerObject.PEDESTRIAN))
            is_static = is_static or (obj.classification == CarmakerObject.UNKNOWN and (obj.length * obj.width < 10.0))
            if is_static:
                num_of_static += 1
            else:
                num_of_dynamic += 1

        print(f"Total objects: {num_of_objects}, Dynamic: {num_of_dynamic}, Static: {num_of_static}")

        num_of_lane_segments = len(planning_space.lanes)

        if len(planning_space.lanes) == 0:
            num_of_points_in_segment = 0
            lanes_exist = False
        else:
            num_of_points_in_segment = len(planning_space.lanes[0].point)
            lanes_exist = True

        # Initialize arrays
        planning_space_ego_agent_global = np.zeros((num_of_dynamic + 1, historical_step, 11))
        planning_space_objects_global = np.zeros((num_of_static, 7))
        ego_current_state_local = np.zeros((6))

        if not lanes_exist:
            planning_space_lanes_global = np.zeros((1, 20, 8))
        else:
            planning_space_lanes_global = np.zeros((num_of_lane_segments, num_of_points_in_segment, 8))

        planning_space_boundary_lanes_global = np.zeros((num_of_lane_segments, num_of_points_in_segment, 4))

        # Parse ego vehicle states
        for i in range(historical_step):
            # Rotate local velocity to global frame
            tmp_ego_vxy_local = np.array([planning_space.ego.state[i].vx, planning_space.ego.state[i].vy])
            ego_vxy_global = function_transform.rotate_round_z_axis(tmp_ego_vxy_local, -planning_space.ego.state[i].heading)

            # Rotate local acceleration to global frame
            tmp_ego_acceleration_local = np.array([planning_space.ego.state[i].ax, planning_space.ego.state[i].ay])
            ego_acceleration_global = function_transform.rotate_round_z_axis(tmp_ego_acceleration_local, -planning_space.ego.state[i].heading)

            # Store ego state
            planning_space_ego_agent_global[0, i, 0] = 0  # EGO ID
            planning_space_ego_agent_global[0, i, 1] = self.VEHICLE_LENGTH
            planning_space_ego_agent_global[0, i, 2] = self.VEHICLE_WIDTH
            planning_space_ego_agent_global[0, i, 3] = nuPlanObject.EGO
            planning_space_ego_agent_global[0, i, 4] = planning_space.ego.state[i].x
            planning_space_ego_agent_global[0, i, 5] = planning_space.ego.state[i].y
            planning_space_ego_agent_global[0, i, 6] = planning_space.ego.state[i].heading
            planning_space_ego_agent_global[0, i, 7] = ego_vxy_global[0]
            planning_space_ego_agent_global[0, i, 8] = ego_vxy_global[1]
            planning_space_ego_agent_global[0, i, 9] = ego_acceleration_global[0]
            planning_space_ego_agent_global[0, i, 10] = ego_acceleration_global[1]

        # Set ego current state
        vel_input = planning_space.ego.state[-1].vx
        acc_input = planning_space.ego.state[-1].ax

        ego_current_state_local = [0, 0, 0, vel_input, acc_input, planning_space.ego.state[-1].tire_angle]
        ego_origin_global_m = np.array([planning_space.ego.state[-1].x, planning_space.ego.state[-1].y])
        ego_theta_theta_global_rad = planning_space.ego.state[-1].heading

        # Parse dynamic objects
        idx_dynamic = 0
        for i in range(num_of_objects):
            obj = planning_space.objects[i]
            is_static = ((obj.length * obj.width < 5.0) and (obj.classification != CarmakerObject.PEDESTRIAN))
            is_static = is_static or (obj.classification == CarmakerObject.UNKNOWN and (obj.length * obj.width < 10.0))
            is_dynamic = not is_static

            if is_dynamic:
                for j in range(historical_step):
                    planning_space_ego_agent_global[idx_dynamic + 1, j, 0] = planning_space.objects[i].id
                    planning_space_ego_agent_global[idx_dynamic + 1, j, 1] = planning_space.objects[i].length
                    planning_space_ego_agent_global[idx_dynamic + 1, j, 2] = planning_space.objects[i].width
                    planning_space_ego_agent_global[idx_dynamic + 1, j, 3] = planning_space.objects[i].classification
                    planning_space_ego_agent_global[idx_dynamic + 1, j, 4] = planning_space.objects[i].state[j].x
                    planning_space_ego_agent_global[idx_dynamic + 1, j, 5] = planning_space.objects[i].state[j].y
                    planning_space_ego_agent_global[idx_dynamic + 1, j, 6] = planning_space.objects[i].state[j].heading
                    planning_space_ego_agent_global[idx_dynamic + 1, j, 7] = planning_space.objects[i].state[j].vx
                    planning_space_ego_agent_global[idx_dynamic + 1, j, 8] = planning_space.objects[i].state[j].vy
                    planning_space_ego_agent_global[idx_dynamic + 1, j, 9] = planning_space.objects[i].state[j].ax
                    planning_space_ego_agent_global[idx_dynamic + 1, j, 10] = planning_space.objects[i].state[j].ay

                idx_dynamic += 1

        # Parse static objects
        idx_static = 0
        for i in range(num_of_objects):
            obj = planning_space.objects[i]
            is_static = ((obj.length * obj.width < 5.0) and (obj.classification != CarmakerObject.PEDESTRIAN))
            is_static = is_static or (obj.classification == CarmakerObject.UNKNOWN and (obj.length * obj.width < 10.0))

            if is_static:
                planning_space_objects_global[idx_static, 0] = planning_space.objects[i].id
                planning_space_objects_global[idx_static, 1] = planning_space.objects[i].length
                planning_space_objects_global[idx_static, 2] = planning_space.objects[i].width
                planning_space_objects_global[idx_static, 3] = planning_space.objects[i].classification
                planning_space_objects_global[idx_static, 4] = planning_space.objects[i].state[0].x
                planning_space_objects_global[idx_static, 5] = planning_space.objects[i].state[0].y
                planning_space_objects_global[idx_static, 6] = planning_space.objects[i].state[0].heading
                idx_static += 1

        # Parse route information
        route_id = []
        for i in range(len(planning_space.routes)):
            route_id.append(planning_space.routes[i].id)

        # Parse lane information
        for i in range(num_of_lane_segments):
            if planning_space.lanes[i].is_dividing_lane:
                polygon_class = nuPlanPolygon.LANE_CONNECTOR

                # Traffic light status
                tl_color = planning_space.lanes[i].traffic_light_color
                if tl_color == CarmakerTrafficLight.RED or tl_color == CarmakerTrafficLight.RED_YELLOW:
                    tl_class = nuPlanTrafficLight.RED
                elif tl_color == CarmakerTrafficLight.YELLOW:
                    tl_class = nuPlanTrafficLight.YELLOW
                elif tl_color == CarmakerTrafficLight.GREEN:
                    tl_class = nuPlanTrafficLight.GREEN
                else:
                    tl_class = nuPlanTrafficLight.GREEN  # Default: Green
            else:
                polygon_class = nuPlanPolygon.LANE
                tl_class = nuPlanTrafficLight.UNKNOWN  # Default: Unknown

            # Set on-route status
            if planning_space.lanes[i].id in route_id:
                planning_space_lanes_global[i, :, 4] = nuPlanOnRoute.TRUE
            else:
                planning_space_lanes_global[i, :, 4] = nuPlanOnRoute.FALSE

            for j in range(num_of_points_in_segment):
                planning_space_lanes_global[i, j, 0] = planning_space.lanes[i].point[j].x
                planning_space_lanes_global[i, j, 1] = planning_space.lanes[i].point[j].y
                planning_space_lanes_global[i, j, 2] = planning_space.lanes[i].point[j].heading
                planning_space_lanes_global[i, j, 3] = tl_class
                planning_space_lanes_global[i, j, 5] = planning_space.lanes[i].id
                planning_space_lanes_global[i, j, 6] = polygon_class

                # Speed limit (cap at 70 kph)
                if planning_space.lanes[i].max_speed > 70.0:
                    max_speed = 70.0
                else:
                    max_speed = planning_space.lanes[i].max_speed

                planning_space_lanes_global[i, j, 7] = max_speed

                # Boundary information
                planning_space_boundary_lanes_global[i, j, 0] = planning_space.lanes[i].left_boundary[j].x
                planning_space_boundary_lanes_global[i, j, 1] = planning_space.lanes[i].left_boundary[j].y
                planning_space_boundary_lanes_global[i, j, 2] = planning_space.lanes[i].right_boundary[j].x
                planning_space_boundary_lanes_global[i, j, 3] = planning_space.lanes[i].right_boundary[j].y

        # Parse reference lines
        num_ref_lines = len(planning_space.goal_routes)
        ref_lines = np.zeros((num_ref_lines, 120, 2))
        for i in range(num_ref_lines):
            for j in range(120):
                if j < len(planning_space.goal_routes[i].point):
                    ref_lines[i, j, 0] = planning_space.goal_routes[i].point[j].x
                    ref_lines[i, j, 1] = planning_space.goal_routes[i].point[j].y
                else:
                    # Fill with NaN for invalid points
                    ref_lines[i, j, 0] = float('nan')
                    ref_lines[i, j, 1] = float('nan')

        t2 = time.time()

        return ego_current_state_local, planning_space_ego_agent_global, planning_space_objects_global, planning_space_lanes_global, planning_space_boundary_lanes_global, ego_origin_global_m, ego_theta_theta_global_rad, ref_lines

    # ==========================================================================
    # Utility Methods (Data type conversion and transformation)
    # ==========================================================================

    def _to_feature_tensor(self, data):
        """
        Convert all numpy arrays in data dictionary to PyTorch tensors.

        Args:
            data: Dictionary containing numpy arrays

        Returns:
            Dictionary with tensors
        """
        new_data = {}
        for k, v in data.items():
            new_data[k] = self._to_tensor(v)
        return new_data

    def _to_tensor(self, data):
        """
        Recursively convert data to PyTorch tensor.

        Args:
            data: Data to convert (dict, numpy array, or scalar)

        Returns:
            PyTorch tensor on GPU device
        """
        if isinstance(data, dict):
            return {k: self._to_tensor(v) for k, v in data.items()}
        elif isinstance(data, np.ndarray):
            if data.dtype == bool:
                return torch.from_numpy(data).bool().to(self.device)
            else:
                return torch.from_numpy(data).float().to(self.device)
        elif isinstance(data, np.number) or isinstance(data, int) or isinstance(data, float):
            return torch.tensor(data).float().to(self.device)
        elif isinstance(data, torch.Tensor):
            return data.to(self.device)
        else:
            raise NotImplementedError

    def _collate(self, feature_list: dict):
        """
        Collate list of features into batched tensors.

        Args:
            feature_list: List of feature dictionaries

        Returns:
            Batched feature dictionary
        """
        batch_data = {}
        for key in ["agent", "map", "static_objects", "reference_line"]:
            batch_data[key] = {k: pad_sequence([f[key][k] for f in feature_list], batch_first=True) for k in feature_list[0][key].keys()}
        for key in ["current_state", "origin", "angle"]:
            batch_data[key] = torch.stack([f[key] for f in feature_list], dim=0)
        return batch_data

    def _normalize(self, data, center_xy, center_angle):
        """
        Normalize planning data to ego vehicle's local coordinate frame.

        Transforms all positions, velocities, and orientations from global coordinates
        to ego-centric coordinates by applying rotation and translation.

        Args:
            data: Planning data containing agent, map, and static object information
            center_xy: Origin position for coordinate transformation (ego position)
            center_angle: Reference angle for rotation (ego heading)

        Returns:
            Normalized data in ego-centric coordinate frame
        """
        # Create rotation matrix for coordinate transformation
        rotate_mat = np.array(
            [
                [np.cos(center_angle), -np.sin(center_angle)],
                [np.sin(center_angle),  np.cos(center_angle)],
            ],
            dtype=np.float64,
        )

        # Reset ego current state to local origin (0, 0, 0)
        data["current_state"][:3] = 0

        # Transform agent data (position, velocity, heading)
        data["agent"]["position"] = np.matmul(data["agent"]["position"] - center_xy, rotate_mat)
        data["agent"]["velocity"] = np.matmul(data["agent"]["velocity"], rotate_mat)
        data["agent"]["heading"] = np.copy(data["agent"]["heading"]) - center_angle

        # Transform static objects (position, heading)
        data["static_objects"]["position"] = np.matmul(data["static_objects"]["position"] - center_xy, rotate_mat)
        data["static_objects"]["heading"] = np.copy(data["static_objects"]["heading"]) - center_angle

        # Transform map point data (position, vector, orientation)
        data["map"]["point_position"] = np.matmul(data["map"]["point_position"] - center_xy, rotate_mat)
        data["map"]["point_vector"] = np.matmul(data["map"]["point_vector"], rotate_mat)
        data["map"]["point_orientation"] = np.copy(data["map"]["point_orientation"]) - center_angle

        # Transform polygon center data
        data["map"]["polygon_center"] = np.copy(data["map"]["polygon_center"])
        data["map"]["polygon_center"][..., :2] = np.matmul(
            data["map"]["polygon_center"][..., :2] - center_xy, rotate_mat
        )
        data["map"]["polygon_center"][..., 2] = data["map"]["polygon_center"][..., 2] - center_angle

        # Transform polygon position and orientation
        data["map"]["polygon_position"] = np.matmul(data["map"]["polygon_position"] - center_xy, rotate_mat)
        data["map"]["polygon_orientation"] = np.copy(data["map"]["polygon_orientation"]) - center_angle

        # Store transformation parameters for later use
        data["origin"] = center_xy
        data["angle"] = center_angle

        # Transform reference line if present
        if "reference_line" in data:
            data["reference_line"]["position"] = np.matmul(
                data["reference_line"]["position"] - center_xy, rotate_mat
            )
            data["reference_line"]["vector"] = np.matmul(
                data["reference_line"]["vector"], rotate_mat
            )
            data["reference_line"]["orientation"] = np.copy(data["reference_line"]["orientation"]) - center_angle

        return data

    def _trim_candidates(self, candidate_trajectories, ref_free_trajectory, probability):
        """
        Trim and process trajectory candidates using probability-based selection.

        Args:
            candidate_trajectories: Candidate trajectories [n_ref, n_mode, 80, 3] or [n_candidates, 80, 3]
            ref_free_trajectory: Reference-free trajectory (optional)
            probability: Probability scores [n_ref, n_mode] or [n_candidates]

        Returns:
            Tuple containing:
                - sorted_candidate_trajectories: Top-k candidates
                - learning_based_score: Softmax probability scores
        """
        # Handle different output shapes
        if len(candidate_trajectories.shape) == 4:
            n_ref, n_mode, T, C = candidate_trajectories.shape
            candidate_trajectories = candidate_trajectories.reshape(-1, T, C)
            probability = probability.reshape(-1)

        print("==========================")
        print(f"Reference line number: {n_ref}")
        print("==========================")

        # Fallback to reference-free trajectory when no reference lines available
        if n_ref == 0 and ref_free_trajectory is not None:
            sorted_candidate_trajectories = ref_free_trajectory[None, ...]
            learning_based_score = np.array([1.0])  # Single trajectory with probability 1.0
            return sorted_candidate_trajectories, learning_based_score

        # Select top candidates (max 5)
        topk = min(5, len(candidate_trajectories))
        sorted_idx = np.argsort(-probability)
        sorted_candidate_trajectories = candidate_trajectories[sorted_idx][:topk]
        sorted_probability = probability[sorted_idx][:topk]

        # Apply softmax to get learning_based_score
        learning_based_score = softmax(sorted_probability)

        return sorted_candidate_trajectories, learning_based_score
