; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude VehicleCAN.msg.html

(cl:defclass <VehicleCAN> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (wheel_speed_fl
    :reader wheel_speed_fl
    :initarg :wheel_speed_fl
    :type cl:float
    :initform 0.0)
   (wheel_speed_fr
    :reader wheel_speed_fr
    :initarg :wheel_speed_fr
    :type cl:float
    :initform 0.0)
   (wheel_speed_rl
    :reader wheel_speed_rl
    :initarg :wheel_speed_rl
    :type cl:float
    :initform 0.0)
   (wheel_speed_rr
    :reader wheel_speed_rr
    :initarg :wheel_speed_rr
    :type cl:float
    :initform 0.0)
   (vehicle_speed
    :reader vehicle_speed
    :initarg :vehicle_speed
    :type cl:fixnum
    :initform 0)
   (lateral_accel
    :reader lateral_accel
    :initarg :lateral_accel
    :type cl:float
    :initform 0.0)
   (longitudinal_accel
    :reader longitudinal_accel
    :initarg :longitudinal_accel
    :type cl:float
    :initform 0.0)
   (yaw_rate
    :reader yaw_rate
    :initarg :yaw_rate
    :type cl:float
    :initform 0.0)
   (steering_torque
    :reader steering_torque
    :initarg :steering_torque
    :type cl:float
    :initform 0.0)
   (steering_angle
    :reader steering_angle
    :initarg :steering_angle
    :type cl:float
    :initform 0.0)
   (steering_tire_angle
    :reader steering_tire_angle
    :initarg :steering_tire_angle
    :type cl:float
    :initform 0.0)
   (accel_pedal_position
    :reader accel_pedal_position
    :initarg :accel_pedal_position
    :type cl:float
    :initform 0.0)
   (brake_pressure
    :reader brake_pressure
    :initarg :brake_pressure
    :type cl:float
    :initform 0.0)
   (cruise_main_status
    :reader cruise_main_status
    :initarg :cruise_main_status
    :type cl:fixnum
    :initform 0)
   (cruise_switch_status
    :reader cruise_switch_status
    :initarg :cruise_switch_status
    :type cl:fixnum
    :initform 0)
   (gear_status
    :reader gear_status
    :initarg :gear_status
    :type cl:fixnum
    :initform 0)
   (auto_status
    :reader auto_status
    :initarg :auto_status
    :type cl:fixnum
    :initform 0)
   (steering_override
    :reader steering_override
    :initarg :steering_override
    :type cl:fixnum
    :initform 0)
   (acceleration_override
    :reader acceleration_override
    :initarg :acceleration_override
    :type cl:fixnum
    :initform 0)
   (brake_override
    :reader brake_override
    :initarg :brake_override
    :type cl:fixnum
    :initform 0)
   (sw_estop
    :reader sw_estop
    :initarg :sw_estop
    :type cl:fixnum
    :initform 0)
   (mdps_act_error
    :reader mdps_act_error
    :initarg :mdps_act_error
    :type cl:fixnum
    :initform 0)
   (epb_status
    :reader epb_status
    :initarg :epb_status
    :type cl:fixnum
    :initform 0)
   (gear_display
    :reader gear_display
    :initarg :gear_display
    :type cl:fixnum
    :initform 0)
   (left_turn_signal
    :reader left_turn_signal
    :initarg :left_turn_signal
    :type cl:fixnum
    :initform 0)
   (right_turn_signal
    :reader right_turn_signal
    :initarg :right_turn_signal
    :type cl:fixnum
    :initform 0)
   (hazard_lamp_status
    :reader hazard_lamp_status
    :initarg :hazard_lamp_status
    :type cl:fixnum
    :initform 0)
   (kecu_cnt
    :reader kecu_cnt
    :initarg :kecu_cnt
    :type cl:fixnum
    :initform 0)
   (power_state
    :reader power_state
    :initarg :power_state
    :type cl:fixnum
    :initform 0)
   (power_MRMdrivingTime
    :reader power_MRMdrivingTime
    :initarg :power_MRMdrivingTime
    :type cl:fixnum
    :initform 0)
   (power_main_current
    :reader power_main_current
    :initarg :power_main_current
    :type cl:float
    :initform 0.0)
   (power_sub_current
    :reader power_sub_current
    :initarg :power_sub_current
    :type cl:float
    :initform 0.0)
   (power_main_voltage
    :reader power_main_voltage
    :initarg :power_main_voltage
    :type cl:float
    :initform 0.0)
   (power_sub_voltage
    :reader power_sub_voltage
    :initarg :power_sub_voltage
    :type cl:float
    :initform 0.0)
   (steering_state
    :reader steering_state
    :initarg :steering_state
    :type cl:fixnum
    :initform 0)
   (operation_mode
    :reader operation_mode
    :initarg :operation_mode
    :type cl:fixnum
    :initform 0)
   (lateral_ad_mode
    :reader lateral_ad_mode
    :initarg :lateral_ad_mode
    :type cl:fixnum
    :initform 0)
   (longitudinal_ad_mode
    :reader longitudinal_ad_mode
    :initarg :longitudinal_ad_mode
    :type cl:fixnum
    :initform 0))
)

