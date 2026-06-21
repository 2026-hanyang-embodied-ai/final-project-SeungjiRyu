; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude Reference.msg.html

(cl:defclass <Reference> (roslisp-msg-protocol:ros-message)
  ((projection
    :reader projection
    :initarg :projection
    :type cl:string
    :initform "")
   (wgs84
    :reader wgs84
    :initarg :wgs84
    :type autohyu_msgs-msg:WGS84
    :initform (cl:make-instance 'autohyu_msgs-msg:WGS84)))
)

(cl:defclass Reference (<Reference>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Reference>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Reference)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<Reference> is deprecated: use autohyu_msgs-msg:Reference instead.")))

(cl:ensure-generic-function 'projection-val :lambda-list '(m))
(cl:defmethod projection-val ((m <Reference>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:projection-val is deprecated.  Use autohyu_msgs-msg:projection instead.")
  (projection m))

(cl:ensure-generic-function 'wgs84-val :lambda-list '(m))
(cl:defmethod wgs84-val ((m <Reference>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:wgs84-val is deprecated.  Use autohyu_msgs-msg:wgs84 instead.")
  (wgs84 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Reference>) ostream)
  "Serializes a message object of type '<Reference>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'projection))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'projection))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'wgs84) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Reference>) istream)
  "Deserializes a message object of type '<Reference>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'projection) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'projection) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'wgs84) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Reference>)))
  "Returns string type for a message object of type '<Reference>"
  "autohyu_msgs/Reference")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Reference)))
  "Returns string type for a message object of type 'Reference"
  "autohyu_msgs/Reference")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Reference>)))
  "Returns md5sum for a message object of type '<Reference>"
  "4d603e2ddd7205e463437d38cbec7ed4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Reference)))
  "Returns md5sum for a message object of type 'Reference"
  "4d603e2ddd7205e463437d38cbec7ed4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Reference>)))
  "Returns full string definition for message of type '<Reference>"
  (cl:format cl:nil "string  projection~%autohyu_msgs/WGS84 wgs84~%================================================================================~%MSG: autohyu_msgs/WGS84~%float64 latitude~%float64 longitude~%float64 altitude~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Reference)))
  "Returns full string definition for message of type 'Reference"
  (cl:format cl:nil "string  projection~%autohyu_msgs/WGS84 wgs84~%================================================================================~%MSG: autohyu_msgs/WGS84~%float64 latitude~%float64 longitude~%float64 altitude~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Reference>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'projection))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'wgs84))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Reference>))
  "Converts a ROS message object to a list"
  (cl:list 'Reference
    (cl:cons ':projection (projection msg))
    (cl:cons ':wgs84 (wgs84 msg))
))
