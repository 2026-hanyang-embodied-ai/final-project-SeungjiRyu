"""
@file        function_transform.py
@brief       Coordinate transformation utilities for autonomous driving

@date        2025-12-01 Refactorized by Seungji Ryu following PEP8 guidelines
"""

import os
import numpy as np
import torch


# ==============================================================================
# Coordinate Transformation Functions
# ==============================================================================

def global_to_local(ego_origin, ego_yaw, global_points):
    """
    Transform global coordinates to ego-centric local coordinates.

    Args:
        ego_origin: Ego vehicle position in global frame (2D array)
        ego_yaw: Ego vehicle heading in radians
        global_points: Points in global coordinates (2D or 3D array)

    Returns:
        Points transformed to local ego-centric coordinates
    """
    # Trajectory (local)
    local_points = np.zeros_like(global_points)

    # Rotation matrix
    rotation_matrix = np.array([[np.cos(ego_yaw), -np.sin(ego_yaw)],
                                 [np.sin(ego_yaw),  np.cos(ego_yaw)]])

    if global_points.ndim == 2:
        relative_positions = global_points[:, 0:2] - ego_origin
        local_points[:, 0:2] = np.dot(relative_positions, rotation_matrix)
        local_points[:, 2] = global_points[:, 2] - ego_yaw

    if global_points.ndim == 3:
        relative_positions = global_points[:, :, 0:2] - ego_origin
        local_points[:, :, 0:2] = np.dot(relative_positions, rotation_matrix)
        local_points[:, :, 2] = global_points[:, :, 2] - ego_yaw

    return local_points


def global_to_local_location(ego_origin, ego_yaw, global_location):
    """
    Transform global location to ego-centric local location.

    Args:
        ego_origin: Ego vehicle position in global frame
        ego_yaw: Ego vehicle heading in radians
        global_location: Location in global coordinates

    Returns:
        Location transformed to local coordinates
    """
    # Location (local)
    local_location = np.zeros_like(global_location)

    # Rotation matrix
    rotation_matrix = np.array([[np.cos(ego_yaw), -np.sin(ego_yaw)],
                                 [np.sin(ego_yaw),  np.cos(ego_yaw)]])

    if global_location.ndim == 2:
        relative_position = global_location[0:2] - ego_origin
        local_location[0:2] = np.matmul(relative_position, rotation_matrix)

    if global_location.ndim == 3:
        relative_position = global_location[:, 0:2] - ego_origin
        local_location[:, 0:2] = np.matmul(relative_position, rotation_matrix)

    return local_location


def global_to_local_angle(ego_yaw, global_angle):
    """
    Transform global angle to local angle relative to ego heading.

    Args:
        ego_yaw: Ego vehicle heading in radians
        global_angle: Angle in global frame

    Returns:
        Angle in local frame
    """
    # Angle (local)
    local_angle = global_angle - ego_yaw
    return local_angle

def global_to_local_velocity(ego_yaw, global_velocity):
    """
    Transform global velocity to local velocity relative to ego heading.

    Args:
        ego_yaw: Ego vehicle heading in radians
        global_velocity: Velocity in global frame

    Returns:
        Velocity in local frame
    """
    rotation_matrix = np.array([[np.cos(ego_yaw), -np.sin(ego_yaw)],
                                 [np.sin(ego_yaw),  np.cos(ego_yaw)]])
    local_velocity = np.matmul(global_velocity, rotation_matrix)

    return local_velocity


def rotate_round_z_axis(points: np.ndarray, angle: float) -> np.ndarray:
    """
    Rotate points around Z-axis.

    Args:
        points: Points to rotate (numpy array)
        angle: Rotation angle in radians

    Returns:
        Rotated points
    """
    rotate_mat = np.array(
        [[np.cos(angle), -np.sin(angle)], [np.sin(angle), np.cos(angle)]]
    )
    return points @ rotate_mat


