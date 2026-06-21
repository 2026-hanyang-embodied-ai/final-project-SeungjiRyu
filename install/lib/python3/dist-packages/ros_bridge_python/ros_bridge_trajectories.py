"""
@file        ros_bridge_trajectories.py
@brief       ROS bridge for trajectories

@authors     Jonghyun Lee (jognhyunlee@hanyang.ac.kr)
             Seungji Ryu (seungjiryu@hanyang.ac.kr)

@date        2024-10-09 created by Jonghyun Lee
             2025-12-01 Refactorized by Seungji Ryu following PEP8 guidelines
"""

import rospy
import copy

from visualization_msgs.msg import Marker, MarkerArray
from geometry_msgs.msg import Point
from autohyu_msgs.msg import Trajectory
from std_msgs.msg import ColorRGBA

from ros_bridge_python.ros_bridge_header import update_header


def UpdateRvizTrajectory(trajectory, r, g, b, a):
    return update_rviz_trajectory(trajectory, r, g, b, a)

def update_rviz_trajectory(trajectory: Trajectory, r: float, g: float, b: float, a: float) -> MarkerArray:
    """
    Create RViz markers for trajectory visualization.

    Args:
        trajectory: Trajectory message to visualize
        r: Red color component (0.0-1.0)
        g: Green color component (0.0-1.0)
        b: Blue color component (0.0-1.0)
        a: Alpha (transparency) component (0.0-1.0)

    Returns:
        MarkerArray containing visualization markers
    """
    msg = MarkerArray()

    path_marker = Marker()
    speed_marker = Marker()
    curvature_marker = Marker()
    trajectory_marker = Marker()

    # Path marker (spatial)
    path_marker.header = update_header(trajectory.header)
    path_marker.ns = "spatial"
    path_marker.id = 0
    path_marker.action = Marker.ADD
    path_marker.type = Marker.LINE_STRIP
    path_marker.lifetime = rospy.Duration(10)
    path_marker.scale.x = 0.5
    path_marker.color.r = r
    path_marker.color.g = g
    path_marker.color.b = b
    path_marker.color.a = a

    # Speed marker (temporal)
    speed_marker.header = update_header(trajectory.header)
    speed_marker.ns = "temporal"
    speed_marker.id = 1
    speed_marker.action = Marker.ADD
    speed_marker.type = Marker.LINE_LIST
    speed_marker.lifetime = rospy.Duration(10)
    speed_marker.scale.x = 0.5
    speed_marker.color.r = r
    speed_marker.color.g = g
    speed_marker.color.b = b
    speed_marker.color.a = a

    # Curvature marker
    curvature_marker.header = update_header(trajectory.header)
    curvature_marker.ns = "curvature"
    curvature_marker.id = 2
    curvature_marker.action = Marker.ADD
    curvature_marker.type = Marker.LINE_LIST
    curvature_marker.lifetime = rospy.Duration(10)
    curvature_marker.scale.x = 0.5
    curvature_marker.color.r = 0.7
    curvature_marker.color.g = 0.0
    curvature_marker.color.b = 0.7
    curvature_marker.color.a = 0.7

    # Trajectory marker (with speed-based colors)
    trajectory_marker.header = update_header(trajectory.header)
    trajectory_marker.ns = "trajectory"
    trajectory_marker.id = 3
    trajectory_marker.action = Marker.ADD
    trajectory_marker.type = Marker.LINE_STRIP
    trajectory_marker.lifetime = rospy.Duration(10)
    trajectory_marker.scale.x = 1.0  # Slimmer trajectory width
    trajectory_marker.color.a = 1.0

    speeds = []
    KPH2MPS = 1 / 3.6  # Convert kilometers per hour to meters per second

    for tpoint in trajectory.point:
        point = Point()
        point.x = tpoint.x
        point.y = tpoint.y
        point.z = tpoint.z

        # Add to path marker
        path_marker.points.append(point)

        # Add to speed marker (LINE_LIST)
        speed_marker.points.append(point)

        # Add to curvature marker (LINE_LIST)
        curvature_marker.points.append(point)

        # Add to trajectory marker if speed > 0
        if tpoint.speed > 0.0:
            trajectory_marker.points.append(point)
            speeds.append(tpoint.speed)

        # Speed vertical line
        speed_point2 = Point()
        speed_point2.x = tpoint.x
        speed_point2.y = tpoint.y
        speed_point2.z = tpoint.speed * KPH2MPS
        speed_marker.points.append(speed_point2)

        # Curvature vertical line
        curvature_point2 = Point()
        curvature_point2.x = tpoint.x
        curvature_point2.y = tpoint.y
        curvature_point2.z = tpoint.curvature * 1000.0
        curvature_marker.points.append(curvature_point2)

    # Add speed-based colors to trajectory marker
    for speed in speeds:
        color = ColorRGBA()
        color.r = r
        color.g = g
        color.b = b
        color.a = a
        trajectory_marker.colors.append(color)

    msg.markers.append(path_marker)
    msg.markers.append(speed_marker)
    msg.markers.append(curvature_marker)
    msg.markers.append(trajectory_marker)

    return msg

