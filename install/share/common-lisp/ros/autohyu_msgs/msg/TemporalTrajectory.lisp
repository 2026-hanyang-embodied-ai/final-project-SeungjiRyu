; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude TemporalTrajectory.msg.html

(cl:defclass <TemporalTrajectory> (roslisp-msg-protocol:ros-message)
  ((point
    :reader point
    :initarg :point
    :type (cl:vector autohyu_msgs-msg:TemporalTrajectoryPoint)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:TemporalTrajectoryPoint :initial-element (cl:make-instance 'autohyu_msgs-msg:TemporalTrajectoryPoint))))
)

(cl:defclass TemporalTrajectory (<TemporalTrajectory>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TemporalTrajectory>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TemporalTrajectory)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<TemporalTrajectory> is deprecated: use autohyu_msgs-msg:TemporalTrajectory instead.")))

(cl:ensure-generic-function 'point-val :lambda-list '(m))
(cl:defmethod point-val ((m <TemporalTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:point-val is deprecated.  Use autohyu_msgs-msg:point instead.")
  (point m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TemporalTrajectory>) ostream)
  "Serializes a message object of type '<TemporalTrajectory>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'point))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'point))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TemporalTrajectory>) istream)
  "Deserializes a message object of type '<TemporalTrajectory>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'point) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'point)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:TemporalTrajectoryPoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TemporalTrajectory>)))
  "Returns string type for a message object of type '<TemporalTrajectory>"
  "autohyu_msgs/TemporalTrajectory")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TemporalTrajectory)))
  "Returns string type for a message object of type 'TemporalTrajectory"
  "autohyu_msgs/TemporalTrajectory")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TemporalTrajectory>)))
  "Returns md5sum for a message object of type '<TemporalTrajectory>"
  "8d4a1cb0de0a51e983f65281b57bfd76")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TemporalTrajectory)))
  "Returns md5sum for a message object of type 'TemporalTrajectory"
  "8d4a1cb0de0a51e983f65281b57bfd76")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TemporalTrajectory>)))
  "Returns full string definition for message of type '<TemporalTrajectory>"
  (cl:format cl:nil "autohyu_msgs/TemporalTrajectoryPoint[] point~%================================================================================~%MSG: autohyu_msgs/TemporalTrajectoryPoint~%float32 time~%float32 distance~%float32 curvature~%float32 speed~%float32 ref_speed~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TemporalTrajectory)))
  "Returns full string definition for message of type 'TemporalTrajectory"
  (cl:format cl:nil "autohyu_msgs/TemporalTrajectoryPoint[] point~%================================================================================~%MSG: autohyu_msgs/TemporalTrajectoryPoint~%float32 time~%float32 distance~%float32 curvature~%float32 speed~%float32 ref_speed~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TemporalTrajectory>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'point) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TemporalTrajectory>))
  "Converts a ROS message object to a list"
  (cl:list 'TemporalTrajectory
    (cl:cons ':point (point msg))
))
