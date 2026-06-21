# std_msgs/Header
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
