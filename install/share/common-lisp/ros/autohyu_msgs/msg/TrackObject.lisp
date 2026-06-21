; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude TrackObject.msg.html

(cl:defclass <TrackObject> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (classification
    :reader classification
    :initarg :classification
    :type cl:fixnum
    :initform 0)
   (dynamic_state
    :reader dynamic_state
    :initarg :dynamic_state
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
    :type autohyu_msgs-msg:Object3DState
    :initform (cl:make-instance 'autohyu_msgs-msg:Object3DState))
   (state_covariance
    :reader state_covariance
    :initarg :state_covariance
    :type autohyu_msgs-msg:Object3DState
    :initform (cl:make-instance 'autohyu_msgs-msg:Object3DState)))
)

(cl:defclass TrackObject (<TrackObject>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrackObject>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrackObject)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<TrackObject> is deprecated: use autohyu_msgs-msg:TrackObject instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <TrackObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:id-val is deprecated.  Use autohyu_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'classification-val :lambda-list '(m))
(cl:defmethod classification-val ((m <TrackObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:classification-val is deprecated.  Use autohyu_msgs-msg:classification instead.")
  (classification m))

(cl:ensure-generic-function 'dynamic_state-val :lambda-list '(m))
(cl:defmethod dynamic_state-val ((m <TrackObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:dynamic_state-val is deprecated.  Use autohyu_msgs-msg:dynamic_state instead.")
  (dynamic_state m))

(cl:ensure-generic-function 'dimension-val :lambda-list '(m))
(cl:defmethod dimension-val ((m <TrackObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:dimension-val is deprecated.  Use autohyu_msgs-msg:dimension instead.")
  (dimension m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <TrackObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:state-val is deprecated.  Use autohyu_msgs-msg:state instead.")
  (state m))

(cl:ensure-generic-function 'state_covariance-val :lambda-list '(m))
(cl:defmethod state_covariance-val ((m <TrackObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:state_covariance-val is deprecated.  Use autohyu_msgs-msg:state_covariance instead.")
  (state_covariance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrackObject>) ostream)
  "Serializes a message object of type '<TrackObject>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'classification)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dynamic_state)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'dimension) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'state) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'state_covariance) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrackObject>) istream)
  "Deserializes a message object of type '<TrackObject>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'classification)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dynamic_state)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'dimension) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'state) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'state_covariance) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrackObject>)))
  "Returns string type for a message object of type '<TrackObject>"
  "autohyu_msgs/TrackObject")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrackObject)))
  "Returns string type for a message object of type 'TrackObject"
  "autohyu_msgs/TrackObject")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrackObject>)))
  "Returns md5sum for a message object of type '<TrackObject>"
  "c567d69f4c89cc5d54e7b9f7798bddba")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrackObject)))
  "Returns md5sum for a message object of type 'TrackObject"
  "c567d69f4c89cc5d54e7b9f7798bddba")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrackObject>)))
  "Returns full string definition for message of type '<TrackObject>"
  (cl:format cl:nil "# Object information~%uint32 id~%uint8 classification~%uint8 dynamic_state~%~%autohyu_msgs/ObjectDimension dimension~%autohyu_msgs/Object3DState state~%autohyu_msgs/Object3DState state_covariance~%~%================================================================================~%MSG: autohyu_msgs/ObjectDimension~%float32 length~%float32 width~%float32 height~%~%================================================================================~%MSG: autohyu_msgs/Object3DState~%std_msgs/Header header~%~%float32 x~%float32 y~%float32 z~%float32 vx~%float32 vy~%float32 vz~%float32 ax~%float32 ay~%float32 az~%float32 roll~%float32 pitch~%float32 yaw~%float32 roll_rate~%float32 pitch_rate~%float32 yaw_rate~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrackObject)))
  "Returns full string definition for message of type 'TrackObject"
  (cl:format cl:nil "# Object information~%uint32 id~%uint8 classification~%uint8 dynamic_state~%~%autohyu_msgs/ObjectDimension dimension~%autohyu_msgs/Object3DState state~%autohyu_msgs/Object3DState state_covariance~%~%================================================================================~%MSG: autohyu_msgs/ObjectDimension~%float32 length~%float32 width~%float32 height~%~%================================================================================~%MSG: autohyu_msgs/Object3DState~%std_msgs/Header header~%~%float32 x~%float32 y~%float32 z~%float32 vx~%float32 vy~%float32 vz~%float32 ax~%float32 ay~%float32 az~%float32 roll~%float32 pitch~%float32 yaw~%float32 roll_rate~%float32 pitch_rate~%float32 yaw_rate~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrackObject>))
  (cl:+ 0
     4
     1
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'dimension))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'state))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'state_covariance))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrackObject>))
  "Converts a ROS message object to a list"
  (cl:list 'TrackObject
    (cl:cons ':id (id msg))
    (cl:cons ':classification (classification msg))
    (cl:cons ':dynamic_state (dynamic_state msg))
    (cl:cons ':dimension (dimension msg))
    (cl:cons ':state (state msg))
    (cl:cons ':state_covariance (state_covariance msg))
))
