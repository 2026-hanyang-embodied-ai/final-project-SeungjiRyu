'''
  @file         interface_header.py
  @brief        interface for header
  
  @authors      Yuseung Na (yuseungna@hanyang.ac.kr)

  @date         2024-07-17 created by Yuseung Na

'''

# Import Python
from dataclasses import dataclass, field
import rospy
# Import Interface

@dataclass
class TimeStamp:
    secs            : int = 0
    nsecs           : int = 0

@dataclass
class Header:
    seq             : int = 0
    stamp           : TimeStamp = field(default_factory=TimeStamp)
    # stamp           : TimeStamp = None
    frame_id        : str = "world"
    