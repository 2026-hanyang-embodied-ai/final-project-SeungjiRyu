; Auto-generated. Do not edit!


(cl:in-package carmaker_msgs-msg)


;//! \htmlinclude Object.msg.html

(cl:defclass <Object> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (classification
    :reader classification
    :initarg :classification
    :type cl:fixnum
    :initform 0)
   (lane_id
    :reader lane_id
    :initarg :lane_id
    :type cl:fixnum
    :initform 0)
   (length
    :reader length
    :initarg :length
    :type cl:float
    :initform 0.0)
   (width
    :reader width
    :initarg :width
    :type cl:float
    :initform 0.0)
   (height
    :reader height
    :initarg :height
    :type cl:float
    :initform 0.0)
   (state
    :reader state
    :initarg :state
    :type carmaker_msgs-msg:ObjectState
    :initform (cl:make-instance 'carmaker_msgs-msg:ObjectState)))
)

(cl:defclass Object (<Object>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Object>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Object)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name carmaker_msgs-msg:<Object> is deprecated: use carmaker_msgs-msg:Object instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carmaker_msgs-msg:id-val is deprecated.  Use carmaker_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'classification-val :lambda-list '(m))
(cl:defmethod classification-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carmaker_msgs-msg:classification-val is deprecated.  Use carmaker_msgs-msg:classification instead.")
  (classification m))

(cl:ensure-generic-function 'lane_id-val :lambda-list '(m))
(cl:defmethod lane_id-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carmaker_msgs-msg:lane_id-val is deprecated.  Use carmaker_msgs-msg:lane_id instead.")
  (lane_id m))

(cl:ensure-generic-function 'length-val :lambda-list '(m))
(cl:defmethod length-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carmaker_msgs-msg:length-val is deprecated.  Use carmaker_msgs-msg:length instead.")
  (length m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carmaker_msgs-msg:width-val is deprecated.  Use carmaker_msgs-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carmaker_msgs-msg:height-val is deprecated.  Use carmaker_msgs-msg:height instead.")
  (height m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carmaker_msgs-msg:state-val is deprecated.  Use carmaker_msgs-msg:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Object>) ostream)
  "Serializes a message object of type '<Object>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'classification)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lane_id)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'length))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'height))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'state) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Object>) istream)
  "Deserializes a message object of type '<Object>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'classification)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lane_id)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'length) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'width) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'height) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'state) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Object>)))
  "Returns string type for a message object of type '<Object>"
  "carmaker_msgs/Object")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Object)))
  "Returns string type for a message object of type 'Object"
  "carmaker_msgs/Object")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Object>)))
  "Returns md5sum for a message object of type '<Object>"
  "111800c1669628270d9a907e3619e0e5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Object)))
  "Returns md5sum for a message object of type 'Object"
  "111800c1669628270d9a907e3619e0e5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Object>)))
  "Returns full string definition for message of type '<Object>"
  (cl:format cl:nil "# Object information~%uint8 id~%uint8 classification~%uint8 lane_id~%~%float32 length ~%float32 width ~%float32 height ~%~%carmaker_msgs/ObjectState state~%~%================================================================================~%MSG: carmaker_msgs/ObjectState~%float64 latitude                  # GCS Coordinates latitude~%float64 longitude                 # GCS Coordinates longitude~%float64 elevation                 # GCS Coordinates elevation~%~%float64 x~%float64 y~%float64 z~%~%float32 roll                      # yaw in vehicle coordinates [rad]~%float32 pitch                     # yaw in vehicle coordinates [rad]~%float32 yaw                       # yaw in vehicle coordinates [rad]~%float32 ego_roll                      # yaw in vehicle coordinates [rad]~%float32 ego_pitch                     # yaw in vehicle coordinates [rad]~%float32 ego_yaw                       # yaw in vehicle coordinates [rad]~%~%float32 roll_rate                      # yaw in vehicle coordinates [rad]~%float32 pitch_rate                     # yaw in vehicle coordinates [rad]~%float32 yaw_rate                       # yaw in vehicle coordinates [rad]~%~%float32 v_x                       # velocity in vehicle coordinates [m/s]~%float32 v_y                       # velocity in vehicle coordinates [m/s]~%float32 a_x                       # acceleration in vehicle coordinates [m/s^2]~%float32 a_y                       # acceleration in vehicle coordinates [m/s^2]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Object)))
  "Returns full string definition for message of type 'Object"
  (cl:format cl:nil "# Object information~%uint8 id~%uint8 classification~%uint8 lane_id~%~%float32 length ~%float32 width ~%float32 height ~%~%carmaker_msgs/ObjectState state~%~%================================================================================~%MSG: carmaker_msgs/ObjectState~%float64 latitude                  # GCS Coordinates latitude~%float64 longitude                 # GCS Coordinates longitude~%float64 elevation                 # GCS Coordinates elevation~%~%float64 x~%float64 y~%float64 z~%~%float32 roll                      # yaw in vehicle coordinates [rad]~%float32 pitch                     # yaw in vehicle coordinates [rad]~%float32 yaw                       # yaw in vehicle coordinates [rad]~%float32 ego_roll                      # yaw in vehicle coordinates [rad]~%float32 ego_pitch                     # yaw in vehicle coordinates [rad]~%float32 ego_yaw                       # yaw in vehicle coordinates [rad]~%~%float32 roll_rate                      # yaw in vehicle coordinates [rad]~%float32 pitch_rate                     # yaw in vehicle coordinates [rad]~%float32 yaw_rate                       # yaw in vehicle coordinates [rad]~%~%float32 v_x                       # velocity in vehicle coordinates [m/s]~%float32 v_y                       # velocity in vehicle coordinates [m/s]~%float32 a_x                       # acceleration in vehicle coordinates [m/s^2]~%float32 a_y                       # acceleration in vehicle coordinates [m/s^2]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Object>))
  (cl:+ 0
     1
     1
     1
     4
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Object>))
  "Converts a ROS message object to a list"
  (cl:list 'Object
    (cl:cons ':id (id msg))
    (cl:cons ':classification (classification msg))
    (cl:cons ':lane_id (lane_id msg))
    (cl:cons ':length (length msg))
    (cl:cons ':width (width msg))
    (cl:cons ':height (height msg))
    (cl:cons ':state (state msg))
))
