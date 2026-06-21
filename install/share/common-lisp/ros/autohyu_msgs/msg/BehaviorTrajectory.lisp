; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude BehaviorTrajectory.msg.html

(cl:defclass <BehaviorTrajectory> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (on_ego
    :reader on_ego
    :initarg :on_ego
    :type cl:fixnum
    :initform 0)
   (left_boundary
    :reader left_boundary
    :initarg :left_boundary
    :type autohyu_msgs-msg:TrajectoryBoundary
    :initform (cl:make-instance 'autohyu_msgs-msg:TrajectoryBoundary))
   (right_boundary
    :reader right_boundary
    :initarg :right_boundary
    :type autohyu_msgs-msg:TrajectoryBoundary
    :initform (cl:make-instance 'autohyu_msgs-msg:TrajectoryBoundary))
   (spatial_trajectory
    :reader spatial_trajectory
    :initarg :spatial_trajectory
    :type autohyu_msgs-msg:SpatialTrajectory
    :initform (cl:make-instance 'autohyu_msgs-msg:SpatialTrajectory))
   (temporal_trajectory
    :reader temporal_trajectory
    :initarg :temporal_trajectory
    :type autohyu_msgs-msg:TemporalTrajectory
    :initform (cl:make-instance 'autohyu_msgs-msg:TemporalTrajectory))
   (point
    :reader point
    :initarg :point
    :type (cl:vector autohyu_msgs-msg:BehaviorTrajectoryPoint)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:BehaviorTrajectoryPoint :initial-element (cl:make-instance 'autohyu_msgs-msg:BehaviorTrajectoryPoint))))
)

(cl:defclass BehaviorTrajectory (<BehaviorTrajectory>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BehaviorTrajectory>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BehaviorTrajectory)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<BehaviorTrajectory> is deprecated: use autohyu_msgs-msg:BehaviorTrajectory instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BehaviorTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:header-val is deprecated.  Use autohyu_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <BehaviorTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:id-val is deprecated.  Use autohyu_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'on_ego-val :lambda-list '(m))
(cl:defmethod on_ego-val ((m <BehaviorTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:on_ego-val is deprecated.  Use autohyu_msgs-msg:on_ego instead.")
  (on_ego m))

(cl:ensure-generic-function 'left_boundary-val :lambda-list '(m))
(cl:defmethod left_boundary-val ((m <BehaviorTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:left_boundary-val is deprecated.  Use autohyu_msgs-msg:left_boundary instead.")
  (left_boundary m))

(cl:ensure-generic-function 'right_boundary-val :lambda-list '(m))
(cl:defmethod right_boundary-val ((m <BehaviorTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:right_boundary-val is deprecated.  Use autohyu_msgs-msg:right_boundary instead.")
  (right_boundary m))

(cl:ensure-generic-function 'spatial_trajectory-val :lambda-list '(m))
(cl:defmethod spatial_trajectory-val ((m <BehaviorTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:spatial_trajectory-val is deprecated.  Use autohyu_msgs-msg:spatial_trajectory instead.")
  (spatial_trajectory m))

(cl:ensure-generic-function 'temporal_trajectory-val :lambda-list '(m))
(cl:defmethod temporal_trajectory-val ((m <BehaviorTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:temporal_trajectory-val is deprecated.  Use autohyu_msgs-msg:temporal_trajectory instead.")
  (temporal_trajectory m))

(cl:ensure-generic-function 'point-val :lambda-list '(m))
(cl:defmethod point-val ((m <BehaviorTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:point-val is deprecated.  Use autohyu_msgs-msg:point instead.")
  (point m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BehaviorTrajectory>) ostream)
  "Serializes a message object of type '<BehaviorTrajectory>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'on_ego)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'on_ego)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'left_boundary) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'right_boundary) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'spatial_trajectory) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'temporal_trajectory) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'point))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'point))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BehaviorTrajectory>) istream)
  "Deserializes a message object of type '<BehaviorTrajectory>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'on_ego)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'on_ego)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'left_boundary) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'right_boundary) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'spatial_trajectory) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'temporal_trajectory) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'point) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'point)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:BehaviorTrajectoryPoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BehaviorTrajectory>)))
  "Returns string type for a message object of type '<BehaviorTrajectory>"
  "autohyu_msgs/BehaviorTrajectory")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BehaviorTrajectory)))
  "Returns string type for a message object of type 'BehaviorTrajectory"
  "autohyu_msgs/BehaviorTrajectory")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BehaviorTrajectory>)))
  "Returns md5sum for a message object of type '<BehaviorTrajectory>"
  "618077a927e8fc3bc8c10db54e2ae18e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BehaviorTrajectory)))
  "Returns md5sum for a message object of type 'BehaviorTrajectory"
  "618077a927e8fc3bc8c10db54e2ae18e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BehaviorTrajectory>)))
  "Returns full string definition for message of type '<BehaviorTrajectory>"
  (cl:format cl:nil "std_msgs/Header header ~%uint32 id~%uint16 on_ego~%~%autohyu_msgs/TrajectoryBoundary left_boundary~%autohyu_msgs/TrajectoryBoundary right_boundary~%autohyu_msgs/SpatialTrajectory spatial_trajectory~%autohyu_msgs/TemporalTrajectory temporal_trajectory~%autohyu_msgs/BehaviorTrajectoryPoint[] point~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: autohyu_msgs/TrajectoryBoundary~%autohyu_msgs/TrajectoryBoundaryPoint[] point~%================================================================================~%MSG: autohyu_msgs/TrajectoryBoundaryPoint~%float32 x~%float32 y~%float32 z~%float32 s~%float32 n~%================================================================================~%MSG: autohyu_msgs/SpatialTrajectory~%autohyu_msgs/SpatialTrajectoryPoint[] point~%================================================================================~%MSG: autohyu_msgs/SpatialTrajectoryPoint~%float32 x~%float32 y~%float32 z~%bool on_shortest_path~%int16 lane_num~%================================================================================~%MSG: autohyu_msgs/TemporalTrajectory~%autohyu_msgs/TemporalTrajectoryPoint[] point~%================================================================================~%MSG: autohyu_msgs/TemporalTrajectoryPoint~%float32 time~%float32 distance~%float32 curvature~%float32 speed~%float32 ref_speed~%================================================================================~%MSG: autohyu_msgs/BehaviorTrajectoryPoint~%float64 time~%float64 distance~%float64 x~%float64 y~%float64 z~%float64 curvature~%float64 speed~%float64 max_speed~%bool    on_shortest_path~%int16   lane_num~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BehaviorTrajectory)))
  "Returns full string definition for message of type 'BehaviorTrajectory"
  (cl:format cl:nil "std_msgs/Header header ~%uint32 id~%uint16 on_ego~%~%autohyu_msgs/TrajectoryBoundary left_boundary~%autohyu_msgs/TrajectoryBoundary right_boundary~%autohyu_msgs/SpatialTrajectory spatial_trajectory~%autohyu_msgs/TemporalTrajectory temporal_trajectory~%autohyu_msgs/BehaviorTrajectoryPoint[] point~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: autohyu_msgs/TrajectoryBoundary~%autohyu_msgs/TrajectoryBoundaryPoint[] point~%================================================================================~%MSG: autohyu_msgs/TrajectoryBoundaryPoint~%float32 x~%float32 y~%float32 z~%float32 s~%float32 n~%================================================================================~%MSG: autohyu_msgs/SpatialTrajectory~%autohyu_msgs/SpatialTrajectoryPoint[] point~%================================================================================~%MSG: autohyu_msgs/SpatialTrajectoryPoint~%float32 x~%float32 y~%float32 z~%bool on_shortest_path~%int16 lane_num~%================================================================================~%MSG: autohyu_msgs/TemporalTrajectory~%autohyu_msgs/TemporalTrajectoryPoint[] point~%================================================================================~%MSG: autohyu_msgs/TemporalTrajectoryPoint~%float32 time~%float32 distance~%float32 curvature~%float32 speed~%float32 ref_speed~%================================================================================~%MSG: autohyu_msgs/BehaviorTrajectoryPoint~%float64 time~%float64 distance~%float64 x~%float64 y~%float64 z~%float64 curvature~%float64 speed~%float64 max_speed~%bool    on_shortest_path~%int16   lane_num~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BehaviorTrajectory>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     2
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'left_boundary))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'right_boundary))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'spatial_trajectory))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'temporal_trajectory))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'point) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BehaviorTrajectory>))
  "Converts a ROS message object to a list"
  (cl:list 'BehaviorTrajectory
    (cl:cons ':header (header msg))
    (cl:cons ':id (id msg))
    (cl:cons ':on_ego (on_ego msg))
    (cl:cons ':left_boundary (left_boundary msg))
    (cl:cons ':right_boundary (right_boundary msg))
    (cl:cons ':spatial_trajectory (spatial_trajectory msg))
    (cl:cons ':temporal_trajectory (temporal_trajectory msg))
    (cl:cons ':point (point msg))
))
