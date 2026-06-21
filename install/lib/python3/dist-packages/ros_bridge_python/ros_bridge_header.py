"""
@file        ros_bridge_header.py
@brief       ROS bridge for header

@authors     Yuseung Na (yuseungna@hanyang.ac.kr)

@date        2024-07-17 created by Yuseung Na
             2025-12-01 Refactorized by Seungji Ryu following PEP8 guidelines
"""

# Import Python
import sys
import os

# Import ROS
import rospy

# Import ROS Message
import std_msgs.msg as std_msgs

# Import Interface
from interface_python import interface_header


# ==============================================================================
# Get Functions
# ==============================================================================

def get_header(msg: std_msgs.Header) -> interface_header.Header:
    """
    Convert ROS Header to interface Header.

    Args:
        msg: ROS std_msgs.Header

    Returns:
        interface_header.Header object
    """
    header = interface_header.Header()

    header.seq = msg.seq
    header.stamp = msg.stamp
    # header.stamp = float(msg.stamp.secs) + float(msg.stamp.nsecs) * 1e-9
    header.frame_id = msg.frame_id

    return header


# ==============================================================================
# Update Functions
# ==============================================================================

def UpdateHeader(header: interface_header.Header) -> std_msgs.Header:
    return update_header(header)

def update_header(header: interface_header.Header) -> std_msgs.Header:
    """
    Convert interface Header to ROS Header.

    Args:
        header: interface_header.Header object

    Returns:
        ROS std_msgs.Header
    """
    msg = std_msgs.Header()

    msg.seq = header.seq
    msg.stamp = header.stamp
    msg.frame_id = header.frame_id

    return msg