def local_to_global(ego_origin, ego_yaw, local_points):
    """
    Transform ego-centric local coordinates to global coordinate system.

    Args:
        ego_origin: Ego's position in global coordinates (shape: (2,))
        ego_yaw: Ego's heading in global frame (radians)
        local_points: Points in local coordinates
            - shape (N, 3): [x, y, heading]
            - shape (Batch, N, 3): 3D tensors also supported

    Returns:
        Points in global coordinate system with same shape as local_points
    """
    # Create an array with the same shape as local_points to store the transformed points
    global_points = np.zeros_like(local_points)

    # Define the rotation matrix for the local -> global transformation.
    rotation_matrix = np.array([
        [np.cos(ego_yaw), -np.sin(ego_yaw)],
        [np.sin(ego_yaw),  np.cos(ego_yaw)]
    ])

    # Case 1: local_points is 2D (N, 3)
    if local_points.ndim == 2:
        # Extract (x, y) from local_points
        xy_local = local_points[:, :2]  # shape: (N, 2)
        # Apply rotation
        rotated_xy = np.dot(xy_local, rotation_matrix.T)  # shape: (N, 2)
        # Translate by ego_origin to obtain global positions
        global_points[:, :2] = rotated_xy + ego_origin
        # For heading, simply add ego_yaw
        global_points[:, 2] = local_points[:, 2] + ego_yaw

    # Case 2: local_points is 3D (Batch, N, 3)
    elif local_points.ndim == 3:
        B, N, _ = local_points.shape

        # Reshape to (B*N, 2) so we can apply np.dot
        xy_local = local_points[:, :, :2].reshape(-1, 2)  # shape: (B*N, 2)
        rotated_xy = np.dot(xy_local, rotation_matrix.T)  # shape: (B*N, 2)
        # Reshape back to (Batch, N, 2)
        rotated_xy = rotated_xy.reshape(B, N, 2)

        # Translate by ego_origin to obtain global positions
        global_points[:, :, :2] = rotated_xy + ego_origin
        # For heading, add ego_yaw
        global_points[:, :, 2] = local_points[:, :, 2] + ego_yaw

    return global_points


# ==============================================================================
# Unit Conversion Functions
# ==============================================================================

def radian_to_degree(radian):
    """
    Convert radians to degrees.

    Args:
        radian: Angle in radians

    Returns:
        Angle in degrees
    """
    return radian * 180 / np.pi


def degree_to_radian(degree):
    """
    Convert degrees to radians.

    Args:
        degree: Angle in degrees

    Returns:
        Angle in radians
    """
    return degree * np.pi / 180


def ax_to_steer_brake(ax):
    """
    Convert longitudinal acceleration to separate accel/brake commands.

    Args:
        ax: Longitudinal acceleration (positive = accel, negative = brake)

    Returns:
        Tuple of (accel, brake) where negative values become 0
    """
    ax = np.asarray(ax)

    # Use numpy vectorized operation to select values based on condition
    accel = np.where(ax > 0, ax, 0)
    brake = np.where(ax < 0, -ax, 0)

    return accel, brake


# ==============================================================================
# Data Extraction Functions
# ==============================================================================

def bag_time_sync(bag, topics, dst_path, data_type):
    """
    Extract and synchronize data from ROS bag file.

    Args:
        bag: ROS bag file object
        topics: List of topics to extract
        dst_path: Destination path for saved data
        data_type: Type identifier for saved files

    Returns:
        None (saves data to disk)
    """
    # Extract key-value pairs
    for idx, (topic, msg, t) in enumerate(bag.read_messages(topics=topics)):
        # vehicle_state
        ego_origin = np.array([msg.vehicle_state.x, msg.vehicle_state.y])
        ego_yaw = msg.vehicle_state.yaw
        ego_velocity = np.array([msg.vehicle_state.vx, msg.vehicle_state.vy])
        ego_acceleration = np.array([msg.vehicle_state.ax, msg.vehicle_state.ay])
        ego_tire_angle = msg.vehicle_state.vehicle_can.steering_tire_angle
        ego_yaw_rate = msg.vehicle_state.yaw_vel

        # target_value (ax / steer)
        target_value = msg.command_output

        # trajectory (global)
        num_of_points = len(msg.trajectory.point)
        trajectory_points_global = np.zeros((num_of_points, 4)) # x, y, yaw, speed
        for point_idx in range(num_of_points):
            trajectory_points_global[point_idx, 0] = msg.trajectory.point[point_idx].x
            trajectory_points_global[point_idx, 1] = msg.trajectory.point[point_idx].y
            trajectory_points_global[point_idx, 2] = msg.trajectory.point[point_idx].yaw
            trajectory_points_global[point_idx, 3] = msg.trajectory.point[point_idx].speed

        # trajectory (local)
        trajectory_points_local = global_to_local(ego_origin, ego_yaw, trajectory_points_global)

        dict_data = {
            'ego_origin': ego_origin,
            'ego_yaw': ego_yaw,
            'ego_velocity': ego_velocity,
            'ego_acceleration': ego_acceleration,
            'ego_tire_angle': ego_tire_angle,
            'ego_yaw_rate': ego_yaw_rate,
            'trajectory_points_local': trajectory_points_local,
            'target_value': target_value
        }
        torch.save(dict_data, os.path.join(dst_path, "{}_{:05d}.pt".format(data_type, idx)))