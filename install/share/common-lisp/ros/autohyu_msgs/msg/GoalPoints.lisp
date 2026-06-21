; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude GoalPoints.msg.html

(cl:defclass <GoalPoints> (roslisp-msg-protocol:ros-message)
  ((goal_points
    :reader goal_points
    :initarg :goal_points
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point))))
)

(cl:defclass GoalPoints (<GoalPoints>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoalPoints>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoalPoints)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<GoalPoints> is deprecated: use autohyu_msgs-msg:GoalPoints instead.")))

(cl:ensure-generic-function 'goal_points-val :lambda-list '(m))
(cl:defmethod goal_points-val ((m <GoalPoints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:goal_points-val is deprecated.  Use autohyu_msgs-msg:goal_points instead.")
  (goal_points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoalPoints>) ostream)
  "Serializes a message object of type '<GoalPoints>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'goal_points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'goal_points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoalPoints>) istream)
  "Deserializes a message object of type '<GoalPoints>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'goal_points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'goal_points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoalPoints>)))
  "Returns string type for a message object of type '<GoalPoints>"
  "autohyu_msgs/GoalPoints")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoalPoints)))
  "Returns string type for a message object of type 'GoalPoints"
  "autohyu_msgs/GoalPoints")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoalPoints>)))
  "Returns md5sum for a message object of type '<GoalPoints>"
  "d9c0f6fe1383e1e35c12b2c5901041a7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoalPoints)))
  "Returns md5sum for a message object of type 'GoalPoints"
  "d9c0f6fe1383e1e35c12b2c5901041a7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoalPoints>)))
  "Returns full string definition for message of type '<GoalPoints>"
  (cl:format cl:nil "geometry_msgs/Point[] goal_points~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoalPoints)))
  "Returns full string definition for message of type 'GoalPoints"
  (cl:format cl:nil "geometry_msgs/Point[] goal_points~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoalPoints>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'goal_points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoalPoints>))
  "Converts a ROS message object to a list"
  (cl:list 'GoalPoints
    (cl:cons ':goal_points (goal_points msg))
))
