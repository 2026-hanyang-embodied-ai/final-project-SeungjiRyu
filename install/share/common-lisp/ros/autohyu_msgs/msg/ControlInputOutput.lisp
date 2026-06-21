; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude ControlInputOutput.msg.html

(cl:defclass <ControlInputOutput> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (vehicle_state
    :reader vehicle_state
    :initarg :vehicle_state
    :type autohyu_msgs-msg:VehicleState
    :initform (cl:make-instance 'autohyu_msgs-msg:VehicleState))
   (trajectory
    :reader trajectory
    :initarg :trajectory
    :type autohyu_msgs-msg:Trajectory
    :initform (cl:make-instance 'autohyu_msgs-msg:Trajectory))
   (command_steer
    :reader command_steer
    :initarg :command_steer
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (command_accel_pedal
    :reader command_accel_pedal
    :initarg :command_accel_pedal
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (command_brake_pedal
    :reader command_brake_pedal
    :initarg :command_brake_pedal
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (command_speed
    :reader command_speed
    :initarg :command_speed
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (command_acceleration
    :reader command_acceleration
    :initarg :command_acceleration
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass ControlInputOutput (<ControlInputOutput>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ControlInputOutput>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ControlInputOutput)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<ControlInputOutput> is deprecated: use autohyu_msgs-msg:ControlInputOutput instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ControlInputOutput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:header-val is deprecated.  Use autohyu_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'vehicle_state-val :lambda-list '(m))
(cl:defmethod vehicle_state-val ((m <ControlInputOutput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:vehicle_state-val is deprecated.  Use autohyu_msgs-msg:vehicle_state instead.")
  (vehicle_state m))

(cl:ensure-generic-function 'trajectory-val :lambda-list '(m))
(cl:defmethod trajectory-val ((m <ControlInputOutput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:trajectory-val is deprecated.  Use autohyu_msgs-msg:trajectory instead.")
  (trajectory m))

(cl:ensure-generic-function 'command_steer-val :lambda-list '(m))
(cl:defmethod command_steer-val ((m <ControlInputOutput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:command_steer-val is deprecated.  Use autohyu_msgs-msg:command_steer instead.")
  (command_steer m))

(cl:ensure-generic-function 'command_accel_pedal-val :lambda-list '(m))
(cl:defmethod command_accel_pedal-val ((m <ControlInputOutput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:command_accel_pedal-val is deprecated.  Use autohyu_msgs-msg:command_accel_pedal instead.")
  (command_accel_pedal m))

(cl:ensure-generic-function 'command_brake_pedal-val :lambda-list '(m))
(cl:defmethod command_brake_pedal-val ((m <ControlInputOutput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:command_brake_pedal-val is deprecated.  Use autohyu_msgs-msg:command_brake_pedal instead.")
  (command_brake_pedal m))

(cl:ensure-generic-function 'command_speed-val :lambda-list '(m))
(cl:defmethod command_speed-val ((m <ControlInputOutput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:command_speed-val is deprecated.  Use autohyu_msgs-msg:command_speed instead.")
  (command_speed m))

(cl:ensure-generic-function 'command_acceleration-val :lambda-list '(m))
(cl:defmethod command_acceleration-val ((m <ControlInputOutput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:command_acceleration-val is deprecated.  Use autohyu_msgs-msg:command_acceleration instead.")
  (command_acceleration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ControlInputOutput>) ostream)
  "Serializes a message object of type '<ControlInputOutput>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'vehicle_state) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'trajectory) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'command_steer))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'command_steer))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'command_accel_pedal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'command_accel_pedal))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'command_brake_pedal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'command_brake_pedal))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'command_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'command_speed))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'command_acceleration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'command_acceleration))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ControlInputOutput>) istream)
  "Deserializes a message object of type '<ControlInputOutput>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'vehicle_state) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'trajectory) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'command_steer) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'command_steer)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'command_accel_pedal) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'command_accel_pedal)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'command_brake_pedal) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'command_brake_pedal)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'command_speed) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'command_speed)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'command_acceleration) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'command_acceleration)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ControlInputOutput>)))
  "Returns string type for a message object of type '<ControlInputOutput>"
  "autohyu_msgs/ControlInputOutput")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControlInputOutput)))
  "Returns string type for a message object of type 'ControlInputOutput"
  "autohyu_msgs/ControlInputOutput")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ControlInputOutput>)))
  "Returns md5sum for a message object of type '<ControlInputOutput>"
  "3ea3f7b2097ca95368fcfd5f0afbc535")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ControlInputOutput)))
  "Returns md5sum for a message object of type 'ControlInputOutput"
  "3ea3f7b2097ca95368fcfd5f0afbc535")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ControlInputOutput>)))
  "Returns full string definition for message of type '<ControlInputOutput>"
  (cl:format cl:nil "std_msgs/Header header~%~%autohyu_msgs/VehicleState vehicle_state~%autohyu_msgs/Trajectory   trajectory~%float32[] command_steer~%float32[] command_accel_pedal~%float32[] command_brake_pedal~%float32[] command_speed~%float32[] command_acceleration~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: autohyu_msgs/VehicleState~%# std_msgs/Header~%std_msgs/Header header~%~%# gnss~%autohyu_msgs/WGS84 gnss~%~%# position and motion~%float64 x~%float64 y~%float64 z~%~%float64 vx~%float64 vy~%float64 vz~%~%float64 ax~%float64 ay~%float64 az~%~%float64 roll~%float64 pitch~%float64 yaw~%~%float64 roll_vel~%float64 pitch_vel~%float64 yaw_vel~%~%# vehicle can~%autohyu_msgs/VehicleCAN vehicle_can~%================================================================================~%MSG: autohyu_msgs/WGS84~%float64 latitude~%float64 longitude~%float64 altitude~%================================================================================~%MSG: autohyu_msgs/VehicleCAN~%# std_msgs/Header~%std_msgs/Header header~%~%# Measurements~%float64 wheel_speed_fl~%float64 wheel_speed_fr~%float64 wheel_speed_rl~%float64 wheel_speed_rr~%uint16  vehicle_speed~%~%float64 lateral_accel~%float64 longitudinal_accel~%float64 yaw_rate~%~%float64 steering_torque~%float64 steering_angle~%float64 steering_tire_angle~%float64 accel_pedal_position~%float64 brake_pressure~%~%# AD Status~%uint8   cruise_main_status~%uint8   cruise_switch_status~%uint8   gear_status~%uint8   auto_status~%~%# AD Override~%uint8   steering_override~%uint8   acceleration_override~%uint8   brake_override~%uint8   sw_estop~%~%# Vehicle Status~%uint8   mdps_act_error~%uint8   epb_status~%uint8   gear_display~%uint8   left_turn_signal~%uint8   right_turn_signal~%uint8   hazard_lamp_status~%uint8   kecu_cnt~%~%# Power System~%uint8   power_state~%uint8   power_MRMdrivingTime~%float64 power_main_current~%float64 power_sub_current~%float64 power_main_voltage~%float64 power_sub_voltage~%~%# Mode~%uint8   steering_state~%uint8   operation_mode~%uint8   lateral_ad_mode~%uint8   longitudinal_ad_mode~%~%================================================================================~%MSG: autohyu_msgs/Trajectory~%# std_msgs/Header~%std_msgs/Header header~%~%uint16 id~%autohyu_msgs/TrajectoryPoint[] point~%================================================================================~%MSG: autohyu_msgs/TrajectoryPoint~%float32 time~%float32 distance~%uint16  direction~%float32 x~%float32 y~%float32 z~%float32 yaw~%float32 curvature~%float32 speed~%float32 acceleration~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ControlInputOutput)))
  "Returns full string definition for message of type 'ControlInputOutput"
  (cl:format cl:nil "std_msgs/Header header~%~%autohyu_msgs/VehicleState vehicle_state~%autohyu_msgs/Trajectory   trajectory~%float32[] command_steer~%float32[] command_accel_pedal~%float32[] command_brake_pedal~%float32[] command_speed~%float32[] command_acceleration~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: autohyu_msgs/VehicleState~%# std_msgs/Header~%std_msgs/Header header~%~%# gnss~%autohyu_msgs/WGS84 gnss~%~%# position and motion~%float64 x~%float64 y~%float64 z~%~%float64 vx~%float64 vy~%float64 vz~%~%float64 ax~%float64 ay~%float64 az~%~%float64 roll~%float64 pitch~%float64 yaw~%~%float64 roll_vel~%float64 pitch_vel~%float64 yaw_vel~%~%# vehicle can~%autohyu_msgs/VehicleCAN vehicle_can~%================================================================================~%MSG: autohyu_msgs/WGS84~%float64 latitude~%float64 longitude~%float64 altitude~%================================================================================~%MSG: autohyu_msgs/VehicleCAN~%# std_msgs/Header~%std_msgs/Header header~%~%# Measurements~%float64 wheel_speed_fl~%float64 wheel_speed_fr~%float64 wheel_speed_rl~%float64 wheel_speed_rr~%uint16  vehicle_speed~%~%float64 lateral_accel~%float64 longitudinal_accel~%float64 yaw_rate~%~%float64 steering_torque~%float64 steering_angle~%float64 steering_tire_angle~%float64 accel_pedal_position~%float64 brake_pressure~%~%# AD Status~%uint8   cruise_main_status~%uint8   cruise_switch_status~%uint8   gear_status~%uint8   auto_status~%~%# AD Override~%uint8   steering_override~%uint8   acceleration_override~%uint8   brake_override~%uint8   sw_estop~%~%# Vehicle Status~%uint8   mdps_act_error~%uint8   epb_status~%uint8   gear_display~%uint8   left_turn_signal~%uint8   right_turn_signal~%uint8   hazard_lamp_status~%uint8   kecu_cnt~%~%# Power System~%uint8   power_state~%uint8   power_MRMdrivingTime~%float64 power_main_current~%float64 power_sub_current~%float64 power_main_voltage~%float64 power_sub_voltage~%~%# Mode~%uint8   steering_state~%uint8   operation_mode~%uint8   lateral_ad_mode~%uint8   longitudinal_ad_mode~%~%================================================================================~%MSG: autohyu_msgs/Trajectory~%# std_msgs/Header~%std_msgs/Header header~%~%uint16 id~%autohyu_msgs/TrajectoryPoint[] point~%================================================================================~%MSG: autohyu_msgs/TrajectoryPoint~%float32 time~%float32 distance~%uint16  direction~%float32 x~%float32 y~%float32 z~%float32 yaw~%float32 curvature~%float32 speed~%float32 acceleration~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ControlInputOutput>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'vehicle_state))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'trajectory))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'command_steer) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'command_accel_pedal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'command_brake_pedal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'command_speed) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'command_acceleration) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ControlInputOutput>))
  "Converts a ROS message object to a list"
  (cl:list 'ControlInputOutput
    (cl:cons ':header (header msg))
    (cl:cons ':vehicle_state (vehicle_state msg))
    (cl:cons ':trajectory (trajectory msg))
    (cl:cons ':command_steer (command_steer msg))
    (cl:cons ':command_accel_pedal (command_accel_pedal msg))
    (cl:cons ':command_brake_pedal (command_brake_pedal msg))
    (cl:cons ':command_speed (command_speed msg))
    (cl:cons ':command_acceleration (command_acceleration msg))
))
