'''
  @file         interface_objects.py
  @brief        interface for objects
  
  @authors      Minwon Lee (minwonlee@hanyang.ac.kr)

  @date         2026-03-03 created by Minwon Lee

'''

# Import Python
from dataclasses import dataclass, field
import rospy
# Import Interface

class TrafficLightType:
    RED_YELLOW_GREEN        = 0
    RED_YELLOW_LEFT         = 1
    RED_YELLOW_LEFT_GREEN   = 2
    YELLOW_YELLOW_YELLOW    = 100

class TrafficLightColor:
    OFF          = 0
    GREEN        = 1
    YELLOW       = 2
    RED          = 3
    RED_YELLOW   = 4

class ObjectClass:
    UNKNOWN = 0
    CAR = 1
    BICYCLE = 2
    MOTORCYCLE = 3
    TRUCK = 4
    PEDESTRIAN = 5
    BARRIER = 7
