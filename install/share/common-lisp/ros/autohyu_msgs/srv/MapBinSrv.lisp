; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-srv)


;//! \htmlinclude MapBinSrv-request.msg.html

(cl:defclass <MapBinSrv-request> (roslisp-msg-protocol:ros-message)
  ((requester
    :reader requester
    :initarg :requester
    :type cl:string
    :initform ""))
)

(cl:defclass MapBinSrv-request (<MapBinSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapBinSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapBinSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-srv:<MapBinSrv-request> is deprecated: use autohyu_msgs-srv:MapBinSrv-request instead.")))

(cl:ensure-generic-function 'requester-val :lambda-list '(m))
(cl:defmethod requester-val ((m <MapBinSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-srv:requester-val is deprecated.  Use autohyu_msgs-srv:requester instead.")
  (requester m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapBinSrv-request>) ostream)
  "Serializes a message object of type '<MapBinSrv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'requester))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'requester))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapBinSrv-request>) istream)
  "Deserializes a message object of type '<MapBinSrv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'requester) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'requester) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapBinSrv-request>)))
  "Returns string type for a service object of type '<MapBinSrv-request>"
  "autohyu_msgs/MapBinSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapBinSrv-request)))
  "Returns string type for a service object of type 'MapBinSrv-request"
  "autohyu_msgs/MapBinSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapBinSrv-request>)))
  "Returns md5sum for a message object of type '<MapBinSrv-request>"
  "40f5991feacf64e4d54a5bf2aa79bf5a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapBinSrv-request)))
  "Returns md5sum for a message object of type 'MapBinSrv-request"
  "40f5991feacf64e4d54a5bf2aa79bf5a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapBinSrv-request>)))
  "Returns full string definition for message of type '<MapBinSrv-request>"
  (cl:format cl:nil "# Request~%string requester~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapBinSrv-request)))
  "Returns full string definition for message of type 'MapBinSrv-request"
  (cl:format cl:nil "# Request~%string requester~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapBinSrv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'requester))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapBinSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MapBinSrv-request
    (cl:cons ':requester (requester msg))
))
;//! \htmlinclude MapBinSrv-response.msg.html

(cl:defclass <MapBinSrv-response> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (data
    :reader data
    :initarg :data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass MapBinSrv-response (<MapBinSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapBinSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapBinSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-srv:<MapBinSrv-response> is deprecated: use autohyu_msgs-srv:MapBinSrv-response instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MapBinSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-srv:header-val is deprecated.  Use autohyu_msgs-srv:header instead.")
  (header m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <MapBinSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-srv:data-val is deprecated.  Use autohyu_msgs-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapBinSrv-response>) ostream)
  "Serializes a message object of type '<MapBinSrv-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    ))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapBinSrv-response>) istream)
  "Deserializes a message object of type '<MapBinSrv-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapBinSrv-response>)))
  "Returns string type for a service object of type '<MapBinSrv-response>"
  "autohyu_msgs/MapBinSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapBinSrv-response)))
  "Returns string type for a service object of type 'MapBinSrv-response"
  "autohyu_msgs/MapBinSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapBinSrv-response>)))
  "Returns md5sum for a message object of type '<MapBinSrv-response>"
  "40f5991feacf64e4d54a5bf2aa79bf5a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapBinSrv-response)))
  "Returns md5sum for a message object of type 'MapBinSrv-response"
  "40f5991feacf64e4d54a5bf2aa79bf5a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapBinSrv-response>)))
  "Returns full string definition for message of type '<MapBinSrv-response>"
  (cl:format cl:nil "# Response~%std_msgs/Header header~%# binary data of lanelet2 map~%# use int8 because byte is deprecated~%int8[] data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapBinSrv-response)))
  "Returns full string definition for message of type 'MapBinSrv-response"
  (cl:format cl:nil "# Response~%std_msgs/Header header~%# binary data of lanelet2 map~%# use int8 because byte is deprecated~%int8[] data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapBinSrv-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapBinSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MapBinSrv-response
    (cl:cons ':header (header msg))
    (cl:cons ':data (data msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MapBinSrv)))
  'MapBinSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MapBinSrv)))
  'MapBinSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapBinSrv)))
  "Returns string type for a service object of type '<MapBinSrv>"
  "autohyu_msgs/MapBinSrv")