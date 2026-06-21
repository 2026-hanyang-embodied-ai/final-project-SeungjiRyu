;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::BehaviorTrajectory)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'BehaviorTrajectory (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::BEHAVIORTRAJECTORY")
  (make-package "AUTOHYU_MSGS::BEHAVIORTRAJECTORY"))

(in-package "ROS")
;;//! \htmlinclude BehaviorTrajectory.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autohyu_msgs::BehaviorTrajectory
  :super ros::object
  :slots (_header _id _on_ego _left_boundary _right_boundary _spatial_trajectory _temporal_trajectory _point ))

(defmethod autohyu_msgs::BehaviorTrajectory
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:id __id) 0)
    ((:on_ego __on_ego) 0)
    ((:left_boundary __left_boundary) (instance autohyu_msgs::TrajectoryBoundary :init))
    ((:right_boundary __right_boundary) (instance autohyu_msgs::TrajectoryBoundary :init))
    ((:spatial_trajectory __spatial_trajectory) (instance autohyu_msgs::SpatialTrajectory :init))
    ((:temporal_trajectory __temporal_trajectory) (instance autohyu_msgs::TemporalTrajectory :init))
    ((:point __point) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _id (round __id))
   (setq _on_ego (round __on_ego))
   (setq _left_boundary __left_boundary)
   (setq _right_boundary __right_boundary)
   (setq _spatial_trajectory __spatial_trajectory)
   (setq _temporal_trajectory __temporal_trajectory)
   (setq _point __point)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:on_ego
   (&optional __on_ego)
   (if __on_ego (setq _on_ego __on_ego)) _on_ego)
  (:left_boundary
   (&rest __left_boundary)
   (if (keywordp (car __left_boundary))
       (send* _left_boundary __left_boundary)
     (progn
       (if __left_boundary (setq _left_boundary (car __left_boundary)))
       _left_boundary)))
  (:right_boundary
   (&rest __right_boundary)
   (if (keywordp (car __right_boundary))
       (send* _right_boundary __right_boundary)
     (progn
       (if __right_boundary (setq _right_boundary (car __right_boundary)))
       _right_boundary)))
  (:spatial_trajectory
   (&rest __spatial_trajectory)
   (if (keywordp (car __spatial_trajectory))
       (send* _spatial_trajectory __spatial_trajectory)
     (progn
       (if __spatial_trajectory (setq _spatial_trajectory (car __spatial_trajectory)))
       _spatial_trajectory)))
  (:temporal_trajectory
   (&rest __temporal_trajectory)
   (if (keywordp (car __temporal_trajectory))
       (send* _temporal_trajectory __temporal_trajectory)
     (progn
       (if __temporal_trajectory (setq _temporal_trajectory (car __temporal_trajectory)))
       _temporal_trajectory)))
  (:point
   (&rest __point)
   (if (keywordp (car __point))
       (send* _point __point)
     (progn
       (if __point (setq _point (car __point)))
       _point)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _id
    4
    ;; uint16 _on_ego
    2
    ;; autohyu_msgs/TrajectoryBoundary _left_boundary
    (send _left_boundary :serialization-length)
    ;; autohyu_msgs/TrajectoryBoundary _right_boundary
    (send _right_boundary :serialization-length)
    ;; autohyu_msgs/SpatialTrajectory _spatial_trajectory
    (send _spatial_trajectory :serialization-length)
    ;; autohyu_msgs/TemporalTrajectory _temporal_trajectory
    (send _temporal_trajectory :serialization-length)
    ;; autohyu_msgs/BehaviorTrajectoryPoint[] _point
    (apply #'+ (send-all _point :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint32 _id
       (write-long _id s)
     ;; uint16 _on_ego
       (write-word _on_ego s)
     ;; autohyu_msgs/TrajectoryBoundary _left_boundary
       (send _left_boundary :serialize s)
     ;; autohyu_msgs/TrajectoryBoundary _right_boundary
       (send _right_boundary :serialize s)
     ;; autohyu_msgs/SpatialTrajectory _spatial_trajectory
       (send _spatial_trajectory :serialize s)
     ;; autohyu_msgs/TemporalTrajectory _temporal_trajectory
       (send _temporal_trajectory :serialize s)
     ;; autohyu_msgs/BehaviorTrajectoryPoint[] _point
     (write-long (length _point) s)
     (dolist (elem _point)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint16 _on_ego
     (setq _on_ego (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; autohyu_msgs/TrajectoryBoundary _left_boundary
     (send _left_boundary :deserialize buf ptr-) (incf ptr- (send _left_boundary :serialization-length))
   ;; autohyu_msgs/TrajectoryBoundary _right_boundary
     (send _right_boundary :deserialize buf ptr-) (incf ptr- (send _right_boundary :serialization-length))
   ;; autohyu_msgs/SpatialTrajectory _spatial_trajectory
     (send _spatial_trajectory :deserialize buf ptr-) (incf ptr- (send _spatial_trajectory :serialization-length))
   ;; autohyu_msgs/TemporalTrajectory _temporal_trajectory
     (send _temporal_trajectory :deserialize buf ptr-) (incf ptr- (send _temporal_trajectory :serialization-length))
   ;; autohyu_msgs/BehaviorTrajectoryPoint[] _point
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _point (let (r) (dotimes (i n) (push (instance autohyu_msgs::BehaviorTrajectoryPoint :init) r)) r))
     (dolist (elem- _point)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get autohyu_msgs::BehaviorTrajectory :md5sum-) "618077a927e8fc3bc8c10db54e2ae18e")
(setf (get autohyu_msgs::BehaviorTrajectory :datatype-) "autohyu_msgs/BehaviorTrajectory")
(setf (get autohyu_msgs::BehaviorTrajectory :definition-)
      "std_msgs/Header header 
uint32 id
uint16 on_ego

autohyu_msgs/TrajectoryBoundary left_boundary
autohyu_msgs/TrajectoryBoundary right_boundary
autohyu_msgs/SpatialTrajectory spatial_trajectory
autohyu_msgs/TemporalTrajectory temporal_trajectory
autohyu_msgs/BehaviorTrajectoryPoint[] point
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



(provide :autohyu_msgs/BehaviorTrajectory "618077a927e8fc3bc8c10db54e2ae18e")


