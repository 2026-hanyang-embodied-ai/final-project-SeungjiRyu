;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::DetectObjects2D)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'DetectObjects2D (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::DETECTOBJECTS2D")
  (make-package "AUTOHYU_MSGS::DETECTOBJECTS2D"))

(in-package "ROS")
;;//! \htmlinclude DetectObjects2D.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autohyu_msgs::DetectObjects2D
  :super ros::object
  :slots (_header _object ))

(defmethod autohyu_msgs::DetectObjects2D
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
    ;; autohyu_msgs/DetectObject2D[] _object
    (apply #'+ (send-all _object :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; autohyu_msgs/DetectObject2D[] _object
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
   ;; autohyu_msgs/DetectObject2D[] _object
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _object (let (r) (dotimes (i n) (push (instance autohyu_msgs::DetectObject2D :init) r)) r))
     (dolist (elem- _object)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get autohyu_msgs::DetectObjects2D :md5sum-) "c9daa7985f7897288ddef8e4faf2a73b")
(setf (get autohyu_msgs::DetectObjects2D :datatype-) "autohyu_msgs/DetectObjects2D")
(setf (get autohyu_msgs::DetectObjects2D :definition-)
      "# std_msgs/Header
std_msgs/Header header

# object information
autohyu_msgs/DetectObject2D[] object

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
MSG: autohyu_msgs/DetectObject2D
# Object information
uint32 id
float32 confidence_score
uint8 classification

autohyu_msgs/ObjectDimension dimension
autohyu_msgs/Object2DState   state

================================================================================
MSG: autohyu_msgs/ObjectDimension
float32 length
float32 width
float32 height

================================================================================
MSG: autohyu_msgs/Object2DState
std_msgs/Header header

float32 x
float32 y
")



(provide :autohyu_msgs/DetectObjects2D "c9daa7985f7897288ddef8e4faf2a73b")


