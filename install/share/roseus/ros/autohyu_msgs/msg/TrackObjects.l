;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::TrackObjects)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'TrackObjects (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::TRACKOBJECTS")
  (make-package "AUTOHYU_MSGS::TRACKOBJECTS"))

(in-package "ROS")
;;//! \htmlinclude TrackObjects.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autohyu_msgs::TrackObjects
  :super ros::object
  :slots (_header _object ))

(defmethod autohyu_msgs::TrackObjects
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:object __object) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _object __object)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:object
   (&rest __object)
   (if (keywordp (car __object))
       (send* _object __object)
     (progn
       (if __object (setq _object (car __object)))
       _object)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; autohyu_msgs/TrackObject[] _object
    (apply #'+ (send-all _object :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; autohyu_msgs/TrackObject[] _object
     (write-long (length _object) s)
     (dolist (elem _object)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; autohyu_msgs/TrackObject[] _object
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _object (let (r) (dotimes (i n) (push (instance autohyu_msgs::TrackObject :init) r)) r))
     (dolist (elem- _object)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get autohyu_msgs::TrackObjects :md5sum-) "381409c32db5856b200858e200048b06")
(setf (get autohyu_msgs::TrackObjects :datatype-) "autohyu_msgs/TrackObjects")
(setf (get autohyu_msgs::TrackObjects :definition-)
      "# std_msgs/Header
std_msgs/Header header

# object information
autohyu_msgs/TrackObject[] object

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
MSG: autohyu_msgs/TrackObject
# Object information
uint32 id
uint8 classification
uint8 dynamic_state

autohyu_msgs/ObjectDimension dimension
autohyu_msgs/Object3DState state
autohyu_msgs/Object3DState state_covariance

================================================================================
MSG: autohyu_msgs/ObjectDimension
float32 length
float32 width
float32 height

================================================================================
MSG: autohyu_msgs/Object3DState
std_msgs/Header header

float32 x
float32 y
float32 z
float32 vx
float32 vy
float32 vz
float32 ax
float32 ay
float32 az
float32 roll
float32 pitch
float32 yaw
float32 roll_rate
float32 pitch_rate
float32 yaw_rate
")



(provide :autohyu_msgs/TrackObjects "381409c32db5856b200858e200048b06")


