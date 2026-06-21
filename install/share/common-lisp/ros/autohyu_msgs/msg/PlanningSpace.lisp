; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude PlanningSpace.msg.html

(cl:defclass <PlanningSpace> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (ego
    :reader ego
    :initarg :ego
    :type autohyu_msgs-msg:PlanningSpaceEgo
    :initform (cl:make-instance 'autohyu_msgs-msg:PlanningSpaceEgo))
   (objects
    :reader objects
    :initarg :objects
    :type (cl:vector autohyu_msgs-msg:PlanningSpaceObject)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:PlanningSpaceObject :initial-element (cl:make-instance 'autohyu_msgs-msg:PlanningSpaceObject)))
   (lanes
    :reader lanes
    :initarg :lanes
    :type (cl:vector autohyu_msgs-msg:PlanningSpaceVectorMap)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:PlanningSpaceVectorMap :initial-element (cl:make-instance 'autohyu_msgs-msg:PlanningSpaceVectorMap)))
   (routes
    :reader routes
    :initarg :routes
    :type (cl:vector autohyu_msgs-msg:PlanningSpaceVectorMap)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:PlanningSpaceVectorMap :initial-element (cl:make-instance 'autohyu_msgs-msg:PlanningSpaceVectorMap)))
   (crosswalks
    :reader crosswalks
    :initarg :crosswalks
    :type (cl:vector autohyu_msgs-msg:PlanningSpaceVectorMap)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:PlanningSpaceVectorMap :initial-element (cl:make-instance 'autohyu_msgs-msg:PlanningSpaceVectorMap)))
   (goal_routes
    :reader goal_routes
    :initarg :goal_routes
    :type (cl:vector autohyu_msgs-msg:PlanningSpaceVectorMap)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:PlanningSpaceVectorMap :initial-element (cl:make-instance 'autohyu_msgs-msg:PlanningSpaceVectorMap))))
)

(cl:defclass PlanningSpace (<PlanningSpace>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PlanningSpace>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PlanningSpace)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<PlanningSpace> is deprecated: use autohyu_msgs-msg:PlanningSpace instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <PlanningSpace>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:header-val is deprecated.  Use autohyu_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'ego-val :lambda-list '(m))
(cl:defmethod ego-val ((m <PlanningSpace>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:ego-val is deprecated.  Use autohyu_msgs-msg:ego instead.")
  (ego m))

(cl:ensure-generic-function 'objects-val :lambda-list '(m))
(cl:defmethod objects-val ((m <PlanningSpace>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:objects-val is deprecated.  Use autohyu_msgs-msg:objects instead.")
  (objects m))

(cl:ensure-generic-function 'lanes-val :lambda-list '(m))
(cl:defmethod lanes-val ((m <PlanningSpace>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:lanes-val is deprecated.  Use autohyu_msgs-msg:lanes instead.")
  (lanes m))

(cl:ensure-generic-function 'routes-val :lambda-list '(m))
(cl:defmethod routes-val ((m <PlanningSpace>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:routes-val is deprecated.  Use autohyu_msgs-msg:routes instead.")
  (routes m))

(cl:ensure-generic-function 'crosswalks-val :lambda-list '(m))
(cl:defmethod crosswalks-val ((m <PlanningSpace>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:crosswalks-val is deprecated.  Use autohyu_msgs-msg:crosswalks instead.")
  (crosswalks m))

(cl:ensure-generic-function 'goal_routes-val :lambda-list '(m))
(cl:defmethod goal_routes-val ((m <PlanningSpace>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:goal_routes-val is deprecated.  Use autohyu_msgs-msg:goal_routes instead.")
  (goal_routes m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PlanningSpace>) ostream)
  "Serializes a message object of type '<PlanningSpace>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ego) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'objects))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'objects))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'lanes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'lanes))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'routes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'routes))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'crosswalks))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'crosswalks))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'goal_routes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'goal_routes))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PlanningSpace>) istream)
  "Deserializes a message object of type '<PlanningSpace>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ego) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'objects) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'objects)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:PlanningSpaceObject))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'lanes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'lanes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:PlanningSpaceVectorMap))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'routes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'routes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:PlanningSpaceVectorMap))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'crosswalks) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'crosswalks)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:PlanningSpaceVectorMap))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'goal_routes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'goal_routes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:PlanningSpaceVectorMap))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PlanningSpace>)))
  "Returns string type for a message object of type '<PlanningSpace>"
  "autohyu_msgs/PlanningSpace")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlanningSpace)))
  "Returns string type for a message object of type 'PlanningSpace"
  "autohyu_msgs/PlanningSpace")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PlanningSpace>)))
  "Returns md5sum for a message object of type '<PlanningSpace>"
  "687f829ec6579e0ea7ab55d15b5a120c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PlanningSpace)))
  "Returns md5sum for a message object of type 'PlanningSpace"
  "687f829ec6579e0ea7ab55d15b5a120c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PlanningSpace>)))
  "Returns full string definition for message of type '<PlanningSpace>"
  (cl:format cl:nil "std_msgs/Header header~%~%# Ego~%autohyu_msgs/PlanningSpaceEgo ego~%~%# Objects~%autohyu_msgs/PlanningSpaceObject[] objects~%~%# Vector Map~%autohyu_msgs/PlanningSpaceVectorMap[] lanes~%autohyu_msgs/PlanningSpaceVectorMap[] routes~%autohyu_msgs/PlanningSpaceVectorMap[] crosswalks~%autohyu_msgs/PlanningSpaceVectorMap[] goal_routes~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: autohyu_msgs/PlanningSpaceEgo~%autohyu_msgs/PlanningSpaceState[] state~%~%================================================================================~%MSG: autohyu_msgs/PlanningSpaceState~%float64 stamp~%float64 x~%float64 y~%float64 heading~%float64 vx~%float64 vy~%float64 ax~%float64 ay~%float64 tire_angle~%================================================================================~%MSG: autohyu_msgs/PlanningSpaceObject~%uint64  id~%float64 length~%float64 width~%float64 height~%uint16  classification~%~%autohyu_msgs/PlanningSpaceState[] state~%================================================================================~%MSG: autohyu_msgs/PlanningSpaceVectorMap~%int64 id~%bool is_dividing_lane~%int64 traffic_light_id~%int32 traffic_light_color~%float64 max_speed~%autohyu_msgs/PlanningSpacePoint[] point~%autohyu_msgs/PlanningSpacePoint[] left_boundary~%autohyu_msgs/PlanningSpacePoint[] right_boundary~%================================================================================~%MSG: autohyu_msgs/PlanningSpacePoint~%float64 x~%float64 y~%float64 heading~%string  traffic_light_id~%uint16  traffic_light_color~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PlanningSpace)))
  "Returns full string definition for message of type 'PlanningSpace"
  (cl:format cl:nil "std_msgs/Header header~%~%# Ego~%autohyu_msgs/PlanningSpaceEgo ego~%~%# Objects~%autohyu_msgs/PlanningSpaceObject[] objects~%~%# Vector Map~%autohyu_msgs/PlanningSpaceVectorMap[] lanes~%autohyu_msgs/PlanningSpaceVectorMap[] routes~%autohyu_msgs/PlanningSpaceVectorMap[] crosswalks~%autohyu_msgs/PlanningSpaceVectorMap[] goal_routes~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: autohyu_msgs/PlanningSpaceEgo~%autohyu_msgs/PlanningSpaceState[] state~%~%================================================================================~%MSG: autohyu_msgs/PlanningSpaceState~%float64 stamp~%float64 x~%float64 y~%float64 heading~%float64 vx~%float64 vy~%float64 ax~%float64 ay~%float64 tire_angle~%================================================================================~%MSG: autohyu_msgs/PlanningSpaceObject~%uint64  id~%float64 length~%float64 width~%float64 height~%uint16  classification~%~%autohyu_msgs/PlanningSpaceState[] state~%================================================================================~%MSG: autohyu_msgs/PlanningSpaceVectorMap~%int64 id~%bool is_dividing_lane~%int64 traffic_light_id~%int32 traffic_light_color~%float64 max_speed~%autohyu_msgs/PlanningSpacePoint[] point~%autohyu_msgs/PlanningSpacePoint[] left_boundary~%autohyu_msgs/PlanningSpacePoint[] right_boundary~%================================================================================~%MSG: autohyu_msgs/PlanningSpacePoint~%float64 x~%float64 y~%float64 heading~%string  traffic_light_id~%uint16  traffic_light_color~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PlanningSpace>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ego))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'objects) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'lanes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'routes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'crosswalks) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'goal_routes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PlanningSpace>))
  "Converts a ROS message object to a list"
  (cl:list 'PlanningSpace
    (cl:cons ':header (header msg))
    (cl:cons ':ego (ego msg))
    (cl:cons ':objects (objects msg))
    (cl:cons ':lanes (lanes msg))
    (cl:cons ':routes (routes msg))
    (cl:cons ':crosswalks (crosswalks msg))
    (cl:cons ':goal_routes (goal_routes msg))
))
