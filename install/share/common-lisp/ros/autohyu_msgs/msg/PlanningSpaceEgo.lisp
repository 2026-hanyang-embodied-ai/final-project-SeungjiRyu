; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude PlanningSpaceEgo.msg.html

(cl:defclass <PlanningSpaceEgo> (roslisp-msg-protocol:ros-message)
  ((state
    :reader state
    :initarg :state
    :type (cl:vector autohyu_msgs-msg:PlanningSpaceState)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:PlanningSpaceState :initial-element (cl:make-instance 'autohyu_msgs-msg:PlanningSpaceState))))
)

(cl:defclass PlanningSpaceEgo (<PlanningSpaceEgo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PlanningSpaceEgo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PlanningSpaceEgo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<PlanningSpaceEgo> is deprecated: use autohyu_msgs-msg:PlanningSpaceEgo instead.")))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <PlanningSpaceEgo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:state-val is deprecated.  Use autohyu_msgs-msg:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PlanningSpaceEgo>) ostream)
  "Serializes a message object of type '<PlanningSpaceEgo>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'state))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'state))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PlanningSpaceEgo>) istream)
  "Deserializes a message object of type '<PlanningSpaceEgo>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'state) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'state)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:PlanningSpaceState))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PlanningSpaceEgo>)))
  "Returns string type for a message object of type '<PlanningSpaceEgo>"
  "autohyu_msgs/PlanningSpaceEgo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlanningSpaceEgo)))
  "Returns string type for a message object of type 'PlanningSpaceEgo"
  "autohyu_msgs/PlanningSpaceEgo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PlanningSpaceEgo>)))
  "Returns md5sum for a message object of type '<PlanningSpaceEgo>"
  "a7e39028661dc5d2bad0d2373d1ce403")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PlanningSpaceEgo)))
  "Returns md5sum for a message object of type 'PlanningSpaceEgo"
  "a7e39028661dc5d2bad0d2373d1ce403")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PlanningSpaceEgo>)))
  "Returns full string definition for message of type '<PlanningSpaceEgo>"
  (cl:format cl:nil "autohyu_msgs/PlanningSpaceState[] state~%~%================================================================================~%MSG: autohyu_msgs/PlanningSpaceState~%float64 stamp~%float64 x~%float64 y~%float64 heading~%float64 vx~%float64 vy~%float64 ax~%float64 ay~%float64 tire_angle~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PlanningSpaceEgo)))
  "Returns full string definition for message of type 'PlanningSpaceEgo"
  (cl:format cl:nil "autohyu_msgs/PlanningSpaceState[] state~%~%================================================================================~%MSG: autohyu_msgs/PlanningSpaceState~%float64 stamp~%float64 x~%float64 y~%float64 heading~%float64 vx~%float64 vy~%float64 ax~%float64 ay~%float64 tire_angle~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PlanningSpaceEgo>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'state) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PlanningSpaceEgo>))
  "Converts a ROS message object to a list"
  (cl:list 'PlanningSpaceEgo
    (cl:cons ':state (state msg))
))
