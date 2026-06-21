; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude PlanningSpaceVectorMap.msg.html

(cl:defclass <PlanningSpaceVectorMap> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (is_dividing_lane
    :reader is_dividing_lane
    :initarg :is_dividing_lane
    :type cl:boolean
    :initform cl:nil)
   (traffic_light_id
    :reader traffic_light_id
    :initarg :traffic_light_id
    :type cl:integer
    :initform 0)
   (traffic_light_color
    :reader traffic_light_color
    :initarg :traffic_light_color
    :type cl:integer
    :initform 0)
   (max_speed
    :reader max_speed
    :initarg :max_speed
    :type cl:float
    :initform 0.0)
   (point
    :reader point
    :initarg :point
    :type (cl:vector autohyu_msgs-msg:PlanningSpacePoint)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:PlanningSpacePoint :initial-element (cl:make-instance 'autohyu_msgs-msg:PlanningSpacePoint)))
   (left_boundary
    :reader left_boundary
    :initarg :left_boundary
    :type (cl:vector autohyu_msgs-msg:PlanningSpacePoint)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:PlanningSpacePoint :initial-element (cl:make-instance 'autohyu_msgs-msg:PlanningSpacePoint)))
   (right_boundary
    :reader right_boundary
    :initarg :right_boundary
    :type (cl:vector autohyu_msgs-msg:PlanningSpacePoint)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:PlanningSpacePoint :initial-element (cl:make-instance 'autohyu_msgs-msg:PlanningSpacePoint))))
)

(cl:defclass PlanningSpaceVectorMap (<PlanningSpaceVectorMap>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PlanningSpaceVectorMap>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PlanningSpaceVectorMap)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<PlanningSpaceVectorMap> is deprecated: use autohyu_msgs-msg:PlanningSpaceVectorMap instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <PlanningSpaceVectorMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:id-val is deprecated.  Use autohyu_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'is_dividing_lane-val :lambda-list '(m))
(cl:defmethod is_dividing_lane-val ((m <PlanningSpaceVectorMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:is_dividing_lane-val is deprecated.  Use autohyu_msgs-msg:is_dividing_lane instead.")
  (is_dividing_lane m))

(cl:ensure-generic-function 'traffic_light_id-val :lambda-list '(m))
(cl:defmethod traffic_light_id-val ((m <PlanningSpaceVectorMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:traffic_light_id-val is deprecated.  Use autohyu_msgs-msg:traffic_light_id instead.")
  (traffic_light_id m))

(cl:ensure-generic-function 'traffic_light_color-val :lambda-list '(m))
(cl:defmethod traffic_light_color-val ((m <PlanningSpaceVectorMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:traffic_light_color-val is deprecated.  Use autohyu_msgs-msg:traffic_light_color instead.")
  (traffic_light_color m))

(cl:ensure-generic-function 'max_speed-val :lambda-list '(m))
(cl:defmethod max_speed-val ((m <PlanningSpaceVectorMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:max_speed-val is deprecated.  Use autohyu_msgs-msg:max_speed instead.")
  (max_speed m))

(cl:ensure-generic-function 'point-val :lambda-list '(m))
(cl:defmethod point-val ((m <PlanningSpaceVectorMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:point-val is deprecated.  Use autohyu_msgs-msg:point instead.")
  (point m))

(cl:ensure-generic-function 'left_boundary-val :lambda-list '(m))
(cl:defmethod left_boundary-val ((m <PlanningSpaceVectorMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:left_boundary-val is deprecated.  Use autohyu_msgs-msg:left_boundary instead.")
  (left_boundary m))

(cl:ensure-generic-function 'right_boundary-val :lambda-list '(m))
(cl:defmethod right_boundary-val ((m <PlanningSpaceVectorMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:right_boundary-val is deprecated.  Use autohyu_msgs-msg:right_boundary instead.")
  (right_boundary m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PlanningSpaceVectorMap>) ostream)
  "Serializes a message object of type '<PlanningSpaceVectorMap>"
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_dividing_lane) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'traffic_light_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'traffic_light_color)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'max_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'point))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'point))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'left_boundary))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'left_boundary))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'right_boundary))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'right_boundary))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PlanningSpaceVectorMap>) istream)
  "Deserializes a message object of type '<PlanningSpaceVectorMap>"
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
    (cl:setf (cl:slot-value msg 'is_dividing_lane) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'traffic_light_id) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'traffic_light_color) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_speed) (roslisp-utils:decode-double-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'point) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'point)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:PlanningSpacePoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'left_boundary) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'left_boundary)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:PlanningSpacePoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'right_boundary) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'right_boundary)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:PlanningSpacePoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PlanningSpaceVectorMap>)))
  "Returns string type for a message object of type '<PlanningSpaceVectorMap>"
  "autohyu_msgs/PlanningSpaceVectorMap")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlanningSpaceVectorMap)))
  "Returns string type for a message object of type 'PlanningSpaceVectorMap"
  "autohyu_msgs/PlanningSpaceVectorMap")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PlanningSpaceVectorMap>)))
  "Returns md5sum for a message object of type '<PlanningSpaceVectorMap>"
  "cfb901b2beee878505834aab53d39190")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PlanningSpaceVectorMap)))
  "Returns md5sum for a message object of type 'PlanningSpaceVectorMap"
  "cfb901b2beee878505834aab53d39190")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PlanningSpaceVectorMap>)))
  "Returns full string definition for message of type '<PlanningSpaceVectorMap>"
  (cl:format cl:nil "int64 id~%bool is_dividing_lane~%int64 traffic_light_id~%int32 traffic_light_color~%float64 max_speed~%autohyu_msgs/PlanningSpacePoint[] point~%autohyu_msgs/PlanningSpacePoint[] left_boundary~%autohyu_msgs/PlanningSpacePoint[] right_boundary~%================================================================================~%MSG: autohyu_msgs/PlanningSpacePoint~%float64 x~%float64 y~%float64 heading~%string  traffic_light_id~%uint16  traffic_light_color~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PlanningSpaceVectorMap)))
  "Returns full string definition for message of type 'PlanningSpaceVectorMap"
  (cl:format cl:nil "int64 id~%bool is_dividing_lane~%int64 traffic_light_id~%int32 traffic_light_color~%float64 max_speed~%autohyu_msgs/PlanningSpacePoint[] point~%autohyu_msgs/PlanningSpacePoint[] left_boundary~%autohyu_msgs/PlanningSpacePoint[] right_boundary~%================================================================================~%MSG: autohyu_msgs/PlanningSpacePoint~%float64 x~%float64 y~%float64 heading~%string  traffic_light_id~%uint16  traffic_light_color~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PlanningSpaceVectorMap>))
  (cl:+ 0
     8
     1
     8
     4
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'point) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'left_boundary) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'right_boundary) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PlanningSpaceVectorMap>))
  "Converts a ROS message object to a list"
  (cl:list 'PlanningSpaceVectorMap
    (cl:cons ':id (id msg))
    (cl:cons ':is_dividing_lane (is_dividing_lane msg))
    (cl:cons ':traffic_light_id (traffic_light_id msg))
    (cl:cons ':traffic_light_color (traffic_light_color msg))
    (cl:cons ':max_speed (max_speed msg))
    (cl:cons ':point (point msg))
    (cl:cons ':left_boundary (left_boundary msg))
    (cl:cons ':right_boundary (right_boundary msg))
))
