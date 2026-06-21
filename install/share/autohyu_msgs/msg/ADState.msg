# std_msgs/Header
std_msgs/Header header

# AD Mode
uint8 operation_mode
uint8 lateral_ad_mode
uint8 longitudinal_ad_mode
uint8 ad_level
uint8 mrm_type

# Sensor state
uint8 left_sensors
uint8 right_sensors
uint8 front_sensors
uint8 rear_sensors
uint8 adk_1_sensors
uint8 adk_2_sensors

uint8 lidar_top_ruby
uint8 lidar_middle_m1_front
uint8 lidar_middle_m1_left
uint8 lidar_middle_m1_right
uint8 lidar_bottom_m1_front
uint8 lidar_bottom_m1_rear
uint8 lidar_bottom_bp_left
uint8 lidar_bottom_bp_right

uint8 radar_front
uint8 radar_corner_front_left
uint8 radar_corner_front_right
uint8 radar_corner_rear_left
uint8 radar_corner_rear_right

uint8 camera_front_left
uint8 camera_front_right
uint8 camera_left_front
uint8 camera_left_rear
uint8 camera_right_front
uint8 camera_right_rear
uint8 camera_rear

uint8 gnss_ins
uint8 can_device
uint8 v2x_device

# Actuator state
uint8 longitudinal_actuator
uint8 lateral_actuator

# SWC State
uint8 localization_state
uint8 perception_state
uint8 prediction_state
uint8 planning_state
uint8 lateral_control_state
uint8 longitudinal_control_state