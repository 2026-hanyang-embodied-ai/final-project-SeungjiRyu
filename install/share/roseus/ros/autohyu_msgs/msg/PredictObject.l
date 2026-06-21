;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::PredictObject)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'PredictObject (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::PREDICTOBJECT")
  (make-package "AUTOHYU_MSGS::PREDICTOBJECT"))

(in-package "ROS")
;;//! \htmlinclude PredictObject.msg.html


(defclass autohyu_msgs::PredictObject
  :super ros::object
  :slots (_id _classification _dynamic_state _dimension _state_multi _state ))

(defmethod autohyu_msgs::PredictObject
  (:init
   (&key
    ((:id __id) 0)
    ((:classification __classification) 0)
    ((:dynamic_state __dynamic_state) 0)
    ((:dimension __dimension) (instance autohyu_msgs::ObjectDimension :init))
    ((:state_multi __state_multi) ())
    ((:state __state) ())
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _classification (round __classification))
   (setq _dynamic_state (round __dynamic_state))
   (setq _dimension __dimension)
   (setq _state_multi __state_multi)
   (setq _state __state)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:classification
   (&optional __classification)
   (if __classification (setq _classification __classification)) _classification)
  (:dynamic_state
   (&optional __dynamic_state)
   (if __dynamic_state (setq _dynamic_state __dynamic_state)) _dynamic_state)
  (:dimension
   (&rest __dimension)
   (if (keywordp (car __dimension))
       (send* _dimension __dimension)
     (progn
       (if __dimension (setq _dimension (car __dimension)))
       _dimension)))
  (:state_multi
   (&rest __state_multi)
   (if (keywordp (car __state_multi))
       (send* _state_multi __state_multi)
     (progn
       (if __state_multi (setq _state_multi (car __state_multi)))
       _state_multi)))
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
    ;; uint32 _id
    4
    ;; uint8 _classification
    1
    ;; uint8 _dynamic_state
    1
    ;; autohyu_msgs/ObjectDimension _dimension
    (send _dimension :serialization-length)
    ;; autohyu_msgs/PredictObjectMultimodal[] _state_multi
    (apply #'+ (send-all _state_multi :serialization-length)) 4
    ;; autohyu_msgs/Object3DState[] _state
    (apply #'+ (send-all _state :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _id
       (write-long _id s)
     ;; uint8 _classification
       (write-byte _classification s)
     ;; uint8 _dynamic_state
       (write-byte _dynamic_state s)
     ;; autohyu_msgs/ObjectDimension _dimension
       (send _dimension :serialize s)
     ;; autohyu_msgs/PredictObjectMultimodal[] _state_multi
     (write-long (length _state_multi) s)
     (dolist (elem _state_multi)
       (send elem :serialize s)
       )
     ;; autohyu_msgs/Object3DState[] _state
     (write-long (length _state) s)
     (dolist (elem _state)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _classification
     (setq _classification (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _dynamic_state
     (setq _dynamic_state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; autohyu_msgs/ObjectDimension _dimension
     (send _dimension :deserialize buf ptr-) (incf ptr- (send _dimension :serialization-length))
   ;; autohyu_msgs/PredictObjectMultimodal[] _state_multi
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _state_multi (let (r) (dotimes (i n) (push (instance autohyu_msgs::PredictObjectMultimodal :init) r)) r))
     (dolist (elem- _state_multi)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
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

(setf (get autohyu_msgs::PredictObject :md5sum-) "d31c4c1b4494f87ffdc5cd468578ad3a")
(setf (get autohyu_msgs::PredictObject :datatype-) "autohyu_msgs/PredictObject")
(setf (get autohyu_msgs::PredictObject :definition-)
      "# Object information
uint32 id
uint8 classification
uint8 dynamic_state

autohyu_msgs/ObjectDimension dimension
autohyu_msgs/PredictObjectMultimodal[] state_multi
autohyu_msgs/Object3DState[] state

================================================================================
MSG: autohyu_msgs/ObjectDimension
float32 length
float32 width
float32 height

================================================================================
MSG: autohyu_msgs/PredictObjectMultimodal
float64 probability
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



(provide :autohyu_msgs/PredictObject "d31c4c1b4494f87ffdc5cd468578ad3a")


