; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude TemporalTrajectoryPoint.msg.html

(cl:defclass <TemporalTrajectoryPoint> (roslisp-msg-protocol:ros-message)
  ((time
    :reader time
    :initarg :time
    :type cl:float
    :initform 0.0)
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0)
   (curvature
    :reader curvature
    :initarg :curvature
    :type cl:float
    :initform 0.0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0)
   (ref_speed
    :reader ref_speed
    :initarg :ref_speed
    :type cl:float
    :initform 0.0))
)

(cl:defclass TemporalTrajectoryPoint (<TemporalTrajectoryPoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TemporalTrajectoryPoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TemporalTrajectoryPoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<TemporalTrajectoryPoint> is deprecated: use autohyu_msgs-msg:TemporalTrajectoryPoint instead.")))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <TemporalTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:time-val is deprecated.  Use autohyu_msgs-msg:time instead.")
  (time m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <TemporalTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:distance-val is deprecated.  Use autohyu_msgs-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'curvature-val :lambda-list '(m))
(cl:defmethod curvature-val ((m <TemporalTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:curvature-val is deprecated.  Use autohyu_msgs-msg:curvature instead.")
  (curvature m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <TemporalTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:speed-val is deprecated.  Use autohyu_msgs-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'ref_speed-val :lambda-list '(m))
(cl:defmethod ref_speed-val ((m <TemporalTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:ref_speed-val is deprecated.  Use autohyu_msgs-msg:ref_speed instead.")
  (ref_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TemporalTrajectoryPoint>) ostream)
  "Serializes a message object of type '<TemporalTrajectoryPoint>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'curvature))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ref_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TemporalTrajectoryPoint>) istream)
  "Deserializes a message object of type '<TemporalTrajectoryPoint>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'curvature) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ref_speed) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TemporalTrajectoryPoint>)))
  "Returns string type for a message object of type '<TemporalTrajectoryPoint>"
  "autohyu_msgs/TemporalTrajectoryPoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TemporalTrajectoryPoint)))
  "Returns string type for a message object of type 'TemporalTrajectoryPoint"
  "autohyu_msgs/TemporalTrajectoryPoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TemporalTrajectoryPoint>)))
  "Returns md5sum for a message object of type '<TemporalTrajectoryPoint>"
  "73e7ebf7e38e214887afcc1c9e420d0c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TemporalTrajectoryPoint)))
  "Returns md5sum for a message object of type 'TemporalTrajectoryPoint"
  "73e7ebf7e38e214887afcc1c9e420d0c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TemporalTrajectoryPoint>)))
  "Returns full string definition for message of type '<TemporalTrajectoryPoint>"
  (cl:format cl:nil "float32 time~%float32 distance~%float32 curvature~%float32 speed~%float32 ref_speed~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TemporalTrajectoryPoint)))
  "Returns full string definition for message of type 'TemporalTrajectoryPoint"
  (cl:format cl:nil "float32 time~%float32 distance~%float32 curvature~%float32 speed~%float32 ref_speed~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TemporalTrajectoryPoint>))
  (cl:+ 0
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TemporalTrajectoryPoint>))
  "Converts a ROS message object to a list"
  (cl:list 'TemporalTrajectoryPoint
    (cl:cons ':time (time msg))
    (cl:cons ':distance (distance msg))
    (cl:cons ':curvature (curvature msg))
    (cl:cons ':speed (speed msg))
    (cl:cons ':ref_speed (ref_speed msg))
))