(cl:defclass VehicleCAN (<VehicleCAN>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VehicleCAN>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VehicleCAN)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<VehicleCAN> is deprecated: use autohyu_msgs-msg:VehicleCAN instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:header-val is deprecated.  Use autohyu_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'wheel_speed_fl-val :lambda-list '(m))
(cl:defmethod wheel_speed_fl-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:wheel_speed_fl-val is deprecated.  Use autohyu_msgs-msg:wheel_speed_fl instead.")
  (wheel_speed_fl m))

(cl:ensure-generic-function 'wheel_speed_fr-val :lambda-list '(m))
(cl:defmethod wheel_speed_fr-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:wheel_speed_fr-val is deprecated.  Use autohyu_msgs-msg:wheel_speed_fr instead.")
  (wheel_speed_fr m))

(cl:ensure-generic-function 'wheel_speed_rl-val :lambda-list '(m))
(cl:defmethod wheel_speed_rl-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:wheel_speed_rl-val is deprecated.  Use autohyu_msgs-msg:wheel_speed_rl instead.")
  (wheel_speed_rl m))

(cl:ensure-generic-function 'wheel_speed_rr-val :lambda-list '(m))
(cl:defmethod wheel_speed_rr-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:wheel_speed_rr-val is deprecated.  Use autohyu_msgs-msg:wheel_speed_rr instead.")
  (wheel_speed_rr m))

(cl:ensure-generic-function 'vehicle_speed-val :lambda-list '(m))
(cl:defmethod vehicle_speed-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:vehicle_speed-val is deprecated.  Use autohyu_msgs-msg:vehicle_speed instead.")
  (vehicle_speed m))

(cl:ensure-generic-function 'lateral_accel-val :lambda-list '(m))
(cl:defmethod lateral_accel-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:lateral_accel-val is deprecated.  Use autohyu_msgs-msg:lateral_accel instead.")
  (lateral_accel m))

(cl:ensure-generic-function 'longitudinal_accel-val :lambda-list '(m))
(cl:defmethod longitudinal_accel-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:longitudinal_accel-val is deprecated.  Use autohyu_msgs-msg:longitudinal_accel instead.")
  (longitudinal_accel m))

(cl:ensure-generic-function 'yaw_rate-val :lambda-list '(m))
(cl:defmethod yaw_rate-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:yaw_rate-val is deprecated.  Use autohyu_msgs-msg:yaw_rate instead.")
  (yaw_rate m))

(cl:ensure-generic-function 'steering_torque-val :lambda-list '(m))
(cl:defmethod steering_torque-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:steering_torque-val is deprecated.  Use autohyu_msgs-msg:steering_torque instead.")
  (steering_torque m))

