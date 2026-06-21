;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::PredictObjectMultimodal)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'PredictObjectMultimodal (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::PREDICTOBJECTMULTIMODAL")
  (make-package "AUTOHYU_MSGS::PREDICTOBJECTMULTIMODAL"))

(in-package "ROS")
;;//! \htmlinclude PredictObjectMultimodal.msg.html


(defclass autohyu_msgs::PredictObjectMultimodal
  :super ros::object
  :slots (_probability _state ))

(defmethod autohyu_msgs::PredictObjectMultimodal
  (:init
   (&key
    ((:probability __probability) 0.0)
    ((:state __state) ())
    )
   (send-super :init)
   (setq _probability (float __probability))
   (setq _state __state)
   self)
  (:probability
   (&optional __probability)
   (if __probability (setq _probability __probability)) _probability)
  (:state
   (&rest __state)
   (if (keywordp (car __state))
       (send* _state __state)
     (progn
       (if __state (setq _state (car __state)))
       _state)))
  (:serialization-length
   ()
   (+
    ;; float64 _probability
    8
    ;; autohyu_msgs/Object3DState[] _state
    (apply #'+ (send-all _state :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _probability
       (sys::poke _probability (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; autohyu_msgs/Object3DState[] _state
     (write-long (length _state) s)
     (dolist (elem _state)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _probability
     (setq _probability (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; autohyu_msgs/Object3DState[] _state
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _state (let (r) (dotimes (i n) (push (instance autohyu_msgs::Object3DState :init) r)) r))
     (dolist (elem- _state)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get autohyu_msgs::PredictObjectMultimodal :md5sum-) "e868992cb116d83b95c7a79f81110f59")
(setf (get autohyu_msgs::PredictObjectMultimodal :datatype-) "autohyu_msgs/PredictObjectMultimodal")
(setf (get autohyu_msgs::PredictObjectMultimodal :definition-)
      "float64 probability
autohyu_msgs/Object3DState[] state

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

")



(provide :autohyu_msgs/PredictObjectMultimodal "e868992cb116d83b95c7a79f81110f59")


