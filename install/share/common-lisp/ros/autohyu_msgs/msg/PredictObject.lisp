; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude PredictObject.msg.html

(cl:defclass <PredictObject> (roslisp-msg-protocol:ros-message)
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
   (state_multi
    :reader state_multi
    :initarg :state_multi
    :type (cl:vector autohyu_msgs-msg:PredictObjectMultimodal)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:PredictObjectMultimodal :initial-element (cl:make-instance 'autohyu_msgs-msg:PredictObjectMultimodal)))
   (state
    :reader state
    :initarg :state
    :type (cl:vector autohyu_msgs-msg:Object3DState)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:Object3DState :initial-element (cl:make-instance 'autohyu_msgs-msg:Object3DState))))
)

(cl:defclass PredictObject (<PredictObject>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PredictObject>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PredictObject)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<PredictObject> is deprecated: use autohyu_msgs-msg:PredictObject instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <PredictObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:id-val is deprecated.  Use autohyu_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'classification-val :lambda-list '(m))
(cl:defmethod classification-val ((m <PredictObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:classification-val is deprecated.  Use autohyu_msgs-msg:classification instead.")
  (classification m))

(cl:ensure-generic-function 'dynamic_state-val :lambda-list '(m))
(cl:defmethod dynamic_state-val ((m <PredictObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:dynamic_state-val is deprecated.  Use autohyu_msgs-msg:dynamic_state instead.")
  (dynamic_state m))

(cl:ensure-generic-function 'dimension-val :lambda-list '(m))
(cl:defmethod dimension-val ((m <PredictObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:dimension-val is deprecated.  Use autohyu_msgs-msg:dimension instead.")
  (dimension m))

(cl:ensure-generic-function 'state_multi-val :lambda-list '(m))
(cl:defmethod state_multi-val ((m <PredictObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:state_multi-val is deprecated.  Use autohyu_msgs-msg:state_multi instead.")
  (state_multi m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <PredictObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:state-val is deprecated.  Use autohyu_msgs-msg:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PredictObject>) ostream)
  "Serializes a message object of type '<PredictObject>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'classification)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dynamic_state)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'dimension) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'state_multi))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'state_multi))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'state))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'state))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PredictObject>) istream)
  "Deserializes a message object of type '<PredictObject>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'classification)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dynamic_state)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'dimension) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'state_multi) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'state_multi)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:PredictObjectMultimodal))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'state) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'state)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:Object3DState))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PredictObject>)))
  "Returns string type for a message object of type '<PredictObject>"
  "autohyu_msgs/PredictObject")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PredictObject)))
  "Returns string type for a message object of type 'PredictObject"
  "autohyu_msgs/PredictObject")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PredictObject>)))
  "Returns md5sum for a message object of type '<PredictObject>"
  "d31c4c1b4494f87ffdc5cd468578ad3a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PredictObject)))
  "Returns md5sum for a message object of type 'PredictObject"
  "d31c4c1b4494f87ffdc5cd468578ad3a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PredictObject>)))
  "Returns full string definition for message of type '<PredictObject>"
  (cl:format cl:nil "# Object information~%uint32 id~%uint8 classification~%uint8 dynamic_state~%~%autohyu_msgs/ObjectDimension dimension~%autohyu_msgs/PredictObjectMultimodal[] state_multi~%autohyu_msgs/Object3DState[] state~%~%================================================================================~%MSG: autohyu_msgs/ObjectDimension~%float32 length~%float32 width~%float32 height~%~%================================================================================~%MSG: autohyu_msgs/PredictObjectMultimodal~%float64 probability~%autohyu_msgs/Object3DState[] state~%~%================================================================================~%MSG: autohyu_msgs/Object3DState~%std_msgs/Header header~%~%float32 x~%float32 y~%float32 z~%float32 vx~%float32 vy~%float32 vz~%float32 ax~%float32 ay~%float32 az~%float32 roll~%float32 pitch~%float32 yaw~%float32 roll_rate~%float32 pitch_rate~%float32 yaw_rate~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PredictObject)))
  "Returns full string definition for message of type 'PredictObject"
  (cl:format cl:nil "# Object information~%uint32 id~%uint8 classification~%uint8 dynamic_state~%~%autohyu_msgs/ObjectDimension dimension~%autohyu_msgs/PredictObjectMultimodal[] state_multi~%autohyu_msgs/Object3DState[] state~%~%================================================================================~%MSG: autohyu_msgs/ObjectDimension~%float32 length~%float32 width~%float32 height~%~%================================================================================~%MSG: autohyu_msgs/PredictObjectMultimodal~%float64 probability~%autohyu_msgs/Object3DState[] state~%~%================================================================================~%MSG: autohyu_msgs/Object3DState~%std_msgs/Header header~%~%float32 x~%float32 y~%float32 z~%float32 vx~%float32 vy~%float32 vz~%float32 ax~%float32 ay~%float32 az~%float32 roll~%float32 pitch~%float32 yaw~%float32 roll_rate~%float32 pitch_rate~%float32 yaw_rate~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PredictObject>))
  (cl:+ 0
     4
     1
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'dimension))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'state_multi) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'state) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PredictObject>))
  "Converts a ROS message object to a list"
  (cl:list 'PredictObject
    (cl:cons ':id (id msg))
    (cl:cons ':classification (classification msg))
    (cl:cons ':dynamic_state (dynamic_state msg))
    (cl:cons ':dimension (dimension msg))
    (cl:cons ':state_multi (state_multi msg))
    (cl:cons ':state (state msg))
))
