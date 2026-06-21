;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::DetectObject2D)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'DetectObject2D (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::DETECTOBJECT2D")
  (make-package "AUTOHYU_MSGS::DETECTOBJECT2D"))

(in-package "ROS")
;;//! \htmlinclude DetectObject2D.msg.html


(defclass autohyu_msgs::DetectObject2D
  :super ros::object
  :slots (_id _confidence_score _classification _dimension _state ))

(defmethod autohyu_msgs::DetectObject2D
  (:init
   (&key
    ((:id __id) 0)
    ((:confidence_score __confidence_score) 0.0)
    ((:classification __classification) 0)
    ((:dimension __dimension) (instance autohyu_msgs::ObjectDimension :init))
    ((:state __state) (instance autohyu_msgs::Object2DState :init))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _confidence_score (float __confidence_score))
   (setq _classification (round __classification))
   (setq _dimension __dimension)
   (setq _state __state)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:confidence_score
   (&optional __confidence_score)
   (if __confidence_score (setq _confidence_score __confidence_score)) _confidence_score)
  (:classification
   (&optional __classification)
   (if __classification (setq _classification __classification)) _classification)
  (:dimension
   (&rest __dimension)
   (if (keywordp (car __dimension))
       (send* _dimension __dimension)
     (progn
       (if __dimension (setq _dimension (car __dimension)))
       _dimension)))
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
    ;; float32 _confidence_score
    4
    ;; uint8 _classification
    1
    ;; autohyu_msgs/ObjectDimension _dimension
    (send _dimension :serialization-length)
    ;; autohyu_msgs/Object2DState _state
    (send _state :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _id
       (write-long _id s)
     ;; float32 _confidence_score
       (sys::poke _confidence_score (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _classification
       (write-byte _classification s)
     ;; autohyu_msgs/ObjectDimension _dimension
       (send _dimension :serialize s)
     ;; autohyu_msgs/Object2DState _state
       (send _state :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _confidence_score
     (setq _confidence_score (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _classification
     (setq _classification (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; autohyu_msgs/ObjectDimension _dimension
     (send _dimension :deserialize buf ptr-) (incf ptr- (send _dimension :serialization-length))
   ;; autohyu_msgs/Object2DState _state
     (send _state :deserialize buf ptr-) (incf ptr- (send _state :serialization-length))
   ;;
   self)
  )

(setf (get autohyu_msgs::DetectObject2D :md5sum-) "5ef689afa95065f4db255a3c6a3ebf00")
(setf (get autohyu_msgs::DetectObject2D :datatype-) "autohyu_msgs/DetectObject2D")
(setf (get autohyu_msgs::DetectObject2D :definition-)
      "# Object information
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



(provide :autohyu_msgs/DetectObject2D "5ef689afa95065f4db255a3c6a3ebf00")


