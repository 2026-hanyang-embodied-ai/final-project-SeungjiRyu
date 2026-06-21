; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude DetectObjects2D.msg.html

(cl:defclass <DetectObjects2D> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (object
    :reader object
    :initarg :object
    :type (cl:vector autohyu_msgs-msg:DetectObject2D)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:DetectObject2D :initial-element (cl:make-instance 'autohyu_msgs-msg:DetectObject2D))))
)

(cl:defclass DetectObjects2D (<DetectObjects2D>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DetectObjects2D>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DetectObjects2D)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<DetectObjects2D> is deprecated: use autohyu_msgs-msg:DetectObjects2D instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <DetectObjects2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:header-val is deprecated.  Use autohyu_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'object-val :lambda-list '(m))
(cl:defmethod object-val ((m <DetectObjects2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:object-val is deprecated.  Use autohyu_msgs-msg:object instead.")
  (object m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DetectObjects2D>) ostream)
  "Serializes a message object of type '<DetectObjects2D>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'object))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'object))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DetectObjects2D>) istream)
  "Deserializes a message object of type '<DetectObjects2D>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'object) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'object)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:DetectObject2D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DetectObjects2D>)))
  "Returns string type for a message object of type '<DetectObjects2D>"
  "autohyu_msgs/DetectObjects2D")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DetectObjects2D)))
  "Returns string type for a message object of type 'DetectObjects2D"
  "autohyu_msgs/DetectObjects2D")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DetectObjects2D>)))
  "Returns md5sum for a message object of type '<DetectObjects2D>"
  "c9daa7985f7897288ddef8e4faf2a73b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DetectObjects2D)))
  "Returns md5sum for a message object of type 'DetectObjects2D"
  "c9daa7985f7897288ddef8e4faf2a73b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DetectObjects2D>)))
  "Returns full string definition for message of type '<DetectObjects2D>"
  (cl:format cl:nil "# std_msgs/Header~%std_msgs/Header header~%~%# object information~%autohyu_msgs/DetectObject2D[] object~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: autohyu_msgs/DetectObject2D~%# Object information~%uint32 id~%float32 confidence_score~%uint8 classification~%~%autohyu_msgs/ObjectDimension dimension~%autohyu_msgs/Object2DState   state~%~%================================================================================~%MSG: autohyu_msgs/ObjectDimension~%float32 length~%float32 width~%float32 height~%~%================================================================================~%MSG: autohyu_msgs/Object2DState~%std_msgs/Header header~%~%float32 x~%float32 y~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DetectObjects2D)))
  "Returns full string definition for message of type 'DetectObjects2D"
  (cl:format cl:nil "# std_msgs/Header~%std_msgs/Header header~%~%# object information~%autohyu_msgs/DetectObject2D[] object~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: autohyu_msgs/DetectObject2D~%# Object information~%uint32 id~%float32 confidence_score~%uint8 classification~%~%autohyu_msgs/ObjectDimension dimension~%autohyu_msgs/Object2DState   state~%~%================================================================================~%MSG: autohyu_msgs/ObjectDimension~%float32 length~%float32 width~%float32 height~%~%================================================================================~%MSG: autohyu_msgs/Object2DState~%std_msgs/Header header~%~%float32 x~%float32 y~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DetectObjects2D>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'object) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DetectObjects2D>))
  "Converts a ROS message object to a list"
  (cl:list 'DetectObjects2D
    (cl:cons ':header (header msg))
    (cl:cons ':object (object msg))
))
