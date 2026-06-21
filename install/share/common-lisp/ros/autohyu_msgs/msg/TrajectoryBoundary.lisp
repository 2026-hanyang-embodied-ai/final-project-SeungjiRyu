; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude TrajectoryBoundary.msg.html

(cl:defclass <TrajectoryBoundary> (roslisp-msg-protocol:ros-message)
  ((point
    :reader point
    :initarg :point
    :type (cl:vector autohyu_msgs-msg:TrajectoryBoundaryPoint)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:TrajectoryBoundaryPoint :initial-element (cl:make-instance 'autohyu_msgs-msg:TrajectoryBoundaryPoint))))
)

(cl:defclass TrajectoryBoundary (<TrajectoryBoundary>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrajectoryBoundary>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrajectoryBoundary)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<TrajectoryBoundary> is deprecated: use autohyu_msgs-msg:TrajectoryBoundary instead.")))

(cl:ensure-generic-function 'point-val :lambda-list '(m))
(cl:defmethod point-val ((m <TrajectoryBoundary>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:point-val is deprecated.  Use autohyu_msgs-msg:point instead.")
  (point m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrajectoryBoundary>) ostream)
  "Serializes a message object of type '<TrajectoryBoundary>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'point))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'point))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrajectoryBoundary>) istream)
  "Deserializes a message object of type '<TrajectoryBoundary>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'point) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'point)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:TrajectoryBoundaryPoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrajectoryBoundary>)))
  "Returns string type for a message object of type '<TrajectoryBoundary>"
  "autohyu_msgs/TrajectoryBoundary")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrajectoryBoundary)))
  "Returns string type for a message object of type 'TrajectoryBoundary"
  "autohyu_msgs/TrajectoryBoundary")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrajectoryBoundary>)))
  "Returns md5sum for a message object of type '<TrajectoryBoundary>"
  "855c97146bb19f8639cd6503bd7dae24")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrajectoryBoundary)))
  "Returns md5sum for a message object of type 'TrajectoryBoundary"
  "855c97146bb19f8639cd6503bd7dae24")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrajectoryBoundary>)))
  "Returns full string definition for message of type '<TrajectoryBoundary>"
  (cl:format cl:nil "autohyu_msgs/TrajectoryBoundaryPoint[] point~%================================================================================~%MSG: autohyu_msgs/TrajectoryBoundaryPoint~%float32 x~%float32 y~%float32 z~%float32 s~%float32 n~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrajectoryBoundary)))
  "Returns full string definition for message of type 'TrajectoryBoundary"
  (cl:format cl:nil "autohyu_msgs/TrajectoryBoundaryPoint[] point~%================================================================================~%MSG: autohyu_msgs/TrajectoryBoundaryPoint~%float32 x~%float32 y~%float32 z~%float32 s~%float32 n~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrajectoryBoundary>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'point) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrajectoryBoundary>))
  "Converts a ROS message object to a list"
  (cl:list 'TrajectoryBoundary
    (cl:cons ':point (point msg))
))
