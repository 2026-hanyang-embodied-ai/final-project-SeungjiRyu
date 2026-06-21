; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude Lanelet.msg.html

(cl:defclass <Lanelet> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (is_ego
    :reader is_ego
    :initarg :is_ego
    :type cl:boolean
    :initform cl:nil)
   (is_goal
    :reader is_goal
    :initarg :is_goal
    :type cl:boolean
    :initform cl:nil)
   (is_shortest_path
    :reader is_shortest_path
    :initarg :is_shortest_path
    :type cl:boolean
    :initform cl:nil)
   (left_boundary_line_id
    :reader left_boundary_line_id
    :initarg :left_boundary_line_id
    :type cl:integer
    :initform 0)
   (right_boundary_line_id
    :reader right_boundary_line_id
    :initarg :right_boundary_line_id
    :type cl:integer
    :initform 0)
   (relation
    :reader relation
    :initarg :relation
    :type (cl:vector autohyu_msgs-msg:LaneletRelation)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:LaneletRelation :initial-element (cl:make-instance 'autohyu_msgs-msg:LaneletRelation)))
   (traffic_sign
    :reader traffic_sign
    :initarg :traffic_sign
    :type (cl:vector autohyu_msgs-msg:LaneletTrafficSign)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:LaneletTrafficSign :initial-element (cl:make-instance 'autohyu_msgs-msg:LaneletTrafficSign)))
   (turn_signal
    :reader turn_signal
    :initarg :turn_signal
    :type (cl:vector autohyu_msgs-msg:LaneletTrafficSign)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:LaneletTrafficSign :initial-element (cl:make-instance 'autohyu_msgs-msg:LaneletTrafficSign)))
   (traffic_light
    :reader traffic_light
    :initarg :traffic_light
    :type (cl:vector autohyu_msgs-msg:LaneletTrafficLight)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:LaneletTrafficLight :initial-element (cl:make-instance 'autohyu_msgs-msg:LaneletTrafficLight))))
)

(cl:defclass Lanelet (<Lanelet>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Lanelet>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Lanelet)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<Lanelet> is deprecated: use autohyu_msgs-msg:Lanelet instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <Lanelet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:id-val is deprecated.  Use autohyu_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'is_ego-val :lambda-list '(m))
(cl:defmethod is_ego-val ((m <Lanelet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:is_ego-val is deprecated.  Use autohyu_msgs-msg:is_ego instead.")
  (is_ego m))

(cl:ensure-generic-function 'is_goal-val :lambda-list '(m))
(cl:defmethod is_goal-val ((m <Lanelet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:is_goal-val is deprecated.  Use autohyu_msgs-msg:is_goal instead.")
  (is_goal m))

(cl:ensure-generic-function 'is_shortest_path-val :lambda-list '(m))
(cl:defmethod is_shortest_path-val ((m <Lanelet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:is_shortest_path-val is deprecated.  Use autohyu_msgs-msg:is_shortest_path instead.")
  (is_shortest_path m))

(cl:ensure-generic-function 'left_boundary_line_id-val :lambda-list '(m))
(cl:defmethod left_boundary_line_id-val ((m <Lanelet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:left_boundary_line_id-val is deprecated.  Use autohyu_msgs-msg:left_boundary_line_id instead.")
  (left_boundary_line_id m))

(cl:ensure-generic-function 'right_boundary_line_id-val :lambda-list '(m))
(cl:defmethod right_boundary_line_id-val ((m <Lanelet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:right_boundary_line_id-val is deprecated.  Use autohyu_msgs-msg:right_boundary_line_id instead.")
  (right_boundary_line_id m))

(cl:ensure-generic-function 'relation-val :lambda-list '(m))
(cl:defmethod relation-val ((m <Lanelet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:relation-val is deprecated.  Use autohyu_msgs-msg:relation instead.")
  (relation m))

(cl:ensure-generic-function 'traffic_sign-val :lambda-list '(m))
(cl:defmethod traffic_sign-val ((m <Lanelet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:traffic_sign-val is deprecated.  Use autohyu_msgs-msg:traffic_sign instead.")
  (traffic_sign m))

(cl:ensure-generic-function 'turn_signal-val :lambda-list '(m))
(cl:defmethod turn_signal-val ((m <Lanelet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:turn_signal-val is deprecated.  Use autohyu_msgs-msg:turn_signal instead.")
  (turn_signal m))

(cl:ensure-generic-function 'traffic_light-val :lambda-list '(m))
(cl:defmethod traffic_light-val ((m <Lanelet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:traffic_light-val is deprecated.  Use autohyu_msgs-msg:traffic_light instead.")
  (traffic_light m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Lanelet>) ostream)
  "Serializes a message object of type '<Lanelet>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_ego) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_goal) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_shortest_path) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'left_boundary_line_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'right_boundary_line_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'relation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'relation))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'traffic_sign))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'traffic_sign))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'turn_signal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'turn_signal))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'traffic_light))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'traffic_light))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Lanelet>) istream)
  "Deserializes a message object of type '<Lanelet>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:setf (cl:slot-value msg 'is_ego) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'is_goal) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'is_shortest_path) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left_boundary_line_id) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right_boundary_line_id) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'relation) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'relation)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:LaneletRelation))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'traffic_sign) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'traffic_sign)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:LaneletTrafficSign))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'turn_signal) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'turn_signal)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:LaneletTrafficSign))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'traffic_light) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'traffic_light)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:LaneletTrafficLight))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Lanelet>)))
  "Returns string type for a message object of type '<Lanelet>"
  "autohyu_msgs/Lanelet")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Lanelet)))
  "Returns string type for a message object of type 'Lanelet"
  "autohyu_msgs/Lanelet")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Lanelet>)))
  "Returns md5sum for a message object of type '<Lanelet>"
  "70053e1f1419d63eb5b6723712e051a8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Lanelet)))
  "Returns md5sum for a message object of type 'Lanelet"
  "70053e1f1419d63eb5b6723712e051a8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Lanelet>)))
  "Returns full string definition for message of type '<Lanelet>"
  (cl:format cl:nil "int64 id~%bool is_ego~%bool is_goal~%bool is_shortest_path~%int64 left_boundary_line_id~%int64 right_boundary_line_id~%autohyu_msgs/LaneletRelation[] relation~%autohyu_msgs/LaneletTrafficSign[] traffic_sign~%autohyu_msgs/LaneletTrafficSign[] turn_signal~%autohyu_msgs/LaneletTrafficLight[] traffic_light~%================================================================================~%MSG: autohyu_msgs/LaneletRelation~%# Relation between lanes~%uint8 NONE = 0~%uint8 SUCCESSOR = 1~%uint8 LEFT = 2~%uint8 RIGHT = 3~%uint8 ADJACENT_LEFT = 4~%uint8 ADJACENT_RIGHT = 5~%uint8 CONFLICTING = 6~%uint8 AREA = 7~%~%int64 id~%uint8 type~%================================================================================~%MSG: autohyu_msgs/LaneletTrafficSign~%int64 id~%string element_type~%geometry_msgs/Point[] point~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: autohyu_msgs/LaneletTrafficLight~%int64 sign_id~%int64 intersection_id~%string light_type~%geometry_msgs/Point[] stop_point~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Lanelet)))
  "Returns full string definition for message of type 'Lanelet"
  (cl:format cl:nil "int64 id~%bool is_ego~%bool is_goal~%bool is_shortest_path~%int64 left_boundary_line_id~%int64 right_boundary_line_id~%autohyu_msgs/LaneletRelation[] relation~%autohyu_msgs/LaneletTrafficSign[] traffic_sign~%autohyu_msgs/LaneletTrafficSign[] turn_signal~%autohyu_msgs/LaneletTrafficLight[] traffic_light~%================================================================================~%MSG: autohyu_msgs/LaneletRelation~%# Relation between lanes~%uint8 NONE = 0~%uint8 SUCCESSOR = 1~%uint8 LEFT = 2~%uint8 RIGHT = 3~%uint8 ADJACENT_LEFT = 4~%uint8 ADJACENT_RIGHT = 5~%uint8 CONFLICTING = 6~%uint8 AREA = 7~%~%int64 id~%uint8 type~%================================================================================~%MSG: autohyu_msgs/LaneletTrafficSign~%int64 id~%string element_type~%geometry_msgs/Point[] point~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: autohyu_msgs/LaneletTrafficLight~%int64 sign_id~%int64 intersection_id~%string light_type~%geometry_msgs/Point[] stop_point~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Lanelet>))
  (cl:+ 0
     8
     1
     1
     1
     8
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'relation) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'traffic_sign) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'turn_signal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'traffic_light) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Lanelet>))
  "Converts a ROS message object to a list"
  (cl:list 'Lanelet
    (cl:cons ':id (id msg))
    (cl:cons ':is_ego (is_ego msg))
    (cl:cons ':is_goal (is_goal msg))
    (cl:cons ':is_shortest_path (is_shortest_path msg))
    (cl:cons ':left_boundary_line_id (left_boundary_line_id msg))
    (cl:cons ':right_boundary_line_id (right_boundary_line_id msg))
    (cl:cons ':relation (relation msg))
    (cl:cons ':traffic_sign (traffic_sign msg))
    (cl:cons ':turn_signal (turn_signal msg))
    (cl:cons ':traffic_light (traffic_light msg))
))