(cl:ensure-generic-function 'steering_angle-val :lambda-list '(m))
(cl:defmethod steering_angle-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:steering_angle-val is deprecated.  Use autohyu_msgs-msg:steering_angle instead.")
  (steering_angle m))

(cl:ensure-generic-function 'steering_tire_angle-val :lambda-list '(m))
(cl:defmethod steering_tire_angle-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:steering_tire_angle-val is deprecated.  Use autohyu_msgs-msg:steering_tire_angle instead.")
  (steering_tire_angle m))

(cl:ensure-generic-function 'accel_pedal_position-val :lambda-list '(m))
(cl:defmethod accel_pedal_position-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:accel_pedal_position-val is deprecated.  Use autohyu_msgs-msg:accel_pedal_position instead.")
  (accel_pedal_position m))

(cl:ensure-generic-function 'brake_pressure-val :lambda-list '(m))
(cl:defmethod brake_pressure-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:brake_pressure-val is deprecated.  Use autohyu_msgs-msg:brake_pressure instead.")
  (brake_pressure m))

(cl:ensure-generic-function 'cruise_main_status-val :lambda-list '(m))
(cl:defmethod cruise_main_status-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:cruise_main_status-val is deprecated.  Use autohyu_msgs-msg:cruise_main_status instead.")
  (cruise_main_status m))

(cl:ensure-generic-function 'cruise_switch_status-val :lambda-list '(m))
(cl:defmethod cruise_switch_status-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:cruise_switch_status-val is deprecated.  Use autohyu_msgs-msg:cruise_switch_status instead.")
  (cruise_switch_status m))

(cl:ensure-generic-function 'gear_status-val :lambda-list '(m))
(cl:defmethod gear_status-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:gear_status-val is deprecated.  Use autohyu_msgs-msg:gear_status instead.")
  (gear_status m))

(cl:ensure-generic-function 'auto_status-val :lambda-list '(m))
(cl:defmethod auto_status-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:auto_status-val is deprecated.  Use autohyu_msgs-msg:auto_status instead.")
  (auto_status m))

(cl:ensure-generic-function 'steering_override-val :lambda-list '(m))
(cl:defmethod steering_override-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:steering_override-val is deprecated.  Use autohyu_msgs-msg:steering_override instead.")
  (steering_override m))

(cl:ensure-generic-function 'acceleration_override-val :lambda-list '(m))
(cl:defmethod acceleration_override-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:acceleration_override-val is deprecated.  Use autohyu_msgs-msg:acceleration_override instead.")
  (acceleration_override m))

(cl:ensure-generic-function 'brake_override-val :lambda-list '(m))
(cl:defmethod brake_override-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:brake_override-val is deprecated.  Use autohyu_msgs-msg:brake_override instead.")
  (brake_override m))

(cl:ensure-generic-function 'sw_estop-val :lambda-list '(m))
(cl:defmethod sw_estop-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:sw_estop-val is deprecated.  Use autohyu_msgs-msg:sw_estop instead.")
  (sw_estop m))

(cl:ensure-generic-function 'mdps_act_error-val :lambda-list '(m))
(cl:defmethod mdps_act_error-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:mdps_act_error-val is deprecated.  Use autohyu_msgs-msg:mdps_act_error instead.")
  (mdps_act_error m))

(cl:ensure-generic-function 'epb_status-val :lambda-list '(m))
(cl:defmethod epb_status-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:epb_status-val is deprecated.  Use autohyu_msgs-msg:epb_status instead.")
  (epb_status m))

(cl:ensure-generic-function 'gear_display-val :lambda-list '(m))
(cl:defmethod gear_display-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:gear_display-val is deprecated.  Use autohyu_msgs-msg:gear_display instead.")
  (gear_display m))

(cl:ensure-generic-function 'left_turn_signal-val :lambda-list '(m))
(cl:defmethod left_turn_signal-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:left_turn_signal-val is deprecated.  Use autohyu_msgs-msg:left_turn_signal instead.")
  (left_turn_signal m))