def update_rviz_trajectories(trajectories):
    """
    Create RViz markers for multiple trajectories.

    Args:
        trajectories: interface.Trajectories containing multiple trajectory objects
                     Each trajectories.trajectory is a list of interface.Trajectory

    Returns:
        MarkerArray containing visualization markers for all trajectories
    """
    msg = MarkerArray()
    marker_id = 0

    for trajectory in trajectories.trajectory:
        # path_marker
        path_marker = Marker()
        path_marker.header = update_header(trajectory.header)
        path_marker.ns = "spatial"
        path_marker.id = marker_id
        marker_id += 1
        path_marker.action = Marker.ADD
        path_marker.type = Marker.LINE_STRIP
        path_marker.lifetime = rospy.Duration(0.1)

        # speed_marker
        speed_marker = Marker()
        speed_marker.header = copy.deepcopy(path_marker.header)
        speed_marker.ns = "temporal"
        speed_marker.id = marker_id
        marker_id += 1
        speed_marker.action = Marker.ADD
        speed_marker.type = Marker.LINE_LIST
        speed_marker.lifetime = rospy.Duration(0.1)

        # Line width
        path_marker.scale.x = 0.1
        # Speed marker scale same as path marker
        speed_marker.scale.x = path_marker.scale.x

        # Color
        path_marker.color.r = 0.0
        path_marker.color.g = 0.38
        path_marker.color.b = 0.68
        path_marker.color.a = 0.3

        speed_marker.color = copy.deepcopy(path_marker.color)

        # Add points for each trajectory point
        for tpoint in trajectory.point:
            # Path marker point
            path_point = Point()
            path_point.x = tpoint.x
            path_point.y = tpoint.y
            path_point.z = tpoint.z
            path_marker.points.append(path_point)

            # Speed marker (LINE_LIST requires 2 points per line)
            speed_marker.points.append(copy.deepcopy(path_point))  # First point

            # Second point with speed visualization
            speed_point = Point()
            speed_point.x = tpoint.x
            speed_point.y = tpoint.y
            speed_point.z = tpoint.speed * 0.2778  # Convert speed to m/s
            speed_marker.points.append(speed_point)

        # Add to MarkerArray
        msg.markers.append(path_marker)
        msg.markers.append(speed_marker)

    return msg

def update_rviz_prediction(prediction_array, header, r: float, g: float, b: float, a: float) -> MarkerArray:
    """
    Visualize prediction trajectories for multiple agents
    
    Args:
        prediction_array: numpy array with shape (1, A-1, T=80, 2) where A-1 is number of agents excluding ego
        header: ROS header for the markers
        r, g, b, a: color values (0.0-1.0)
    
    Returns:
        MarkerArray: ROS markers for visualization
    """
    msg = MarkerArray()
    
    # Extract prediction data: (1, A-1, 80, 2) -> (A-1, 80, 2)
    predictions = prediction_array[0]  # Remove batch dimension
    
    agent_count = predictions.shape[0]  # A-1
    
    for agent_idx in range(agent_count):
        # Create marker for each agent's predicted trajectory
        prediction_marker = Marker()
        
        # Set header and common marker properties
        prediction_marker.header = update_header(header)
        prediction_marker.header.frame_id = "world"
        prediction_marker.id = agent_idx
        prediction_marker.action = Marker.ADD
        prediction_marker.type = Marker.LINE_STRIP
        prediction_marker.lifetime = rospy.Duration(10)
        prediction_marker.scale.x = 0.3  # Slightly thinner than main trajectory
        prediction_marker.color.r = r
        prediction_marker.color.g = g
        prediction_marker.color.b = b
        prediction_marker.color.a = a
        prediction_marker.ns = f"prediction_agent_{agent_idx}"
        
        # Add points for this agent's trajectory
        agent_trajectory = predictions[agent_idx]  # Shape: (80, 2)
        
        for time_idx in range(agent_trajectory.shape[0]):
            point = Point()
            point.x = agent_trajectory[time_idx, 0]  # x coordinate
            point.y = agent_trajectory[time_idx, 1]  # y coordinate
            point.z = 0.2  # Slightly elevated for visibility
            prediction_marker.points.append(point)
        
        # Only add marker if it has points
        if len(prediction_marker.points) > 0:
            msg.markers.append(prediction_marker)
    
    return msg