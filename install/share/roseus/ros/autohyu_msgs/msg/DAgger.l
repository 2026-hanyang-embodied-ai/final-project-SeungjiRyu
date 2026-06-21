;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::DAgger)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'DAgger (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::DAGGER")
  (make-package "AUTOHYU_MSGS::DAGGER"))

(in-package "ROS")
;;//! \htmlinclude DAgger.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autohyu_msgs::DAgger
  :super ros::object
  :slots (_header _record_on ))

(defmethod autohyu_msgs::DAgger
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:record_on __record_on) (instance std_msgs::Bool :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _record_on __record_on)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:record_on
   (&rest __record_on)
   (if (keywordp (car __record_on))
       (send* _record_on __record_on)
     (progn
       (if __record_on (setq _record_on (car __record_on)))
       _record_on)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; std_msgs/Bool _record_on
    (send _record_on :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; std_msgs/Bool _record_on
       (send _record_on :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; std_msgs/Bool _record_on
     (send _record_on :deserialize buf ptr-) (incf ptr- (send _record_on :serialization-length))
   ;;
   self)
  )

(setf (get autohyu_msgs::DAgger :md5sum-) "f7c10e3ecafdc8a9a12d9f0d5b4878c3")
(setf (get autohyu_msgs::DAgger :datatype-) "autohyu_msgs/DAgger")
(setf (get autohyu_msgs::DAgger :definition-)
      "std_msgs/Header header
std_msgs/Bool record_on
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
MSG: std_msgs/Bool
bool data
")



(provide :autohyu_msgs/DAgger "f7c10e3ecafdc8a9a12d9f0d5b4878c3")