(cl:ensure-generic-function 'right_turn_signal-val :lambda-list '(m))
(cl:defmethod right_turn_signal-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:right_turn_signal-val is deprecated.  Use autohyu_msgs-msg:right_turn_signal instead.")
  (right_turn_signal m))

(cl:ensure-generic-function 'hazard_lamp_status-val :lambda-list '(m))
(cl:defmethod hazard_lamp_status-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:hazard_lamp_status-val is deprecated.  Use autohyu_msgs-msg:hazard_lamp_status instead.")
  (hazard_lamp_status m))

(cl:ensure-generic-function 'kecu_cnt-val :lambda-list '(m))
(cl:defmethod kecu_cnt-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:kecu_cnt-val is deprecated.  Use autohyu_msgs-msg:kecu_cnt instead.")
  (kecu_cnt m))

(cl:ensure-generic-function 'power_state-val :lambda-list '(m))
(cl:defmethod power_state-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:power_state-val is deprecated.  Use autohyu_msgs-msg:power_state instead.")
  (power_state m))

(cl:ensure-generic-function 'power_MRMdrivingTime-val :lambda-list '(m))
(cl:defmethod power_MRMdrivingTime-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:power_MRMdrivingTime-val is deprecated.  Use autohyu_msgs-msg:power_MRMdrivingTime instead.")
  (power_MRMdrivingTime m))

(cl:ensure-generic-function 'power_main_current-val :lambda-list '(m))
(cl:defmethod power_main_current-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:power_main_current-val is deprecated.  Use autohyu_msgs-msg:power_main_current instead.")
  (power_main_current m))

(cl:ensure-generic-function 'power_sub_current-val :lambda-list '(m))
(cl:defmethod power_sub_current-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:power_sub_current-val is deprecated.  Use autohyu_msgs-msg:power_sub_current instead.")
  (power_sub_current m))

(cl:ensure-generic-function 'power_main_voltage-val :lambda-list '(m))
(cl:defmethod power_main_voltage-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:power_main_voltage-val is deprecated.  Use autohyu_msgs-msg:power_main_voltage instead.")
  (power_main_voltage m))

(cl:ensure-generic-function 'power_sub_voltage-val :lambda-list '(m))
(cl:defmethod power_sub_voltage-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:power_sub_voltage-val is deprecated.  Use autohyu_msgs-msg:power_sub_voltage instead.")
  (power_sub_voltage m))

(cl:ensure-generic-function 'steering_state-val :lambda-list '(m))
(cl:defmethod steering_state-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:steering_state-val is deprecated.  Use autohyu_msgs-msg:steering_state instead.")
  (steering_state m))

(cl:ensure-generic-function 'operation_mode-val :lambda-list '(m))
(cl:defmethod operation_mode-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:operation_mode-val is deprecated.  Use autohyu_msgs-msg:operation_mode instead.")
  (operation_mode m))

(cl:ensure-generic-function 'lateral_ad_mode-val :lambda-list '(m))
(cl:defmethod lateral_ad_mode-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:lateral_ad_mode-val is deprecated.  Use autohyu_msgs-msg:lateral_ad_mode instead.")
  (lateral_ad_mode m))

