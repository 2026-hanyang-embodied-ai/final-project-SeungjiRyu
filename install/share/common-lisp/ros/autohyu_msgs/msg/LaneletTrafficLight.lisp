; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude LaneletTrafficLight.msg.html

(cl:defclass <LaneletTrafficLight> (roslisp-msg-protocol:ros-message)
  ((sign_id
    :reader sign_id
    :initarg :sign_id
    :type cl:integer
    :initform 0)
   (intersection_id
    :reader intersection_id
    :initarg :intersection_id
    :type cl:integer
    :initform 0)
   (light_type
    :reader light_type
    :initarg :light_type
    :type cl:string
    :initform "")
   (stop_point
    :reader stop_point
    :initarg :stop_point
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point))))
)

(cl:defclass LaneletTrafficLight (<LaneletTrafficLight>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LaneletTrafficLight>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LaneletTrafficLight)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<LaneletTrafficLight> is deprecated: use autohyu_msgs-msg:LaneletTrafficLight instead.")))

(cl:ensure-generic-function 'sign_id-val :lambda-list '(m))
(cl:defmethod sign_id-val ((m <LaneletTrafficLight>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:sign_id-val is deprecated.  Use autohyu_msgs-msg:sign_id instead.")
  (sign_id m))

(cl:ensure-generic-function 'intersection_id-val :lambda-list '(m))
(cl:defmethod intersection_id-val ((m <LaneletTrafficLight>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:intersection_id-val is deprecated.  Use autohyu_msgs-msg:intersection_id instead.")
  (intersection_id m))

(cl:ensure-generic-function 'light_type-val :lambda-list '(m))
(cl:defmethod light_type-val ((m <LaneletTrafficLight>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:light_type-val is deprecated.  Use autohyu_msgs-msg:light_type instead.")
  (light_type m))

(cl:ensure-generic-function 'stop_point-val :lambda-list '(m))
(cl:defmethod stop_point-val ((m <LaneletTrafficLight>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:stop_point-val is deprecated.  Use autohyu_msgs-msg:stop_point instead.")
  (stop_point m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LaneletTrafficLight>) ostream)
  "Serializes a message object of type '<LaneletTrafficLight>"
  (cl:let* ((signed (cl:slot-value msg 'sign_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'intersection_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'light_type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'light_type))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'stop_point))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'stop_point))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LaneletTrafficLight>) istream)
  "Deserializes a message object of type '<LaneletTrafficLight>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sign_id) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'intersection_id) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'light_type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'light_type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'stop_point) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'stop_point)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LaneletTrafficLight>)))
  "Returns string type for a message object of type '<LaneletTrafficLight>"
  "autohyu_msgs/LaneletTrafficLight")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LaneletTrafficLight)))
  "Returns string type for a message object of type 'LaneletTrafficLight"
  "autohyu_msgs/LaneletTrafficLight")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LaneletTrafficLight>)))
  "Returns md5sum for a message object of type '<LaneletTrafficLight>"
  "2ee52a1dcd096e64bfcc591f681c7089")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LaneletTrafficLight)))
  "Returns md5sum for a message object of type 'LaneletTrafficLight"
  "2ee52a1dcd096e64bfcc591f681c7089")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LaneletTrafficLight>)))
  "Returns full string definition for message of type '<LaneletTrafficLight>"
  (cl:format cl:nil "int64 sign_id~%int64 intersection_id~%string light_type~%geometry_msgs/Point[] stop_point~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LaneletTrafficLight)))
  "Returns full string definition for message of type 'LaneletTrafficLight"
  (cl:format cl:nil "int64 sign_id~%int64 intersection_id~%string light_type~%geometry_msgs/Point[] stop_point~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LaneletTrafficLight>))
  (cl:+ 0
     8
     8
     4 (cl:length (cl:slot-value msg 'light_type))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'stop_point) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LaneletTrafficLight>))
  "Converts a ROS message object to a list"
  (cl:list 'LaneletTrafficLight
    (cl:cons ':sign_id (sign_id msg))
    (cl:cons ':intersection_id (intersection_id msg))
    (cl:cons ':light_type (light_type msg))
    (cl:cons ':stop_point (stop_point msg))
))
