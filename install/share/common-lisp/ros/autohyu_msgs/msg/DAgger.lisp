; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude DAgger.msg.html

(cl:defclass <DAgger> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (record_on
    :reader record_on
    :initarg :record_on
    :type std_msgs-msg:Bool
    :initform (cl:make-instance 'std_msgs-msg:Bool)))
)

(cl:defclass DAgger (<DAgger>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DAgger>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DAgger)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<DAgger> is deprecated: use autohyu_msgs-msg:DAgger instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <DAgger>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:header-val is deprecated.  Use autohyu_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'record_on-val :lambda-list '(m))
(cl:defmethod record_on-val ((m <DAgger>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:record_on-val is deprecated.  Use autohyu_msgs-msg:record_on instead.")
  (record_on m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DAgger>) ostream)
  "Serializes a message object of type '<DAgger>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'record_on) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DAgger>) istream)
  "Deserializes a message object of type '<DAgger>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'record_on) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DAgger>)))
  "Returns string type for a message object of type '<DAgger>"
  "autohyu_msgs/DAgger")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DAgger)))
  "Returns string type for a message object of type 'DAgger"
  "autohyu_msgs/DAgger")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DAgger>)))
  "Returns md5sum for a message object of type '<DAgger>"
  "f7c10e3ecafdc8a9a12d9f0d5b4878c3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DAgger)))
  "Returns md5sum for a message object of type 'DAgger"
  "f7c10e3ecafdc8a9a12d9f0d5b4878c3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DAgger>)))
  "Returns full string definition for message of type '<DAgger>"
  (cl:format cl:nil "std_msgs/Header header~%std_msgs/Bool record_on~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: std_msgs/Bool~%bool data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DAgger)))
  "Returns full string definition for message of type 'DAgger"
  (cl:format cl:nil "std_msgs/Header header~%std_msgs/Bool record_on~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: std_msgs/Bool~%bool data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DAgger>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'record_on))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DAgger>))
  "Converts a ROS message object to a list"
  (cl:list 'DAgger
    (cl:cons ':header (header msg))
    (cl:cons ':record_on (record_on msg))
))
