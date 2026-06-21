;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::Trajectories)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'Trajectories (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::TRAJECTORIES")
  (make-package "AUTOHYU_MSGS::TRAJECTORIES"))

(in-package "ROS")
;;//! \htmlinclude Trajectories.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autohyu_msgs::Trajectories
  :super ros::object
  :slots (_header _decision_behavior _trajectory ))

(defmethod autohyu_msgs::Trajectories
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:decision_behavior __decision_behavior) 0)
    ((:trajectory __trajectory) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _decision_behavior (round __decision_behavior))
   (setq _trajectory __trajectory)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:decision_behavior
   (&optional __decision_behavior)
   (if __decision_behavior (setq _decision_behavior __decision_behavior)) _decision_behavior)
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
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _decision_behavior
    1
    ;; autohyu_msgs/Trajectory[] _trajectory
    (apply #'+ (send-all _trajectory :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _decision_behavior
       (write-byte _decision_behavior s)
     ;; autohyu_msgs/Trajectory[] _trajectory
     (write-long (length _trajectory) s)
     (dolist (elem _trajectory)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _decision_behavior
     (setq _decision_behavior (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; autohyu_msgs/Trajectory[] _trajectory
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _trajectory (let (r) (dotimes (i n) (push (instance autohyu_msgs::Trajectory :init) r)) r))
     (dolist (elem- _trajectory)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get autohyu_msgs::Trajectories :md5sum-) "27fa321e14fffefaedd9b3a6ef222cab")
(setf (get autohyu_msgs::Trajectories :datatype-) "autohyu_msgs/Trajectories")
(setf (get autohyu_msgs::Trajectories :definition-)
      "std_msgs/Header header 

uint8 decision_behavior
autohyu_msgs/Trajectory[] trajectory
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



(provide :autohyu_msgs/Trajectories "27fa321e14fffefaedd9b3a6ef222cab")


