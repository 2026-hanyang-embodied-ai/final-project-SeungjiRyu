; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude PlanningSpacePoint.msg.html

(cl:defclass <PlanningSpacePoint> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (heading
    :reader heading
    :initarg :heading
    :type cl:float
    :initform 0.0)
   (traffic_light_id
    :reader traffic_light_id
    :initarg :traffic_light_id
    :type cl:string
    :initform "")
   (traffic_light_color
    :reader traffic_light_color
    :initarg :traffic_light_color
    :type cl:fixnum
    :initform 0))
)

(cl:defclass PlanningSpacePoint (<PlanningSpacePoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PlanningSpacePoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PlanningSpacePoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<PlanningSpacePoint> is deprecated: use autohyu_msgs-msg:PlanningSpacePoint instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <PlanningSpacePoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:x-val is deprecated.  Use autohyu_msgs-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <PlanningSpacePoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:y-val is deprecated.  Use autohyu_msgs-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'heading-val :lambda-list '(m))
(cl:defmethod heading-val ((m <PlanningSpacePoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:heading-val is deprecated.  Use autohyu_msgs-msg:heading instead.")
  (heading m))

(cl:ensure-generic-function 'traffic_light_id-val :lambda-list '(m))
(cl:defmethod traffic_light_id-val ((m <PlanningSpacePoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:traffic_light_id-val is deprecated.  Use autohyu_msgs-msg:traffic_light_id instead.")
  (traffic_light_id m))

(cl:ensure-generic-function 'traffic_light_color-val :lambda-list '(m))
(cl:defmethod traffic_light_color-val ((m <PlanningSpacePoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:traffic_light_color-val is deprecated.  Use autohyu_msgs-msg:traffic_light_color instead.")
  (traffic_light_color m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PlanningSpacePoint>) ostream)
  "Serializes a message object of type '<PlanningSpacePoint>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'heading))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'traffic_light_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'traffic_light_id))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'traffic_light_color)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'traffic_light_color)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PlanningSpacePoint>) istream)
  "Deserializes a message object of type '<PlanningSpacePoint>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'heading) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'traffic_light_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'traffic_light_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'traffic_light_color)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'traffic_light_color)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PlanningSpacePoint>)))
  "Returns string type for a message object of type '<PlanningSpacePoint>"
  "autohyu_msgs/PlanningSpacePoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlanningSpacePoint)))
  "Returns string type for a message object of type 'PlanningSpacePoint"
  "autohyu_msgs/PlanningSpacePoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PlanningSpacePoint>)))
  "Returns md5sum for a message object of type '<PlanningSpacePoint>"
  "aa200d3801db544dc5c0cfd6666243ad")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PlanningSpacePoint)))
  "Returns md5sum for a message object of type 'PlanningSpacePoint"
  "aa200d3801db544dc5c0cfd6666243ad")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PlanningSpacePoint>)))
  "Returns full string definition for message of type '<PlanningSpacePoint>"
  (cl:format cl:nil "float64 x~%float64 y~%float64 heading~%string  traffic_light_id~%uint16  traffic_light_color~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PlanningSpacePoint)))
  "Returns full string definition for message of type 'PlanningSpacePoint"
  (cl:format cl:nil "float64 x~%float64 y~%float64 heading~%string  traffic_light_id~%uint16  traffic_light_color~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PlanningSpacePoint>))
  (cl:+ 0
     8
     8
     8
     4 (cl:length (cl:slot-value msg 'traffic_light_id))
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PlanningSpacePoint>))
  "Converts a ROS message object to a list"
  (cl:list 'PlanningSpacePoint
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':heading (heading msg))
    (cl:cons ':traffic_light_id (traffic_light_id msg))
    (cl:cons ':traffic_light_color (traffic_light_color msg))
))
