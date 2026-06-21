; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude LaneletRelation.msg.html

(cl:defclass <LaneletRelation> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0))
)

(cl:defclass LaneletRelation (<LaneletRelation>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LaneletRelation>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LaneletRelation)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<LaneletRelation> is deprecated: use autohyu_msgs-msg:LaneletRelation instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <LaneletRelation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:id-val is deprecated.  Use autohyu_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <LaneletRelation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:type-val is deprecated.  Use autohyu_msgs-msg:type instead.")
  (type m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<LaneletRelation>)))
    "Constants for message type '<LaneletRelation>"
  '((:NONE . 0)
    (:SUCCESSOR . 1)
    (:LEFT . 2)
    (:RIGHT . 3)
    (:ADJACENT_LEFT . 4)
    (:ADJACENT_RIGHT . 5)
    (:CONFLICTING . 6)
    (:AREA . 7))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'LaneletRelation)))
    "Constants for message type 'LaneletRelation"
  '((:NONE . 0)
    (:SUCCESSOR . 1)
    (:LEFT . 2)
    (:RIGHT . 3)
    (:ADJACENT_LEFT . 4)
    (:ADJACENT_RIGHT . 5)
    (:CONFLICTING . 6)
    (:AREA . 7))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LaneletRelation>) ostream)
  "Serializes a message object of type '<LaneletRelation>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LaneletRelation>) istream)
  "Deserializes a message object of type '<LaneletRelation>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LaneletRelation>)))
  "Returns string type for a message object of type '<LaneletRelation>"
  "autohyu_msgs/LaneletRelation")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LaneletRelation)))
  "Returns string type for a message object of type 'LaneletRelation"
  "autohyu_msgs/LaneletRelation")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LaneletRelation>)))
  "Returns md5sum for a message object of type '<LaneletRelation>"
  "af7fa5165485233d64a846f479ababaf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LaneletRelation)))
  "Returns md5sum for a message object of type 'LaneletRelation"
  "af7fa5165485233d64a846f479ababaf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LaneletRelation>)))
  "Returns full string definition for message of type '<LaneletRelation>"
  (cl:format cl:nil "# Relation between lanes~%uint8 NONE = 0~%uint8 SUCCESSOR = 1~%uint8 LEFT = 2~%uint8 RIGHT = 3~%uint8 ADJACENT_LEFT = 4~%uint8 ADJACENT_RIGHT = 5~%uint8 CONFLICTING = 6~%uint8 AREA = 7~%~%int64 id~%uint8 type~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LaneletRelation)))
  "Returns full string definition for message of type 'LaneletRelation"
  (cl:format cl:nil "# Relation between lanes~%uint8 NONE = 0~%uint8 SUCCESSOR = 1~%uint8 LEFT = 2~%uint8 RIGHT = 3~%uint8 ADJACENT_LEFT = 4~%uint8 ADJACENT_RIGHT = 5~%uint8 CONFLICTING = 6~%uint8 AREA = 7~%~%int64 id~%uint8 type~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LaneletRelation>))
  (cl:+ 0
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LaneletRelation>))
  "Converts a ROS message object to a list"
  (cl:list 'LaneletRelation
    (cl:cons ':id (id msg))
    (cl:cons ':type (type msg))
))
