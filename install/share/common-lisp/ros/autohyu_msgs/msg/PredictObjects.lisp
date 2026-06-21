; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude PredictObjects.msg.html

(cl:defclass <PredictObjects> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (object
    :reader object
    :initarg :object
    :type (cl:vector autohyu_msgs-msg:PredictObject)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:PredictObject :initial-element (cl:make-instance 'autohyu_msgs-msg:PredictObject))))
)

(cl:defclass PredictObjects (<PredictObjects>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PredictObjects>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PredictObjects)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<PredictObjects> is deprecated: use autohyu_msgs-msg:PredictObjects instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <PredictObjects>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:header-val is deprecated.  Use autohyu_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'object-val :lambda-list '(m))
(cl:defmethod object-val ((m <PredictObjects>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:object-val is deprecated.  Use autohyu_msgs-msg:object instead.")
  (object m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PredictObjects>) ostream)
  "Serializes a message object of type '<PredictObjects>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'object))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'object))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PredictObjects>) istream)
  "Deserializes a message object of type '<PredictObjects>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'object) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'object)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:PredictObject))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PredictObjects>)))
  "Returns string type for a message object of type '<PredictObjects>"
  "autohyu_msgs/PredictObjects")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PredictObjects)))
  "Returns string type for a message object of type 'PredictObjects"
  "autohyu_msgs/PredictObjects")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PredictObjects>)))
  "Returns md5sum for a message object of type '<PredictObjects>"
  "5a9a27eb389b4ac10be976e9de502ebf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PredictObjects)))
  "Returns md5sum for a message object of type 'PredictObjects"
  "5a9a27eb389b4ac10be976e9de502ebf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PredictObjects>)))
  "Returns full string definition for message of type '<PredictObjects>"
  (cl:format cl:nil "# std_msgs/Header~%std_msgs/Header header~%~%# object information~%autohyu_msgs/PredictObject[] object~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: autohyu_msgs/PredictObject~%# Object information~%uint32 id~%uint8 classification~%uint8 dynamic_state~%~%autohyu_msgs/ObjectDimension dimension~%autohyu_msgs/PredictObjectMultimodal[] state_multi~%autohyu_msgs/Object3DState[] state~%~%================================================================================~%MSG: autohyu_msgs/ObjectDimension~%float32 length~%float32 width~%float32 height~%~%================================================================================~%MSG: autohyu_msgs/PredictObjectMultimodal~%float64 probability~%autohyu_msgs/Object3DState[] state~%~%================================================================================~%MSG: autohyu_msgs/Object3DState~%std_msgs/Header header~%~%float32 x~%float32 y~%float32 z~%float32 vx~%float32 vy~%float32 vz~%float32 ax~%float32 ay~%float32 az~%float32 roll~%float32 pitch~%float32 yaw~%float32 roll_rate~%float32 pitch_rate~%float32 yaw_rate~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PredictObjects)))
  "Returns full string definition for message of type 'PredictObjects"
  (cl:format cl:nil "# std_msgs/Header~%std_msgs/Header header~%~%# object information~%autohyu_msgs/PredictObject[] object~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: autohyu_msgs/PredictObject~%# Object information~%uint32 id~%uint8 classification~%uint8 dynamic_state~%~%autohyu_msgs/ObjectDimension dimension~%autohyu_msgs/PredictObjectMultimodal[] state_multi~%autohyu_msgs/Object3DState[] state~%~%================================================================================~%MSG: autohyu_msgs/ObjectDimension~%float32 length~%float32 width~%float32 height~%~%================================================================================~%MSG: autohyu_msgs/PredictObjectMultimodal~%float64 probability~%autohyu_msgs/Object3DState[] state~%~%================================================================================~%MSG: autohyu_msgs/Object3DState~%std_msgs/Header header~%~%float32 x~%float32 y~%float32 z~%float32 vx~%float32 vy~%float32 vz~%float32 ax~%float32 ay~%float32 az~%float32 roll~%float32 pitch~%float32 yaw~%float32 roll_rate~%float32 pitch_rate~%float32 yaw_rate~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PredictObjects>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'object) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PredictObjects>))
  "Converts a ROS message object to a list"
  (cl:list 'PredictObjects
    (cl:cons ':header (header msg))
    (cl:cons ':object (object msg))
))
