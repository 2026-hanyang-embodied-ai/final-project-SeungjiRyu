;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::VehicleCAN)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'VehicleCAN (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::VEHICLECAN")
  (make-package "AUTOHYU_MSGS::VEHICLECAN"))

(in-package "ROS")
;;//! \htmlinclude VehicleCAN.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autohyu_msgs::VehicleCAN
  :super ros::object
  :slots (_header _wheel_speed_fl _wheel_speed_fr _wheel_speed_rl _wheel_speed_rr _vehicle_speed _lateral_accel _longitudinal_accel _yaw_rate _steering_torque _steering_angle _steering_tire_angle _accel_pedal_position _brake_pressure _cruise_main_status _cruise_switch_status _gear_status _auto_status _steering_override _acceleration_override _brake_override _sw_estop _mdps_act_error _epb_status _gear_display _left_turn_signal _right_turn_signal _hazard_lamp_status _kecu_cnt _power_state _power_MRMdrivingTime _power_main_current _power_sub_current _power_main_voltage _power_sub_voltage _steering_state _operation_mode _lateral_ad_mode _longitudinal_ad_mode ))

(defmethod autohyu_msgs::VehicleCAN
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:wheel_speed_fl __wheel_speed_fl) 0.0)
    ((:wheel_speed_fr __wheel_speed_fr) 0.0)
    ((:wheel_speed_rl __wheel_speed_rl) 0.0)
    ((:wheel_speed_rr __wheel_speed_rr) 0.0)
    ((:vehicle_speed __vehicle_speed) 0)
    ((:lateral_accel __lateral_accel) 0.0)
    ((:longitudinal_accel __longitudinal_accel) 0.0)
    ((:yaw_rate __yaw_rate) 0.0)
    ((:steering_torque __steering_torque) 0.0)
    ((:steering_angle __steering_angle) 0.0)
    ((:steering_tire_angle __steering_tire_angle) 0.0)
    ((:accel_pedal_position __accel_pedal_position) 0.0)
    ((:brake_pressure __brake_pressure) 0.0)
    ((:cruise_main_status __cruise_main_status) 0)
    ((:cruise_switch_status __cruise_switch_status) 0)
    ((:gear_status __gear_status) 0)
    ((:auto_status __auto_status) 0)
    ((:steering_override __steering_override) 0)
    ((:acceleration_override __acceleration_override) 0)
    ((:brake_override __brake_override) 0)
    ((:sw_estop __sw_estop) 0)
    ((:mdps_act_error __mdps_act_error) 0)
    ((:epb_status __epb_status) 0)
    ((:gear_display __gear_display) 0)
    ((:left_turn_signal __left_turn_signal) 0)
    ((:right_turn_signal __right_turn_signal) 0)
    ((:hazard_lamp_status __hazard_lamp_status) 0)
    ((:kecu_cnt __kecu_cnt) 0)
    ((:power_state __power_state) 0)
    ((:power_MRMdrivingTime __power_MRMdrivingTime) 0)
    ((:power_main_current __power_main_current) 0.0)
    ((:power_sub_current __power_sub_current) 0.0)
    ((:power_main_voltage __power_main_voltage) 0.0)
    ((:power_sub_voltage __power_sub_voltage) 0.0)
    ((:steering_state __steering_state) 0)
    ((:operation_mode __operation_mode) 0)
    ((:lateral_ad_mode __lateral_ad_mode) 0)
    ((:longitudinal_ad_mode __longitudinal_ad_mode) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _wheel_speed_fl (float __wheel_speed_fl))
   (setq _wheel_speed_fr (float __wheel_speed_fr))
   (setq _wheel_speed_rl (float __wheel_speed_rl))
   (setq _wheel_speed_rr (float __wheel_speed_rr))
   (setq _vehicle_speed (round __vehicle_speed))
   (setq _lateral_accel (float __lateral_accel))
   (setq _longitudinal_accel (float __longitudinal_accel))
   (setq _yaw_rate (float __yaw_rate))
   (setq _steering_torque (float __steering_torque))
   (setq _steering_angle (float __steering_angle))
   (setq _steering_tire_angle (float __steering_tire_angle))
   (setq _accel_pedal_position (float __accel_pedal_position))
   (setq _brake_pressure (float __brake_pressure))
   (setq _cruise_main_status (round __cruise_main_status))
   (setq _cruise_switch_status (round __cruise_switch_status))
   (setq _gear_status (round __gear_status))
   (setq _auto_status (round __auto_status))
   (setq _steering_override (round __steering_override))
   (setq _acceleration_override (round __acceleration_override))
   (setq _brake_override (round __brake_override))
   (setq _sw_estop (round __sw_estop))
   (setq _mdps_act_error (round __mdps_act_error))
   (setq _epb_status (round __epb_status))
   (setq _gear_display (round __gear_display))
   (setq _left_turn_signal (round __left_turn_signal))
   (setq _right_turn_signal (round __right_turn_signal))
   (setq _hazard_lamp_status (round __hazard_lamp_status))
   (setq _kecu_cnt (round __kecu_cnt))
   (setq _power_state (round __power_state))
   (setq _power_MRMdrivingTime (round __power_MRMdrivingTime))
   (setq _power_main_current (float __power_main_current))
   (setq _power_sub_current (float __power_sub_current))
   (setq _power_main_voltage (float __power_main_voltage))
   (setq _power_sub_voltage (float __power_sub_voltage))
   (setq _steering_state (round __steering_state))
   (setq _operation_mode (round __operation_mode))
   (setq _lateral_ad_mode (round __lateral_ad_mode))
   (setq _longitudinal_ad_mode (round __longitudinal_ad_mode))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:wheel_speed_fl
   (&optional __wheel_speed_fl)
   (if __wheel_speed_fl (setq _wheel_speed_fl __wheel_speed_fl)) _wheel_speed_fl)
  (:wheel_speed_fr
   (&optional __wheel_speed_fr)
   (if __wheel_speed_fr (setq _wheel_speed_fr __wheel_speed_fr)) _wheel_speed_fr)
  (:wheel_speed_rl
   (&optional __wheel_speed_rl)
   (if __wheel_speed_rl (setq _wheel_speed_rl __wheel_speed_rl)) _wheel_speed_rl)
  (:wheel_speed_rr
   (&optional __wheel_speed_rr)
   (if __wheel_speed_rr (setq _wheel_speed_rr __wheel_speed_rr)) _wheel_speed_rr)
  (:vehicle_speed
   (&optional __vehicle_speed)
   (if __vehicle_speed (setq _vehicle_speed __vehicle_speed)) _vehicle_speed)
  (:lateral_accel
   (&optional __lateral_accel)
   (if __lateral_accel (setq _lateral_accel __lateral_accel)) _lateral_accel)
  (:longitudinal_accel
   (&optional __longitudinal_accel)
   (if __longitudinal_accel (setq _longitudinal_accel __longitudinal_accel)) _longitudinal_accel)
  (:yaw_rate
   (&optional __yaw_rate)
   (if __yaw_rate (setq _yaw_rate __yaw_rate)) _yaw_rate)
  (:steering_torque
   (&optional __steering_torque)
   (if __steering_torque (setq _steering_torque __steering_torque)) _steering_torque)
  (:steering_angle
   (&optional __steering_angle)
   (if __steering_angle (setq _steering_angle __steering_angle)) _steering_angle)
  (:steering_tire_angle
   (&optional __steering_tire_angle)
   (if __steering_tire_angle (setq _steering_tire_angle __steering_tire_angle)) _steering_tire_angle)
  (:accel_pedal_position
   (&optional __accel_pedal_position)
   (if __accel_pedal_position (setq _accel_pedal_position __accel_pedal_position)) _accel_pedal_position)
  (:brake_pressure
   (&optional __brake_pressure)
   (if __brake_pressure (setq _brake_pressure __brake_pressure)) _brake_pressure)
  (:cruise_main_status
   (&optional __cruise_main_status)
   (if __cruise_main_status (setq _cruise_main_status __cruise_main_status)) _cruise_main_status)
  (:cruise_switch_status
   (&optional __cruise_switch_status)
   (if __cruise_switch_status (setq _cruise_switch_status __cruise_switch_status)) _cruise_switch_status)
  (:gear_status
   (&optional __gear_status)
   (if __gear_status (setq _gear_status __gear_status)) _gear_status)
  (:auto_status
   (&optional __auto_status)
   (if __auto_status (setq _auto_status __auto_status)) _auto_status)
  (:steering_override
   (&optional __steering_override)
   (if __steering_override (setq _steering_override __steering_override)) _steering_override)
  (:acceleration_override
   (&optional __acceleration_override)
   (if __acceleration_override (setq _acceleration_override __acceleration_override)) _acceleration_override)
  (:brake_override
   (&optional __brake_override)
   (if __brake_override (setq _brake_override __brake_override)) _brake_override)
  (:sw_estop
   (&optional __sw_estop)
   (if __sw_estop (setq _sw_estop __sw_estop)) _sw_estop)
  (:mdps_act_error
   (&optional __mdps_act_error)
   (if __mdps_act_error (setq _mdps_act_error __mdps_act_error)) _mdps_act_error)
  (:epb_status
   (&optional __epb_status)
   (if __epb_status (setq _epb_status __epb_status)) _epb_status)
  (:gear_display
   (&optional __gear_display)
   (if __gear_display (setq _gear_display __gear_display)) _gear_display)
  (:left_turn_signal
   (&optional __left_turn_signal)
   (if __left_turn_signal (setq _left_turn_signal __left_turn_signal)) _left_turn_signal)
  (:right_turn_signal
   (&optional __right_turn_signal)
   (if __right_turn_signal (setq _right_turn_signal __right_turn_signal)) _right_turn_signal)
  (:hazard_lamp_status
   (&optional __hazard_lamp_status)
   (if __hazard_lamp_status (setq _hazard_lamp_status __hazard_lamp_status)) _hazard_lamp_status)
  (:kecu_cnt
   (&optional __kecu_cnt)
   (if __kecu_cnt (setq _kecu_cnt __kecu_cnt)) _kecu_cnt)
  (:power_state
   (&optional __power_state)
   (if __power_state (setq _power_state __power_state)) _power_state)
  (:power_MRMdrivingTime
   (&optional __power_MRMdrivingTime)
   (if __power_MRMdrivingTime (setq _power_MRMdrivingTime __power_MRMdrivingTime)) _power_MRMdrivingTime)
  (:power_main_current
   (&optional __power_main_current)
   (if __power_main_current (setq _power_main_current __power_main_current)) _power_main_current)
  (:power_sub_current
   (&optional __power_sub_current)
   (if __power_sub_current (setq _power_sub_current __power_sub_current)) _power_sub_current)
  (:power_main_voltage
   (&optional __power_main_voltage)
   (if __power_main_voltage (setq _power_main_voltage __power_main_voltage)) _power_main_voltage)
  (:power_sub_voltage
   (&optional __power_sub_voltage)
   (if __power_sub_voltage (setq _power_sub_voltage __power_sub_voltage)) _power_sub_voltage)
  (:steering_state
   (&optional __steering_state)
   (if __steering_state (setq _steering_state __steering_state)) _steering_state)
  (:operation_mode
   (&optional __operation_mode)
   (if __operation_mode (setq _operation_mode __operation_mode)) _operation_mode)
  (:lateral_ad_mode
   (&optional __lateral_ad_mode)
   (if __lateral_ad_mode (setq _lateral_ad_mode __lateral_ad_mode)) _lateral_ad_mode)
  (:longitudinal_ad_mode
   (&optional __longitudinal_ad_mode)
   (if __longitudinal_ad_mode (setq _longitudinal_ad_mode __longitudinal_ad_mode)) _longitudinal_ad_mode)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _wheel_speed_fl
    8
    ;; float64 _wheel_speed_fr
    8
    ;; float64 _wheel_speed_rl
    8
    ;; float64 _wheel_speed_rr
    8
    ;; uint16 _vehicle_speed
    2
    ;; float64 _lateral_accel
    8
    ;; float64 _longitudinal_accel
    8
    ;; float64 _yaw_rate
    8
    ;; float64 _steering_torque
    8
    ;; float64 _steering_angle
    8
    ;; float64 _steering_tire_angle
    8
    ;; float64 _accel_pedal_position
    8
    ;; float64 _brake_pressure
    8
    ;; uint8 _cruise_main_status
    1
    ;; uint8 _cruise_switch_status
    1
    ;; uint8 _gear_status
    1
    ;; uint8 _auto_status
    1
    ;; uint8 _steering_override
    1
    ;; uint8 _acceleration_override
    1
    ;; uint8 _brake_override
    1
    ;; uint8 _sw_estop
    1
    ;; uint8 _mdps_act_error
    1
    ;; uint8 _epb_status
    1
    ;; uint8 _gear_display
    1
    ;; uint8 _left_turn_signal
    1
    ;; uint8 _right_turn_signal
    1
    ;; uint8 _hazard_lamp_status
    1
    ;; uint8 _kecu_cnt
    1
    ;; uint8 _power_state
    1
    ;; uint8 _power_MRMdrivingTime
    1
    ;; float64 _power_main_current
    8
    ;; float64 _power_sub_current
    8
    ;; float64 _power_main_voltage
    8
    ;; float64 _power_sub_voltage
    8
    ;; uint8 _steering_state
    1
    ;; uint8 _operation_mode
    1
    ;; uint8 _lateral_ad_mode
    1
    ;; uint8 _longitudinal_ad_mode
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _wheel_speed_fl
       (sys::poke _wheel_speed_fl (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wheel_speed_fr
       (sys::poke _wheel_speed_fr (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wheel_speed_rl
       (sys::poke _wheel_speed_rl (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wheel_speed_rr
       (sys::poke _wheel_speed_rr (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint16 _vehicle_speed
       (write-word _vehicle_speed s)
     ;; float64 _lateral_accel
       (sys::poke _lateral_accel (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _longitudinal_accel
       (sys::poke _longitudinal_accel (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw_rate
       (sys::poke _yaw_rate (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _steering_torque
       (sys::poke _steering_torque (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _steering_angle
       (sys::poke _steering_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _steering_tire_angle
       (sys::poke _steering_tire_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _accel_pedal_position
       (sys::poke _accel_pedal_position (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _brake_pressure
       (sys::poke _brake_pressure (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _cruise_main_status
       (write-byte _cruise_main_status s)
     ;; uint8 _cruise_switch_status
       (write-byte _cruise_switch_status s)
     ;; uint8 _gear_status
       (write-byte _gear_status s)
     ;; uint8 _auto_status
       (write-byte _auto_status s)
     ;; uint8 _steering_override
       (write-byte _steering_override s)
     ;; uint8 _acceleration_override
       (write-byte _acceleration_override s)
     ;; uint8 _brake_override
       (write-byte _brake_override s)
     ;; uint8 _sw_estop
       (write-byte _sw_estop s)
     ;; uint8 _mdps_act_error
       (write-byte _mdps_act_error s)
     ;; uint8 _epb_status
       (write-byte _epb_status s)
     ;; uint8 _gear_display
       (write-byte _gear_display s)
     ;; uint8 _left_turn_signal
       (write-byte _left_turn_signal s)
     ;; uint8 _right_turn_signal
       (write-byte _right_turn_signal s)
     ;; uint8 _hazard_lamp_status
       (write-byte _hazard_lamp_status s)
     ;; uint8 _kecu_cnt
       (write-byte _kecu_cnt s)
     ;; uint8 _power_state
       (write-byte _power_state s)
     ;; uint8 _power_MRMdrivingTime
       (write-byte _power_MRMdrivingTime s)
     ;; float64 _power_main_current
       (sys::poke _power_main_current (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _power_sub_current
       (sys::poke _power_sub_current (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _power_main_voltage
       (sys::poke _power_main_voltage (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _power_sub_voltage
       (sys::poke _power_sub_voltage (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _steering_state
       (write-byte _steering_state s)
     ;; uint8 _operation_mode
       (write-byte _operation_mode s)
     ;; uint8 _lateral_ad_mode
       (write-byte _lateral_ad_mode s)
     ;; uint8 _longitudinal_ad_mode
       (write-byte _longitudinal_ad_mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _wheel_speed_fl
     (setq _wheel_speed_fl (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wheel_speed_fr
     (setq _wheel_speed_fr (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wheel_speed_rl
     (setq _wheel_speed_rl (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wheel_speed_rr
     (setq _wheel_speed_rr (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint16 _vehicle_speed
     (setq _vehicle_speed (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float64 _lateral_accel
     (setq _lateral_accel (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _longitudinal_accel
     (setq _longitudinal_accel (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw_rate
     (setq _yaw_rate (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _steering_torque
     (setq _steering_torque (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _steering_angle
     (setq _steering_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _steering_tire_angle
     (setq _steering_tire_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _accel_pedal_position
     (setq _accel_pedal_position (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _brake_pressure
     (setq _brake_pressure (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _cruise_main_status
     (setq _cruise_main_status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _cruise_switch_status
     (setq _cruise_switch_status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gear_status
     (setq _gear_status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _auto_status
     (setq _auto_status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _steering_override
     (setq _steering_override (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _acceleration_override
     (setq _acceleration_override (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _brake_override
     (setq _brake_override (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _sw_estop
     (setq _sw_estop (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _mdps_act_error
     (setq _mdps_act_error (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _epb_status
     (setq _epb_status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gear_display
     (setq _gear_display (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _left_turn_signal
     (setq _left_turn_signal (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _right_turn_signal
     (setq _right_turn_signal (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _hazard_lamp_status
     (setq _hazard_lamp_status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _kecu_cnt
     (setq _kecu_cnt (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _power_state
     (setq _power_state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _power_MRMdrivingTime
     (setq _power_MRMdrivingTime (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _power_main_current
     (setq _power_main_current (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _power_sub_current
     (setq _power_sub_current (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _power_main_voltage
     (setq _power_main_voltage (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _power_sub_voltage
     (setq _power_sub_voltage (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _steering_state
     (setq _steering_state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _operation_mode
     (setq _operation_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _lateral_ad_mode
     (setq _lateral_ad_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _longitudinal_ad_mode
     (setq _longitudinal_ad_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get autohyu_msgs::VehicleCAN :md5sum-) "ce768e61bd6f2c0239a3b3e0a9963e4d")
(setf (get autohyu_msgs::VehicleCAN :datatype-) "autohyu_msgs/VehicleCAN")
(setf (get autohyu_msgs::VehicleCAN :definition-)
      "# std_msgs/Header
std_msgs/Header header

# Measurements
float64 wheel_speed_fl
float64 wheel_speed_fr
float64 wheel_speed_rl
float64 wheel_speed_rr
uint16  vehicle_speed

float64 lateral_accel
float64 longitudinal_accel
float64 yaw_rate

float64 steering_torque
float64 steering_angle
float64 steering_tire_angle
float64 accel_pedal_position
float64 brake_pressure

# AD Status
uint8   cruise_main_status
uint8   cruise_switch_status
uint8   gear_status
uint8   auto_status

# AD Override
uint8   steering_override
uint8   acceleration_override
uint8   brake_override
uint8   sw_estop

# Vehicle Status
uint8   mdps_act_error
uint8   epb_status
uint8   gear_display
uint8   left_turn_signal
uint8   right_turn_signal
uint8   hazard_lamp_status
uint8   kecu_cnt

# Power System
uint8   power_state
uint8   power_MRMdrivingTime
float64 power_main_current
float64 power_sub_current
float64 power_main_voltage
float64 power_sub_voltage

# Mode
uint8   steering_state
uint8   operation_mode
uint8   lateral_ad_mode
uint8   longitudinal_ad_mode

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :autohyu_msgs/VehicleCAN "ce768e61bd6f2c0239a3b3e0a9963e4d")


