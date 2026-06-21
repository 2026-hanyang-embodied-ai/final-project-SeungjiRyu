;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::BehaviorTrajectories)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'BehaviorTrajectories (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::BEHAVIORTRAJECTORIES")
  (make-package "AUTOHYU_MSGS::BEHAVIORTRAJECTORIES"))

(in-package "ROS")
;;//! \htmlinclude BehaviorTrajectories.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autohyu_msgs::BehaviorTrajectories
  :super ros::object
  :slots (_header _lk_trajectory _llc_trajectory _rlc_trajectory ))

(defmethod autohyu_msgs::BehaviorTrajectories
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:lk_trajectory __lk_trajectory) (instance autohyu_msgs::BehaviorTrajectory :init))
    ((:llc_trajectory __llc_trajectory) (instance autohyu_msgs::BehaviorTrajectory :init))
    ((:rlc_trajectory __rlc_trajectory) (instance autohyu_msgs::BehaviorTrajectory :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _lk_trajectory __lk_trajectory)
   (setq _llc_trajectory __llc_trajectory)
   (setq _rlc_trajectory __rlc_trajectory)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:lk_trajectory
   (&rest __lk_trajectory)
   (if (keywordp (car __lk_trajectory))
       (send* _lk_trajectory __lk_trajectory)
     (progn
       (if __lk_trajectory (setq _lk_trajectory (car __lk_trajectory)))
       _lk_trajectory)))
  (:llc_trajectory
   (&rest __llc_trajectory)
   (if (keywordp (car __llc_trajectory))
       (send* _llc_trajectory __llc_trajectory)
     (progn
       (if __llc_trajectory (setq _llc_trajectory (car __llc_trajectory)))
       _llc_trajectory)))
  (:rlc_trajectory
   (&rest __rlc_trajectory)
   (if (keywordp (car __rlc_trajectory))
       (send* _rlc_trajectory __rlc_trajectory)
     (progn
       (if __rlc_trajectory (setq _rlc_trajectory (car __rlc_trajectory)))
       _rlc_trajectory)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; autohyu_msgs/BehaviorTrajectory _lk_trajectory
    (send _lk_trajectory :serialization-length)
    ;; autohyu_msgs/BehaviorTrajectory _llc_trajectory
    (send _llc_trajectory :serialization-length)
    ;; autohyu_msgs/BehaviorTrajectory _rlc_trajectory
    (send _rlc_trajectory :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; autohyu_msgs/BehaviorTrajectory _lk_trajectory
       (send _lk_trajectory :serialize s)
     ;; autohyu_msgs/BehaviorTrajectory _llc_trajectory
       (send _llc_trajectory :serialize s)
     ;; autohyu_msgs/BehaviorTrajectory _rlc_trajectory
       (send _rlc_trajectory :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; autohyu_msgs/BehaviorTrajectory _lk_trajectory
     (send _lk_trajectory :deserialize buf ptr-) (incf ptr- (send _lk_trajectory :serialization-length))
   ;; autohyu_msgs/BehaviorTrajectory _llc_trajectory
     (send _llc_trajectory :deserialize buf ptr-) (incf ptr- (send _llc_trajectory :serialization-length))
   ;; autohyu_msgs/BehaviorTrajectory _rlc_trajectory
     (send _rlc_trajectory :deserialize buf ptr-) (incf ptr- (send _rlc_trajectory :serialization-length))
   ;;
   self)
  )

(setf (get autohyu_msgs::BehaviorTrajectories :md5sum-) "52400c4f5560d8aa896438806fcd541e")
(setf (get autohyu_msgs::BehaviorTrajectories :datatype-) "autohyu_msgs/BehaviorTrajectories")
(setf (get autohyu_msgs::BehaviorTrajectories :definition-)
      "std_msgs/Header header 

autohyu_msgs/BehaviorTrajectory lk_trajectory
autohyu_msgs/BehaviorTrajectory llc_trajectory
autohyu_msgs/BehaviorTrajectory rlc_trajectory
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
MSG: autohyu_msgs/BehaviorTrajectory
std_msgs/Header header 
uint32 id
uint16 on_ego

autohyu_msgs/TrajectoryBoundary left_boundary
autohyu_msgs/TrajectoryBoundary right_boundary
autohyu_msgs/SpatialTrajectory spatial_trajectory
autohyu_msgs/TemporalTrajectory temporal_trajectory
autohyu_msgs/BehaviorTrajectoryPoint[] point
================================================================================
MSG: autohyu_msgs/TrajectoryBoundary
autohyu_msgs/TrajectoryBoundaryPoint[] point
================================================================================
MSG: autohyu_msgs/TrajectoryBoundaryPoint
float32 x
float32 y
float32 z
float32 s
float32 n
================================================================================
MSG: autohyu_msgs/SpatialTrajectory
autohyu_msgs/SpatialTrajectoryPoint[] point
================================================================================
MSG: autohyu_msgs/SpatialTrajectoryPoint
float32 x
float32 y
float32 z
bool on_shortest_path
int16 lane_num
================================================================================
MSG: autohyu_msgs/TemporalTrajectory
autohyu_msgs/TemporalTrajectoryPoint[] point
================================================================================
MSG: autohyu_msgs/TemporalTrajectoryPoint
float32 time
float32 distance
float32 curvature
float32 speed
float32 ref_speed
================================================================================
MSG: autohyu_msgs/BehaviorTrajectoryPoint
float64 time
float64 distance
float64 x
float64 y
float64 z
float64 curvature
float64 speed
float64 max_speed
bool    on_shortest_path
int16   lane_num
")



(provide :autohyu_msgs/BehaviorTrajectories "52400c4f5560d8aa896438806fcd541e")


