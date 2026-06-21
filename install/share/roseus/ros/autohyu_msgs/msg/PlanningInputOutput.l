;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::PlanningInputOutput)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'PlanningInputOutput (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::PLANNINGINPUTOUTPUT")
  (make-package "AUTOHYU_MSGS::PLANNINGINPUTOUTPUT"))

(in-package "ROS")
;;//! \htmlinclude PlanningInputOutput.msg.html


(defclass autohyu_msgs::PlanningInputOutput
  :super ros::object
  :slots (_planning_space _trajectory ))

(defmethod autohyu_msgs::PlanningInputOutput
  (:init
   (&key
    ((:planning_space __planning_space) (instance autohyu_msgs::PlanningSpace :init))
    ((:trajectory __trajectory) (instance autohyu_msgs::Trajectory :init))
    )
   (send-super :init)
   (setq _planning_space __planning_space)
   (setq _trajectory __trajectory)
   self)
  (:planning_space
   (&rest __planning_space)
   (if (keywordp (car __planning_space))
       (send* _planning_space __planning_space)
     (progn
       (if __planning_space (setq _planning_space (car __planning_space)))
       _planning_space)))
  (:trajectory
   (&rest __trajectory)
   (if (keywordp (car __trajectory))
       (send* _trajectory __trajectory)
     (progn
       (if __trajectory (setq _trajectory (car __trajectory)))
       _trajectory)))
  (:serialization-length
   ()
   (+
    ;; autohyu_msgs/PlanningSpace _planning_space
    (send _planning_space :serialization-length)
    ;; autohyu_msgs/Trajectory _trajectory
    (send _trajectory :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; autohyu_msgs/PlanningSpace _planning_space
       (send _planning_space :serialize s)
     ;; autohyu_msgs/Trajectory _trajectory
       (send _trajectory :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; autohyu_msgs/PlanningSpace _planning_space
     (send _planning_space :deserialize buf ptr-) (incf ptr- (send _planning_space :serialization-length))
   ;; autohyu_msgs/Trajectory _trajectory
     (send _trajectory :deserialize buf ptr-) (incf ptr- (send _trajectory :serialization-length))
   ;;
   self)
  )

(setf (get autohyu_msgs::PlanningInputOutput :md5sum-) "e3bbd898c147fd581aa2270138357337")
(setf (get autohyu_msgs::PlanningInputOutput :datatype-) "autohyu_msgs/PlanningInputOutput")
(setf (get autohyu_msgs::PlanningInputOutput :definition-)
      "autohyu_msgs/PlanningSpace planning_space
autohyu_msgs/Trajectory    trajectory

================================================================================
MSG: autohyu_msgs/PlanningSpace
std_msgs/Header header

# Ego
autohyu_msgs/PlanningSpaceEgo ego

# Objects
autohyu_msgs/PlanningSpaceObject[] objects

# Vector Map
autohyu_msgs/PlanningSpaceVectorMap[] lanes
autohyu_msgs/PlanningSpaceVectorMap[] routes
autohyu_msgs/PlanningSpaceVectorMap[] crosswalks
autohyu_msgs/PlanningSpaceVectorMap[] goal_routes
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: autohyu_msgs/PlanningSpaceEgo
autohyu_msgs/PlanningSpaceState[] state

================================================================================
MSG: autohyu_msgs/PlanningSpaceState
float64 stamp
float64 x
float64 y
float64 heading
float64 vx
float64 vy
float64 ax
float64 ay
float64 tire_angle
================================================================================
MSG: autohyu_msgs/PlanningSpaceObject
uint64  id
float64 length
float64 width
float64 height
uint16  classification

autohyu_msgs/PlanningSpaceState[] state
================================================================================
MSG: autohyu_msgs/PlanningSpaceVectorMap
int64 id
bool is_dividing_lane
int64 traffic_light_id
int32 traffic_light_color
float64 max_speed
autohyu_msgs/PlanningSpacePoint[] point
autohyu_msgs/PlanningSpacePoint[] left_boundary
autohyu_msgs/PlanningSpacePoint[] right_boundary
================================================================================
MSG: autohyu_msgs/PlanningSpacePoint
float64 x
float64 y
float64 heading
string  traffic_light_id
uint16  traffic_light_color
================================================================================
MSG: autohyu_msgs/Trajectory
# std_msgs/Header
std_msgs/Header header

uint16 id
autohyu_msgs/TrajectoryPoint[] point
================================================================================
MSG: autohyu_msgs/TrajectoryPoint
float32 time
float32 distance
uint16  direction
float32 x
float32 y
float32 z
float32 yaw
float32 curvature
float32 speed
float32 acceleration
")



(provide :autohyu_msgs/PlanningInputOutput "e3bbd898c147fd581aa2270138357337")


