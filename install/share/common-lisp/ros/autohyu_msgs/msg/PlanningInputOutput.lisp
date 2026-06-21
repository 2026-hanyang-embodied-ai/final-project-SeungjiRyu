; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude PlanningInputOutput.msg.html

(cl:defclass <PlanningInputOutput> (roslisp-msg-protocol:ros-message)
  ((planning_space
    :reader planning_space
    :initarg :planning_space
    :type autohyu_msgs-msg:PlanningSpace
    :initform (cl:make-instance 'autohyu_msgs-msg:PlanningSpace))
   (trajectory
    :reader trajectory
    :initarg :trajectory
    :type autohyu_msgs-msg:Trajectory
    :initform (cl:make-instance 'autohyu_msgs-msg:Trajectory)))
)

(cl:defclass PlanningInputOutput (<PlanningInputOutput>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PlanningInputOutput>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PlanningInputOutput)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<PlanningInputOutput> is deprecated: use autohyu_msgs-msg:PlanningInputOutput instead.")))

(cl:ensure-generic-function 'planning_space-val :lambda-list '(m))
(cl:defmethod planning_space-val ((m <PlanningInputOutput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:planning_space-val is deprecated.  Use autohyu_msgs-msg:planning_space instead.")
  (planning_space m))

(cl:ensure-generic-function 'trajectory-val :lambda-list '(m))
(cl:defmethod trajectory-val ((m <PlanningInputOutput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:trajectory-val is deprecated.  Use autohyu_msgs-msg:trajectory instead.")
  (trajectory m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PlanningInputOutput>) ostream)
  "Serializes a message object of type '<PlanningInputOutput>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'planning_space) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'trajectory) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PlanningInputOutput>) istream)
  "Deserializes a message object of type '<PlanningInputOutput>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'planning_space) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'trajectory) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PlanningInputOutput>)))
  "Returns string type for a message object of type '<PlanningInputOutput>"
  "autohyu_msgs/PlanningInputOutput")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlanningInputOutput)))
  "Returns string type for a message object of type 'PlanningInputOutput"
  "autohyu_msgs/PlanningInputOutput")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PlanningInputOutput>)))
  "Returns md5sum for a message object of type '<PlanningInputOutput>"
  "e3bbd898c147fd581aa2270138357337")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PlanningInputOutput)))
  "Returns md5sum for a message object of type 'PlanningInputOutput"
  "e3bbd898c147fd581aa2270138357337")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PlanningInputOutput>)))
  "Returns full string definition for message of type '<PlanningInputOutput>"
  (cl:format cl:nil "autohyu_msgs/PlanningSpace planning_space~%autohyu_msgs/Trajectory    trajectory~%~%================================================================================~%MSG: autohyu_msgs/PlanningSpace~%std_msgs/Header header~%~%# Ego~%autohyu_msgs/PlanningSpaceEgo ego~%~%# Objects~%autohyu_msgs/PlanningSpaceObject[] objects~%~%# Vector Map~%autohyu_msgs/PlanningSpaceVectorMap[] lanes~%autohyu_msgs/PlanningSpaceVectorMap[] routes~%autohyu_msgs/PlanningSpaceVectorMap[] crosswalks~%autohyu_msgs/PlanningSpaceVectorMap[] goal_routes~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: autohyu_msgs/PlanningSpaceEgo~%autohyu_msgs/PlanningSpaceState[] state~%~%================================================================================~%MSG: autohyu_msgs/PlanningSpaceState~%float64 stamp~%float64 x~%float64 y~%float64 heading~%float64 vx~%float64 vy~%float64 ax~%float64 ay~%float64 tire_angle~%================================================================================~%MSG: autohyu_msgs/PlanningSpaceObject~%uint64  id~%float64 length~%float64 width~%float64 height~%uint16  classification~%~%autohyu_msgs/PlanningSpaceState[] state~%================================================================================~%MSG: autohyu_msgs/PlanningSpaceVectorMap~%int64 id~%bool is_dividing_lane~%int64 traffic_light_id~%int32 traffic_light_color~%float64 max_speed~%autohyu_msgs/PlanningSpacePoint[] point~%autohyu_msgs/PlanningSpacePoint[] left_boundary~%autohyu_msgs/PlanningSpacePoint[] right_boundary~%================================================================================~%MSG: autohyu_msgs/PlanningSpacePoint~%float64 x~%float64 y~%float64 heading~%string  traffic_light_id~%uint16  traffic_light_color~%================================================================================~%MSG: autohyu_msgs/Trajectory~%# std_msgs/Header~%std_msgs/Header header~%~%uint16 id~%autohyu_msgs/TrajectoryPoint[] point~%================================================================================~%MSG: autohyu_msgs/TrajectoryPoint~%float32 time~%float32 distance~%uint16  direction~%float32 x~%float32 y~%float32 z~%float32 yaw~%float32 curvature~%float32 speed~%float32 acceleration~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PlanningInputOutput)))
  "Returns full string definition for message of type 'PlanningInputOutput"
  (cl:format cl:nil "autohyu_msgs/PlanningSpace planning_space~%autohyu_msgs/Trajectory    trajectory~%~%================================================================================~%MSG: autohyu_msgs/PlanningSpace~%std_msgs/Header header~%~%# Ego~%autohyu_msgs/PlanningSpaceEgo ego~%~%# Objects~%autohyu_msgs/PlanningSpaceObject[] objects~%~%# Vector Map~%autohyu_msgs/PlanningSpaceVectorMap[] lanes~%autohyu_msgs/PlanningSpaceVectorMap[] routes~%autohyu_msgs/PlanningSpaceVectorMap[] crosswalks~%autohyu_msgs/PlanningSpaceVectorMap[] goal_routes~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: autohyu_msgs/PlanningSpaceEgo~%autohyu_msgs/PlanningSpaceState[] state~%~%================================================================================~%MSG: autohyu_msgs/PlanningSpaceState~%float64 stamp~%float64 x~%float64 y~%float64 heading~%float64 vx~%float64 vy~%float64 ax~%float64 ay~%float64 tire_angle~%================================================================================~%MSG: autohyu_msgs/PlanningSpaceObject~%uint64  id~%float64 length~%float64 width~%float64 height~%uint16  classification~%~%autohyu_msgs/PlanningSpaceState[] state~%================================================================================~%MSG: autohyu_msgs/PlanningSpaceVectorMap~%int64 id~%bool is_dividing_lane~%int64 traffic_light_id~%int32 traffic_light_color~%float64 max_speed~%autohyu_msgs/PlanningSpacePoint[] point~%autohyu_msgs/PlanningSpacePoint[] left_boundary~%autohyu_msgs/PlanningSpacePoint[] right_boundary~%================================================================================~%MSG: autohyu_msgs/PlanningSpacePoint~%float64 x~%float64 y~%float64 heading~%string  traffic_light_id~%uint16  traffic_light_color~%================================================================================~%MSG: autohyu_msgs/Trajectory~%# std_msgs/Header~%std_msgs/Header header~%~%uint16 id~%autohyu_msgs/TrajectoryPoint[] point~%================================================================================~%MSG: autohyu_msgs/TrajectoryPoint~%float32 time~%float32 distance~%uint16  direction~%float32 x~%float32 y~%float32 z~%float32 yaw~%float32 curvature~%float32 speed~%float32 acceleration~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PlanningInputOutput>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'planning_space))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'trajectory))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PlanningInputOutput>))
  "Converts a ROS message object to a list"
  (cl:list 'PlanningInputOutput
    (cl:cons ':planning_space (planning_space msg))
    (cl:cons ':trajectory (trajectory msg))
))
