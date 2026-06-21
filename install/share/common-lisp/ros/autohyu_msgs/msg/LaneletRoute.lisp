; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude LaneletRoute.msg.html

(cl:defclass <LaneletRoute> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (lanelet
    :reader lanelet
    :initarg :lanelet
    :type (cl:vector autohyu_msgs-msg:Lanelet)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:Lanelet :initial-element (cl:make-instance 'autohyu_msgs-msg:Lanelet)))
   (boundary_line
    :reader boundary_line
    :initarg :boundary_line
    :type (cl:vector autohyu_msgs-msg:LaneletLine)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:LaneletLine :initial-element (cl:make-instance 'autohyu_msgs-msg:LaneletLine)))
   (center_lane
    :reader center_lane
    :initarg :center_lane
    :type (cl:vector autohyu_msgs-msg:LaneletLane)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:LaneletLane :initial-element (cl:make-instance 'autohyu_msgs-msg:LaneletLane))))
)

(cl:defclass LaneletRoute (<LaneletRoute>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LaneletRoute>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LaneletRoute)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<LaneletRoute> is deprecated: use autohyu_msgs-msg:LaneletRoute instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <LaneletRoute>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:header-val is deprecated.  Use autohyu_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'lanelet-val :lambda-list '(m))
(cl:defmethod lanelet-val ((m <LaneletRoute>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:lanelet-val is deprecated.  Use autohyu_msgs-msg:lanelet instead.")
  (lanelet m))

(cl:ensure-generic-function 'boundary_line-val :lambda-list '(m))
(cl:defmethod boundary_line-val ((m <LaneletRoute>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:boundary_line-val is deprecated.  Use autohyu_msgs-msg:boundary_line instead.")
  (boundary_line m))

(cl:ensure-generic-function 'center_lane-val :lambda-list '(m))
(cl:defmethod center_lane-val ((m <LaneletRoute>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:center_lane-val is deprecated.  Use autohyu_msgs-msg:center_lane instead.")
  (center_lane m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LaneletRoute>) ostream)
  "Serializes a message object of type '<LaneletRoute>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'lanelet))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'lanelet))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'boundary_line))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'boundary_line))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'center_lane))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'center_lane))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LaneletRoute>) istream)
  "Deserializes a message object of type '<LaneletRoute>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'lanelet) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'lanelet)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:Lanelet))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'boundary_line) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'boundary_line)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:LaneletLine))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'center_lane) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'center_lane)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:LaneletLane))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LaneletRoute>)))
  "Returns string type for a message object of type '<LaneletRoute>"
  "autohyu_msgs/LaneletRoute")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LaneletRoute)))
  "Returns string type for a message object of type 'LaneletRoute"
  "autohyu_msgs/LaneletRoute")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LaneletRoute>)))
  "Returns md5sum for a message object of type '<LaneletRoute>"
  "cd094afb7c96ccd6501ac3bbfa0c72d6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LaneletRoute)))
  "Returns md5sum for a message object of type 'LaneletRoute"
  "cd094afb7c96ccd6501ac3bbfa0c72d6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LaneletRoute>)))
  "Returns full string definition for message of type '<LaneletRoute>"
  (cl:format cl:nil "std_msgs/Header header~%~%autohyu_msgs/Lanelet[] lanelet~%autohyu_msgs/LaneletLine[] boundary_line~%autohyu_msgs/LaneletLane[] center_lane~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: autohyu_msgs/Lanelet~%int64 id~%bool is_ego~%bool is_goal~%bool is_shortest_path~%int64 left_boundary_line_id~%int64 right_boundary_line_id~%autohyu_msgs/LaneletRelation[] relation~%autohyu_msgs/LaneletTrafficSign[] traffic_sign~%autohyu_msgs/LaneletTrafficSign[] turn_signal~%autohyu_msgs/LaneletTrafficLight[] traffic_light~%================================================================================~%MSG: autohyu_msgs/LaneletRelation~%# Relation between lanes~%uint8 NONE = 0~%uint8 SUCCESSOR = 1~%uint8 LEFT = 2~%uint8 RIGHT = 3~%uint8 ADJACENT_LEFT = 4~%uint8 ADJACENT_RIGHT = 5~%uint8 CONFLICTING = 6~%uint8 AREA = 7~%~%int64 id~%uint8 type~%================================================================================~%MSG: autohyu_msgs/LaneletTrafficSign~%int64 id~%string element_type~%geometry_msgs/Point[] point~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: autohyu_msgs/LaneletTrafficLight~%int64 sign_id~%int64 intersection_id~%string light_type~%geometry_msgs/Point[] stop_point~%================================================================================~%MSG: autohyu_msgs/LaneletLine~%int64 id~%string line_type~%string line_color~%geometry_msgs/Point[] point~%================================================================================~%MSG: autohyu_msgs/LaneletLane~%int64 id~%int64 lane_num~%float64 max_speed~%geometry_msgs/Point[] point~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LaneletRoute)))
  "Returns full string definition for message of type 'LaneletRoute"
  (cl:format cl:nil "std_msgs/Header header~%~%autohyu_msgs/Lanelet[] lanelet~%autohyu_msgs/LaneletLine[] boundary_line~%autohyu_msgs/LaneletLane[] center_lane~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: autohyu_msgs/Lanelet~%int64 id~%bool is_ego~%bool is_goal~%bool is_shortest_path~%int64 left_boundary_line_id~%int64 right_boundary_line_id~%autohyu_msgs/LaneletRelation[] relation~%autohyu_msgs/LaneletTrafficSign[] traffic_sign~%autohyu_msgs/LaneletTrafficSign[] turn_signal~%autohyu_msgs/LaneletTrafficLight[] traffic_light~%================================================================================~%MSG: autohyu_msgs/LaneletRelation~%# Relation between lanes~%uint8 NONE = 0~%uint8 SUCCESSOR = 1~%uint8 LEFT = 2~%uint8 RIGHT = 3~%uint8 ADJACENT_LEFT = 4~%uint8 ADJACENT_RIGHT = 5~%uint8 CONFLICTING = 6~%uint8 AREA = 7~%~%int64 id~%uint8 type~%================================================================================~%MSG: autohyu_msgs/LaneletTrafficSign~%int64 id~%string element_type~%geometry_msgs/Point[] point~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: autohyu_msgs/LaneletTrafficLight~%int64 sign_id~%int64 intersection_id~%string light_type~%geometry_msgs/Point[] stop_point~%================================================================================~%MSG: autohyu_msgs/LaneletLine~%int64 id~%string line_type~%string line_color~%geometry_msgs/Point[] point~%================================================================================~%MSG: autohyu_msgs/LaneletLane~%int64 id~%int64 lane_num~%float64 max_speed~%geometry_msgs/Point[] point~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LaneletRoute>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'lanelet) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'boundary_line) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'center_lane) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LaneletRoute>))
  "Converts a ROS message object to a list"
  (cl:list 'LaneletRoute
    (cl:cons ':header (header msg))
    (cl:cons ':lanelet (lanelet msg))
    (cl:cons ':boundary_line (boundary_line msg))
    (cl:cons ':center_lane (center_lane msg))
))
