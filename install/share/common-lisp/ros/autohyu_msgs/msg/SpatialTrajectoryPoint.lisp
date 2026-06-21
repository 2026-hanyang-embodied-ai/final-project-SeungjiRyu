; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude SpatialTrajectoryPoint.msg.html

(cl:defclass <SpatialTrajectoryPoint> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (on_shortest_path
    :reader on_shortest_path
    :initarg :on_shortest_path
    :type cl:boolean
    :initform cl:nil)
   (lane_num
    :reader lane_num
    :initarg :lane_num
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SpatialTrajectoryPoint (<SpatialTrajectoryPoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SpatialTrajectoryPoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SpatialTrajectoryPoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<SpatialTrajectoryPoint> is deprecated: use autohyu_msgs-msg:SpatialTrajectoryPoint instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <SpatialTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:x-val is deprecated.  Use autohyu_msgs-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <SpatialTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:y-val is deprecated.  Use autohyu_msgs-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <SpatialTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:z-val is deprecated.  Use autohyu_msgs-msg:z instead.")
  (z m))

(cl:ensure-generic-function 'on_shortest_path-val :lambda-list '(m))
(cl:defmethod on_shortest_path-val ((m <SpatialTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:on_shortest_path-val is deprecated.  Use autohyu_msgs-msg:on_shortest_path instead.")
  (on_shortest_path m))

(cl:ensure-generic-function 'lane_num-val :lambda-list '(m))
(cl:defmethod lane_num-val ((m <SpatialTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:lane_num-val is deprecated.  Use autohyu_msgs-msg:lane_num instead.")
  (lane_num m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SpatialTrajectoryPoint>) ostream)
  "Serializes a message object of type '<SpatialTrajectoryPoint>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'on_shortest_path) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'lane_num)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SpatialTrajectoryPoint>) istream)
  "Deserializes a message object of type '<SpatialTrajectoryPoint>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'on_shortest_path) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lane_num) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SpatialTrajectoryPoint>)))
  "Returns string type for a message object of type '<SpatialTrajectoryPoint>"
  "autohyu_msgs/SpatialTrajectoryPoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpatialTrajectoryPoint)))
  "Returns string type for a message object of type 'SpatialTrajectoryPoint"
  "autohyu_msgs/SpatialTrajectoryPoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SpatialTrajectoryPoint>)))
  "Returns md5sum for a message object of type '<SpatialTrajectoryPoint>"
  "49797d301bc91d0456d52eb2d842a6b1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SpatialTrajectoryPoint)))
  "Returns md5sum for a message object of type 'SpatialTrajectoryPoint"
  "49797d301bc91d0456d52eb2d842a6b1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SpatialTrajectoryPoint>)))
  "Returns full string definition for message of type '<SpatialTrajectoryPoint>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%bool on_shortest_path~%int16 lane_num~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SpatialTrajectoryPoint)))
  "Returns full string definition for message of type 'SpatialTrajectoryPoint"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%bool on_shortest_path~%int16 lane_num~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SpatialTrajectoryPoint>))
  (cl:+ 0
     4
     4
     4
     1
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SpatialTrajectoryPoint>))
  "Converts a ROS message object to a list"
  (cl:list 'SpatialTrajectoryPoint
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':on_shortest_path (on_shortest_path msg))
    (cl:cons ':lane_num (lane_num msg))
))