(cl:ensure-generic-function 'longitudinal_ad_mode-val :lambda-list '(m))
(cl:defmethod longitudinal_ad_mode-val ((m <VehicleCAN>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:longitudinal_ad_mode-val is deprecated.  Use autohyu_msgs-msg:longitudinal_ad_mode instead.")
  (longitudinal_ad_mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VehicleCAN>) ostream)
  "Serializes a message object of type '<VehicleCAN>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'wheel_speed_fl))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'wheel_speed_fr))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'wheel_speed_rl))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'wheel_speed_rr))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'vehicle_speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'vehicle_speed)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lateral_accel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'longitudinal_accel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'yaw_rate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'steering_torque))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'steering_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'steering_tire_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'accel_pedal_position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'brake_pressure))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cruise_main_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cruise_switch_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gear_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'auto_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steering_override)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'acceleration_override)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'brake_override)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sw_estop)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mdps_act_error)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'epb_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gear_display)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'left_turn_signal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'right_turn_signal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hazard_lamp_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'kecu_cnt)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'power_state)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'power_MRMdrivingTime)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'power_main_current))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'power_sub_current))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'power_main_voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'power_sub_voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steering_state)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'operation_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lateral_ad_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'longitudinal_ad_mode)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VehicleCAN>) istream)
  "Deserializes a message object of type '<VehicleCAN>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wheel_speed_fl) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wheel_speed_fr) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wheel_speed_rl) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wheel_speed_rr) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'vehicle_speed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'vehicle_speed)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lateral_accel) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'longitudinal_accel) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw_rate) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steering_torque) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steering_angle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steering_tire_angle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'accel_pedal_position) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'brake_pressure) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cruise_main_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cruise_switch_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gear_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'auto_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steering_override)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'acceleration_override)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'brake_override)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sw_estop)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mdps_act_error)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'epb_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gear_display)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'left_turn_signal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'right_turn_signal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hazard_lamp_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'kecu_cnt)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'power_state)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'power_MRMdrivingTime)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'power_main_current) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'power_sub_current) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'power_main_voltage) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'power_sub_voltage) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steering_state)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'operation_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lateral_ad_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'longitudinal_ad_mode)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VehicleCAN>)))
  "Returns string type for a message object of type '<VehicleCAN>"
  "autohyu_msgs/VehicleCAN")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VehicleCAN)))
  "Returns string type for a message object of type 'VehicleCAN"
  "autohyu_msgs/VehicleCAN")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VehicleCAN>)))
  "Returns md5sum for a message object of type '<VehicleCAN>"
  "ce768e61bd6f2c0239a3b3e0a9963e4d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VehicleCAN)))
  "Returns md5sum for a message object of type 'VehicleCAN"
  "ce768e61bd6f2c0239a3b3e0a9963e4d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VehicleCAN>)))
  "Returns full string definition for message of type '<VehicleCAN>"
  (cl:format cl:nil "# std_msgs/Header~%std_msgs/Header header~%~%# Measurements~%float64 wheel_speed_fl~%float64 wheel_speed_fr~%float64 wheel_speed_rl~%float64 wheel_speed_rr~%uint16  vehicle_speed~%~%float64 lateral_accel~%float64 longitudinal_accel~%float64 yaw_rate~%~%float64 steering_torque~%float64 steering_angle~%float64 steering_tire_angle~%float64 accel_pedal_position~%float64 brake_pressure~%~%# AD Status~%uint8   cruise_main_status~%uint8   cruise_switch_status~%uint8   gear_status~%uint8   auto_status~%~%# AD Override~%uint8   steering_override~%uint8   acceleration_override~%uint8   brake_override~%uint8   sw_estop~%~%# Vehicle Status~%uint8   mdps_act_error~%uint8   epb_status~%uint8   gear_display~%uint8   left_turn_signal~%uint8   right_turn_signal~%uint8   hazard_lamp_status~%uint8   kecu_cnt~%~%# Power System~%uint8   power_state~%uint8   power_MRMdrivingTime~%float64 power_main_current~%float64 power_sub_current~%float64 power_main_voltage~%float64 power_sub_voltage~%~%# Mode~%uint8   steering_state~%uint8   operation_mode~%uint8   lateral_ad_mode~%uint8   longitudinal_ad_mode~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VehicleCAN)))
  "Returns full string definition for message of type 'VehicleCAN"
  (cl:format cl:nil "# std_msgs/Header~%std_msgs/Header header~%~%# Measurements~%float64 wheel_speed_fl~%float64 wheel_speed_fr~%float64 wheel_speed_rl~%float64 wheel_speed_rr~%uint16  vehicle_speed~%~%float64 lateral_accel~%float64 longitudinal_accel~%float64 yaw_rate~%~%float64 steering_torque~%float64 steering_angle~%float64 steering_tire_angle~%float64 accel_pedal_position~%float64 brake_pressure~%~%# AD Status~%uint8   cruise_main_status~%uint8   cruise_switch_status~%uint8   gear_status~%uint8   auto_status~%~%# AD Override~%uint8   steering_override~%uint8   acceleration_override~%uint8   brake_override~%uint8   sw_estop~%~%# Vehicle Status~%uint8   mdps_act_error~%uint8   epb_status~%uint8   gear_display~%uint8   left_turn_signal~%uint8   right_turn_signal~%uint8   hazard_lamp_status~%uint8   kecu_cnt~%~%# Power System~%uint8   power_state~%uint8   power_MRMdrivingTime~%float64 power_main_current~%float64 power_sub_current~%float64 power_main_voltage~%float64 power_sub_voltage~%~%# Mode~%uint8   steering_state~%uint8   operation_mode~%uint8   lateral_ad_mode~%uint8   longitudinal_ad_mode~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VehicleCAN>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
     8
     8
     2
     8
     8
     8
     8
     8
     8
     8
     8
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     8
     8
     8
     8
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VehicleCAN>))
  "Converts a ROS message object to a list"
  (cl:list 'VehicleCAN
    (cl:cons ':header (header msg))
    (cl:cons ':wheel_speed_fl (wheel_speed_fl msg))
    (cl:cons ':wheel_speed_fr (wheel_speed_fr msg))
    (cl:cons ':wheel_speed_rl (wheel_speed_rl msg))
    (cl:cons ':wheel_speed_rr (wheel_speed_rr msg))
    (cl:cons ':vehicle_speed (vehicle_speed msg))
    (cl:cons ':lateral_accel (lateral_accel msg))
    (cl:cons ':longitudinal_accel (longitudinal_accel msg))
    (cl:cons ':yaw_rate (yaw_rate msg))
    (cl:cons ':steering_torque (steering_torque msg))
    (cl:cons ':steering_angle (steering_angle msg))
    (cl:cons ':steering_tire_angle (steering_tire_angle msg))
    (cl:cons ':accel_pedal_position (accel_pedal_position msg))
    (cl:cons ':brake_pressure (brake_pressure msg))
    (cl:cons ':cruise_main_status (cruise_main_status msg))
    (cl:cons ':cruise_switch_status (cruise_switch_status msg))
    (cl:cons ':gear_status (gear_status msg))
    (cl:cons ':auto_status (auto_status msg))
    (cl:cons ':steering_override (steering_override msg))
    (cl:cons ':acceleration_override (acceleration_override msg))
    (cl:cons ':brake_override (brake_override msg))
    (cl:cons ':sw_estop (sw_estop msg))
    (cl:cons ':mdps_act_error (mdps_act_error msg))
    (cl:cons ':epb_status (epb_status msg))
    (cl:cons ':gear_display (gear_display msg))
    (cl:cons ':left_turn_signal (left_turn_signal msg))
    (cl:cons ':right_turn_signal (right_turn_signal msg))
    (cl:cons ':hazard_lamp_status (hazard_lamp_status msg))
    (cl:cons ':kecu_cnt (kecu_cnt msg))
    (cl:cons ':power_state (power_state msg))
    (cl:cons ':power_MRMdrivingTime (power_MRMdrivingTime msg))
    (cl:cons ':power_main_current (power_main_current msg))
    (cl:cons ':power_sub_current (power_sub_current msg))
    (cl:cons ':power_main_voltage (power_main_voltage msg))
    (cl:cons ':power_sub_voltage (power_sub_voltage msg))
    (cl:cons ':steering_state (steering_state msg))
    (cl:cons ':operation_mode (operation_mode msg))
    (cl:cons ':lateral_ad_mode (lateral_ad_mode msg))
    (cl:cons ':longitudinal_ad_mode (longitudinal_ad_mode msg))
))
