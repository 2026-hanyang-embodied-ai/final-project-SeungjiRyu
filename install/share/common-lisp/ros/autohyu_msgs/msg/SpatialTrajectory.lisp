; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude SpatialTrajectory.msg.html

(cl:defclass <SpatialTrajectory> (roslisp-msg-protocol:ros-message)
  ((point
    :reader point
    :initarg :point
    :type (cl:vector autohyu_msgs-msg:SpatialTrajectoryPoint)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:SpatialTrajectoryPoint :initial-element (cl:make-instance 'autohyu_msgs-msg:SpatialTrajectoryPoint))))
)

(cl:defclass SpatialTrajectory (<SpatialTrajectory>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SpatialTrajectory>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SpatialTrajectory)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<SpatialTrajectory> is deprecated: use autohyu_msgs-msg:SpatialTrajectory instead.")))

(cl:ensure-generic-function 'point-val :lambda-list '(m))
(cl:defmethod point-val ((m <SpatialTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:point-val is deprecated.  Use autohyu_msgs-msg:point instead.")
  (point m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SpatialTrajectory>) ostream)
  "Serializes a message object of type '<SpatialTrajectory>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'point))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'point))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SpatialTrajectory>) istream)
  "Deserializes a message object of type '<SpatialTrajectory>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'point) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'point)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:SpatialTrajectoryPoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SpatialTrajectory>)))
  "Returns string type for a message object of type '<SpatialTrajectory>"
  "autohyu_msgs/SpatialTrajectory")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpatialTrajectory)))
  "Returns string type for a message object of type 'SpatialTrajectory"
  "autohyu_msgs/SpatialTrajectory")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SpatialTrajectory>)))
  "Returns md5sum for a message object of type '<SpatialTrajectory>"
  "fb5678abb8463c3e8dd1cb3a32561fd6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SpatialTrajectory)))
  "Returns md5sum for a message object of type 'SpatialTrajectory"
  "fb5678abb8463c3e8dd1cb3a32561fd6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SpatialTrajectory>)))
  "Returns full string definition for message of type '<SpatialTrajectory>"
  (cl:format cl:nil "autohyu_msgs/SpatialTrajectoryPoint[] point~%================================================================================~%MSG: autohyu_msgs/SpatialTrajectoryPoint~%float32 x~%float32 y~%float32 z~%bool on_shortest_path~%int16 lane_num~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SpatialTrajectory)))
  "Returns full string definition for message of type 'SpatialTrajectory"
  (cl:format cl:nil "autohyu_msgs/SpatialTrajectoryPoint[] point~%================================================================================~%MSG: autohyu_msgs/SpatialTrajectoryPoint~%float32 x~%float32 y~%float32 z~%bool on_shortest_path~%int16 lane_num~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SpatialTrajectory>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'point) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SpatialTrajectory>))
  "Converts a ROS message object to a list"
  (cl:list 'SpatialTrajectory
    (cl:cons ':point (point msg))
))
