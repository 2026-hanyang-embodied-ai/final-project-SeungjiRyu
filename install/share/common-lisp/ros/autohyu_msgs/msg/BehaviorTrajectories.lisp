; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude BehaviorTrajectories.msg.html

(cl:defclass <BehaviorTrajectories> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (lk_trajectory
    :reader lk_trajectory
    :initarg :lk_trajectory
    :type autohyu_msgs-msg:BehaviorTrajectory
    :initform (cl:make-instance 'autohyu_msgs-msg:BehaviorTrajectory))
   (llc_trajectory
    :reader llc_trajectory
    :initarg :llc_trajectory
    :type autohyu_msgs-msg:BehaviorTrajectory
    :initform (cl:make-instance 'autohyu_msgs-msg:BehaviorTrajectory))
   (rlc_trajectory
    :reader rlc_trajectory
    :initarg :rlc_trajectory
    :type autohyu_msgs-msg:BehaviorTrajectory
    :initform (cl:make-instance 'autohyu_msgs-msg:BehaviorTrajectory)))
)

(cl:defclass BehaviorTrajectories (<BehaviorTrajectories>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BehaviorTrajectories>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BehaviorTrajectories)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<BehaviorTrajectories> is deprecated: use autohyu_msgs-msg:BehaviorTrajectories instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BehaviorTrajectories>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:header-val is deprecated.  Use autohyu_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'lk_trajectory-val :lambda-list '(m))
(cl:defmethod lk_trajectory-val ((m <BehaviorTrajectories>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:lk_trajectory-val is deprecated.  Use autohyu_msgs-msg:lk_trajectory instead.")
  (lk_trajectory m))

(cl:ensure-generic-function 'llc_trajectory-val :lambda-list '(m))
(cl:defmethod llc_trajectory-val ((m <BehaviorTrajectories>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:llc_trajectory-val is deprecated.  Use autohyu_msgs-msg:llc_trajectory instead.")
  (llc_trajectory m))

(cl:ensure-generic-function 'rlc_trajectory-val :lambda-list '(m))
(cl:defmethod rlc_trajectory-val ((m <BehaviorTrajectories>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:rlc_trajectory-val is deprecated.  Use autohyu_msgs-msg:rlc_trajectory instead.")
  (rlc_trajectory m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BehaviorTrajectories>) ostream)
  "Serializes a message object of type '<BehaviorTrajectories>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'lk_trajectory) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'llc_trajectory) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rlc_trajectory) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BehaviorTrajectories>) istream)
  "Deserializes a message object of type '<BehaviorTrajectories>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'lk_trajectory) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'llc_trajectory) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rlc_trajectory) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BehaviorTrajectories>)))
  "Returns string type for a message object of type '<BehaviorTrajectories>"
  "autohyu_msgs/BehaviorTrajectories")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BehaviorTrajectories)))
  "Returns string type for a message object of type 'BehaviorTrajectories"
  "autohyu_msgs/BehaviorTrajectories")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BehaviorTrajectories>)))
  "Returns md5sum for a message object of type '<BehaviorTrajectories>"
  "52400c4f5560d8aa896438806fcd541e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BehaviorTrajectories)))
  "Returns md5sum for a message object of type 'BehaviorTrajectories"
  "52400c4f5560d8aa896438806fcd541e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BehaviorTrajectories>)))
  "Returns full string definition for message of type '<BehaviorTrajectories>"
  (cl:format cl:nil "std_msgs/Header header ~%~%autohyu_msgs/BehaviorTrajectory lk_trajectory~%autohyu_msgs/BehaviorTrajectory llc_trajectory~%autohyu_msgs/BehaviorTrajectory rlc_trajectory~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: autohyu_msgs/BehaviorTrajectory~%std_msgs/Header header ~%uint32 id~%uint16 on_ego~%~%autohyu_msgs/TrajectoryBoundary left_boundary~%autohyu_msgs/TrajectoryBoundary right_boundary~%autohyu_msgs/SpatialTrajectory spatial_trajectory~%autohyu_msgs/TemporalTrajectory temporal_trajectory~%autohyu_msgs/BehaviorTrajectoryPoint[] point~%================================================================================~%MSG: autohyu_msgs/TrajectoryBoundary~%autohyu_msgs/TrajectoryBoundaryPoint[] point~%================================================================================~%MSG: autohyu_msgs/TrajectoryBoundaryPoint~%float32 x~%float32 y~%float32 z~%float32 s~%float32 n~%================================================================================~%MSG: autohyu_msgs/SpatialTrajectory~%autohyu_msgs/SpatialTrajectoryPoint[] point~%================================================================================~%MSG: autohyu_msgs/SpatialTrajectoryPoint~%float32 x~%float32 y~%float32 z~%bool on_shortest_path~%int16 lane_num~%================================================================================~%MSG: autohyu_msgs/TemporalTrajectory~%autohyu_msgs/TemporalTrajectoryPoint[] point~%================================================================================~%MSG: autohyu_msgs/TemporalTrajectoryPoint~%float32 time~%float32 distance~%float32 curvature~%float32 speed~%float32 ref_speed~%================================================================================~%MSG: autohyu_msgs/BehaviorTrajectoryPoint~%float64 time~%float64 distance~%float64 x~%float64 y~%float64 z~%float64 curvature~%float64 speed~%float64 max_speed~%bool    on_shortest_path~%int16   lane_num~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BehaviorTrajectories)))
  "Returns full string definition for message of type 'BehaviorTrajectories"
  (cl:format cl:nil "std_msgs/Header header ~%~%autohyu_msgs/BehaviorTrajectory lk_trajectory~%autohyu_msgs/BehaviorTrajectory llc_trajectory~%autohyu_msgs/BehaviorTrajectory rlc_trajectory~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: autohyu_msgs/BehaviorTrajectory~%std_msgs/Header header ~%uint32 id~%uint16 on_ego~%~%autohyu_msgs/TrajectoryBoundary left_boundary~%autohyu_msgs/TrajectoryBoundary right_boundary~%autohyu_msgs/SpatialTrajectory spatial_trajectory~%autohyu_msgs/TemporalTrajectory temporal_trajectory~%autohyu_msgs/BehaviorTrajectoryPoint[] point~%================================================================================~%MSG: autohyu_msgs/TrajectoryBoundary~%autohyu_msgs/TrajectoryBoundaryPoint[] point~%================================================================================~%MSG: autohyu_msgs/TrajectoryBoundaryPoint~%float32 x~%float32 y~%float32 z~%float32 s~%float32 n~%================================================================================~%MSG: autohyu_msgs/SpatialTrajectory~%autohyu_msgs/SpatialTrajectoryPoint[] point~%================================================================================~%MSG: autohyu_msgs/SpatialTrajectoryPoint~%float32 x~%float32 y~%float32 z~%bool on_shortest_path~%int16 lane_num~%================================================================================~%MSG: autohyu_msgs/TemporalTrajectory~%autohyu_msgs/TemporalTrajectoryPoint[] point~%================================================================================~%MSG: autohyu_msgs/TemporalTrajectoryPoint~%float32 time~%float32 distance~%float32 curvature~%float32 speed~%float32 ref_speed~%================================================================================~%MSG: autohyu_msgs/BehaviorTrajectoryPoint~%float64 time~%float64 distance~%float64 x~%float64 y~%float64 z~%float64 curvature~%float64 speed~%float64 max_speed~%bool    on_shortest_path~%int16   lane_num~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BehaviorTrajectories>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'lk_trajectory))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'llc_trajectory))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rlc_trajectory))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BehaviorTrajectories>))
  "Converts a ROS message object to a list"
  (cl:list 'BehaviorTrajectories
    (cl:cons ':header (header msg))
    (cl:cons ':lk_trajectory (lk_trajectory msg))
    (cl:cons ':llc_trajectory (llc_trajectory msg))
    (cl:cons ':rlc_trajectory (rlc_trajectory msg))
))
