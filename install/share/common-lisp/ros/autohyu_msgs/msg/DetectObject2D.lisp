; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude DetectObject2D.msg.html

(cl:defclass <DetectObject2D> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (confidence_score
    :reader confidence_score
    :initarg :confidence_score
    :type cl:float
    :initform 0.0)
   (classification
    :reader classification
    :initarg :classification
    :type cl:fixnum
    :initform 0)
   (dimension
    :reader dimension
    :initarg :dimension
    :type autohyu_msgs-msg:ObjectDimension
    :initform (cl:make-instance 'autohyu_msgs-msg:ObjectDimension))
   (state
    :reader state
    :initarg :state
    :type autohyu_msgs-msg:Object2DState
    :initform (cl:make-instance 'autohyu_msgs-msg:Object2DState)))
)

(cl:defclass DetectObject2D (<DetectObject2D>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DetectObject2D>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DetectObject2D)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<DetectObject2D> is deprecated: use autohyu_msgs-msg:DetectObject2D instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <DetectObject2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:id-val is deprecated.  Use autohyu_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'confidence_score-val :lambda-list '(m))
(cl:defmethod confidence_score-val ((m <DetectObject2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:confidence_score-val is deprecated.  Use autohyu_msgs-msg:confidence_score instead.")
  (confidence_score m))

(cl:ensure-generic-function 'classification-val :lambda-list '(m))
(cl:defmethod classification-val ((m <DetectObject2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:classification-val is deprecated.  Use autohyu_msgs-msg:classification instead.")
  (classification m))

(cl:ensure-generic-function 'dimension-val :lambda-list '(m))
(cl:defmethod dimension-val ((m <DetectObject2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:dimension-val is deprecated.  Use autohyu_msgs-msg:dimension instead.")
  (dimension m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <DetectObject2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:state-val is deprecated.  Use autohyu_msgs-msg:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DetectObject2D>) ostream)
  "Serializes a message object of type '<DetectObject2D>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'confidence_score))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'classification)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'dimension) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'state) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DetectObject2D>) istream)
  "Deserializes a message object of type '<DetectObject2D>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'confidence_score) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'classification)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'dimension) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'state) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DetectObject2D>)))
  "Returns string type for a message object of type '<DetectObject2D>"
  "autohyu_msgs/DetectObject2D")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DetectObject2D)))
  "Returns string type for a message object of type 'DetectObject2D"
  "autohyu_msgs/DetectObject2D")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DetectObject2D>)))
  "Returns md5sum for a message object of type '<DetectObject2D>"
  "5ef689afa95065f4db255a3c6a3ebf00")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DetectObject2D)))
  "Returns md5sum for a message object of type 'DetectObject2D"
  "5ef689afa95065f4db255a3c6a3ebf00")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DetectObject2D>)))
  "Returns full string definition for message of type '<DetectObject2D>"
  (cl:format cl:nil "# Object information~%uint32 id~%float32 confidence_score~%uint8 classification~%~%autohyu_msgs/ObjectDimension dimension~%autohyu_msgs/Object2DState   state~%~%================================================================================~%MSG: autohyu_msgs/ObjectDimension~%float32 length~%float32 width~%float32 height~%~%================================================================================~%MSG: autohyu_msgs/Object2DState~%std_msgs/Header header~%~%float32 x~%float32 y~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DetectObject2D)))
  "Returns full string definition for message of type 'DetectObject2D"
  (cl:format cl:nil "# Object information~%uint32 id~%float32 confidence_score~%uint8 classification~%~%autohyu_msgs/ObjectDimension dimension~%autohyu_msgs/Object2DState   state~%~%================================================================================~%MSG: autohyu_msgs/ObjectDimension~%float32 length~%float32 width~%float32 height~%~%================================================================================~%MSG: autohyu_msgs/Object2DState~%std_msgs/Header header~%~%float32 x~%float32 y~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DetectObject2D>))
  (cl:+ 0
     4
     4
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'dimension))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DetectObject2D>))
  "Converts a ROS message object to a list"
  (cl:list 'DetectObject2D
    (cl:cons ':id (id msg))
    (cl:cons ':confidence_score (confidence_score msg))
    (cl:cons ':classification (classification msg))
    (cl:cons ':dimension (dimension msg))
    (cl:cons ':state (state msg))
))
