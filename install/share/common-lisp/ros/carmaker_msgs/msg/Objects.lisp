; Auto-generated. Do not edit!


(cl:in-package carmaker_msgs-msg)


;//! \htmlinclude Objects.msg.html

(cl:defclass <Objects> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (number_of_objects
    :reader number_of_objects
    :initarg :number_of_objects
    :type cl:fixnum
    :initform 0)
   (object
    :reader object
    :initarg :object
    :type (cl:vector carmaker_msgs-msg:Object)
   :initform (cl:make-array 0 :element-type 'carmaker_msgs-msg:Object :initial-element (cl:make-instance 'carmaker_msgs-msg:Object))))
)

(cl:defclass Objects (<Objects>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Objects>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Objects)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name carmaker_msgs-msg:<Objects> is deprecated: use carmaker_msgs-msg:Objects instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Objects>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carmaker_msgs-msg:header-val is deprecated.  Use carmaker_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'number_of_objects-val :lambda-list '(m))
(cl:defmethod number_of_objects-val ((m <Objects>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carmaker_msgs-msg:number_of_objects-val is deprecated.  Use carmaker_msgs-msg:number_of_objects instead.")
  (number_of_objects m))

(cl:ensure-generic-function 'object-val :lambda-list '(m))
(cl:defmethod object-val ((m <Objects>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carmaker_msgs-msg:object-val is deprecated.  Use carmaker_msgs-msg:object instead.")
  (object m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Objects>) ostream)
  "Serializes a message object of type '<Objects>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'number_of_objects)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'number_of_objects)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'object))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'object))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Objects>) istream)
  "Deserializes a message object of type '<Objects>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'number_of_objects)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'number_of_objects)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'object) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'object)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'carmaker_msgs-msg:Object))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Objects>)))
  "Returns string type for a message object of type '<Objects>"
  "carmaker_msgs/Objects")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Objects)))
  "Returns string type for a message object of type 'Objects"
  "carmaker_msgs/Objects")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Objects>)))
  "Returns md5sum for a message object of type '<Objects>"
  "aa0a3829c7ec278c7f0d3560362836b3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Objects)))
  "Returns md5sum for a message object of type 'Objects"
  "aa0a3829c7ec278c7f0d3560362836b3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Objects>)))
  "Returns full string definition for message of type '<Objects>"
  (cl:format cl:nil "# std_msgs/Header~%std_msgs/Header header~%~%# object information~%uint16 number_of_objects~%carmaker_msgs/Object[] object~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: carmaker_msgs/Object~%# Object information~%uint8 id~%uint8 classification~%uint8 lane_id~%~%float32 length ~%float32 width ~%float32 height ~%~%carmaker_msgs/ObjectState state~%~%================================================================================~%MSG: carmaker_msgs/ObjectState~%float64 latitude                  # GCS Coordinates latitude~%float64 longitude                 # GCS Coordinates longitude~%float64 elevation                 # GCS Coordinates elevation~%~%float64 x~%float64 y~%float64 z~%~%float32 roll                      # yaw in vehicle coordinates [rad]~%float32 pitch                     # yaw in vehicle coordinates [rad]~%float32 yaw                       # yaw in vehicle coordinates [rad]~%float32 ego_roll                      # yaw in vehicle coordinates [rad]~%float32 ego_pitch                     # yaw in vehicle coordinates [rad]~%float32 ego_yaw                       # yaw in vehicle coordinates [rad]~%~%float32 roll_rate                      # yaw in vehicle coordinates [rad]~%float32 pitch_rate                     # yaw in vehicle coordinates [rad]~%float32 yaw_rate                       # yaw in vehicle coordinates [rad]~%~%float32 v_x                       # velocity in vehicle coordinates [m/s]~%float32 v_y                       # velocity in vehicle coordinates [m/s]~%float32 a_x                       # acceleration in vehicle coordinates [m/s^2]~%float32 a_y                       # acceleration in vehicle coordinates [m/s^2]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Objects)))
  "Returns full string definition for message of type 'Objects"
  (cl:format cl:nil "# std_msgs/Header~%std_msgs/Header header~%~%# object information~%uint16 number_of_objects~%carmaker_msgs/Object[] object~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: carmaker_msgs/Object~%# Object information~%uint8 id~%uint8 classification~%uint8 lane_id~%~%float32 length ~%float32 width ~%float32 height ~%~%carmaker_msgs/ObjectState state~%~%================================================================================~%MSG: carmaker_msgs/ObjectState~%float64 latitude                  # GCS Coordinates latitude~%float64 longitude                 # GCS Coordinates longitude~%float64 elevation                 # GCS Coordinates elevation~%~%float64 x~%float64 y~%float64 z~%~%float32 roll                      # yaw in vehicle coordinates [rad]~%float32 pitch                     # yaw in vehicle coordinates [rad]~%float32 yaw                       # yaw in vehicle coordinates [rad]~%float32 ego_roll                      # yaw in vehicle coordinates [rad]~%float32 ego_pitch                     # yaw in vehicle coordinates [rad]~%float32 ego_yaw                       # yaw in vehicle coordinates [rad]~%~%float32 roll_rate                      # yaw in vehicle coordinates [rad]~%float32 pitch_rate                     # yaw in vehicle coordinates [rad]~%float32 yaw_rate                       # yaw in vehicle coordinates [rad]~%~%float32 v_x                       # velocity in vehicle coordinates [m/s]~%float32 v_y                       # velocity in vehicle coordinates [m/s]~%float32 a_x                       # acceleration in vehicle coordinates [m/s^2]~%float32 a_y                       # acceleration in vehicle coordinates [m/s^2]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Objects>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'object) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Objects>))
  "Converts a ROS message object to a list"
  (cl:list 'Objects
    (cl:cons ':header (header msg))
    (cl:cons ':number_of_objects (number_of_objects msg))
    (cl:cons ':object (object msg))
))
