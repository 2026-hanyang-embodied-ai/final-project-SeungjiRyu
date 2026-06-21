;; Auto-generated. Do not edit!


(when (boundp 'carmaker_msgs::Objects)
  (if (not (find-package "CARMAKER_MSGS"))
    (make-package "CARMAKER_MSGS"))
  (shadow 'Objects (find-package "CARMAKER_MSGS")))
(unless (find-package "CARMAKER_MSGS::OBJECTS")
  (make-package "CARMAKER_MSGS::OBJECTS"))

(in-package "ROS")
;;//! \htmlinclude Objects.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass carmaker_msgs::Objects
  :super ros::object
  :slots (_header _number_of_objects _object ))

(defmethod carmaker_msgs::Objects
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:number_of_objects __number_of_objects) 0)
    ((:object __object) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _number_of_objects (round __number_of_objects))
   (setq _object __object)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:number_of_objects
   (&optional __number_of_objects)
   (if __number_of_objects (setq _number_of_objects __number_of_objects)) _number_of_objects)
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
    ;; uint16 _number_of_objects
    2
    ;; carmaker_msgs/Object[] _object
    (apply #'+ (send-all _object :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint16 _number_of_objects
       (write-word _number_of_objects s)
     ;; carmaker_msgs/Object[] _object
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
   ;; uint16 _number_of_objects
     (setq _number_of_objects (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; carmaker_msgs/Object[] _object
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _object (let (r) (dotimes (i n) (push (instance carmaker_msgs::Object :init) r)) r))
     (dolist (elem- _object)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get carmaker_msgs::Objects :md5sum-) "aa0a3829c7ec278c7f0d3560362836b3")
(setf (get carmaker_msgs::Objects :datatype-) "carmaker_msgs/Objects")
(setf (get carmaker_msgs::Objects :definition-)
      "# std_msgs/Header
std_msgs/Header header

# object information
uint16 number_of_objects
carmaker_msgs/Object[] object


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
MSG: carmaker_msgs/Object
# Object information
uint8 id
uint8 classification
uint8 lane_id

float32 length 
float32 width 
float32 height 

carmaker_msgs/ObjectState state

================================================================================
MSG: carmaker_msgs/ObjectState
float64 latitude                  # GCS Coordinates latitude
float64 longitude                 # GCS Coordinates longitude
float64 elevation                 # GCS Coordinates elevation

float64 x
float64 y
float64 z

float32 roll                      # yaw in vehicle coordinates [rad]
float32 pitch                     # yaw in vehicle coordinates [rad]
float32 yaw                       # yaw in vehicle coordinates [rad]
float32 ego_roll                      # yaw in vehicle coordinates [rad]
float32 ego_pitch                     # yaw in vehicle coordinates [rad]
float32 ego_yaw                       # yaw in vehicle coordinates [rad]

float32 roll_rate                      # yaw in vehicle coordinates [rad]
float32 pitch_rate                     # yaw in vehicle coordinates [rad]
float32 yaw_rate                       # yaw in vehicle coordinates [rad]

float32 v_x                       # velocity in vehicle coordinates [m/s]
float32 v_y                       # velocity in vehicle coordinates [m/s]
float32 a_x                       # acceleration in vehicle coordinates [m/s^2]
float32 a_y                       # acceleration in vehicle coordinates [m/s^2]

")



(provide :carmaker_msgs/Objects "aa0a3829c7ec278c7f0d3560362836b3")


