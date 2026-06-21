;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::VehicleState)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'VehicleState (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::VEHICLESTATE")
  (make-package "AUTOHYU_MSGS::VEHICLESTATE"))

(in-package "ROS")
;;//! \htmlinclude VehicleState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autohyu_msgs::VehicleState
  :super ros::object
  :slots (_header _gnss _x _y _z _vx _vy _vz _ax _ay _az _roll _pitch _yaw _roll_vel _pitch_vel _yaw_vel _vehicle_can ))

(defmethod autohyu_msgs::VehicleState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:gnss __gnss) (instance autohyu_msgs::WGS84 :init))
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:vx __vx) 0.0)
    ((:vy __vy) 0.0)
    ((:vz __vz) 0.0)
    ((:ax __ax) 0.0)
    ((:ay __ay) 0.0)
    ((:az __az) 0.0)
    ((:roll __roll) 0.0)
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    ((:roll_vel __roll_vel) 0.0)
    ((:pitch_vel __pitch_vel) 0.0)
    ((:yaw_vel __yaw_vel) 0.0)
    ((:vehicle_can __vehicle_can) (instance autohyu_msgs::VehicleCAN :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _gnss __gnss)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _vx (float __vx))
   (setq _vy (float __vy))
   (setq _vz (float __vz))
   (setq _ax (float __ax))
   (setq _ay (float __ay))
   (setq _az (float __az))
   (setq _roll (float __roll))
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   (setq _roll_vel (float __roll_vel))
   (setq _pitch_vel (float __pitch_vel))
   (setq _yaw_vel (float __yaw_vel))
   (setq _vehicle_can __vehicle_can)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:gnss
   (&rest __gnss)
   (if (keywordp (car __gnss))
       (send* _gnss __gnss)
     (progn
       (if __gnss (setq _gnss (car __gnss)))
       _gnss)))
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:vx
   (&optional __vx)
   (if __vx (setq _vx __vx)) _vx)
  (:vy
   (&optional __vy)
   (if __vy (setq _vy __vy)) _vy)
  (:vz
   (&optional __vz)
   (if __vz (setq _vz __vz)) _vz)
  (:ax
   (&optional __ax)
   (if __ax (setq _ax __ax)) _ax)
  (:ay
   (&optional __ay)
   (if __ay (setq _ay __ay)) _ay)
  (:az
   (&optional __az)
   (if __az (setq _az __az)) _az)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:roll_vel
   (&optional __roll_vel)
   (if __roll_vel (setq _roll_vel __roll_vel)) _roll_vel)
  (:pitch_vel
   (&optional __pitch_vel)
   (if __pitch_vel (setq _pitch_vel __pitch_vel)) _pitch_vel)
  (:yaw_vel
   (&optional __yaw_vel)
   (if __yaw_vel (setq _yaw_vel __yaw_vel)) _yaw_vel)
  (:vehicle_can
   (&rest __vehicle_can)
   (if (keywordp (car __vehicle_can))
       (send* _vehicle_can __vehicle_can)
     (progn
       (if __vehicle_can (setq _vehicle_can (car __vehicle_can)))
       _vehicle_can)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; autohyu_msgs/WGS84 _gnss
    (send _gnss :serialization-length)
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; float64 _vx
    8
    ;; float64 _vy
    8
    ;; float64 _vz
    8
    ;; float64 _ax
    8
    ;; float64 _ay
    8
    ;; float64 _az
    8
    ;; float64 _roll
    8
    ;; float64 _pitch
    8
    ;; float64 _yaw
    8
    ;; float64 _roll_vel
    8
    ;; float64 _pitch_vel
    8
    ;; float64 _yaw_vel
    8
    ;; autohyu_msgs/VehicleCAN _vehicle_can
    (send _vehicle_can :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; autohyu_msgs/WGS84 _gnss
       (send _gnss :serialize s)
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vx
       (sys::poke _vx (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vy
       (sys::poke _vy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vz
       (sys::poke _vz (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ax
       (sys::poke _ax (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ay
       (sys::poke _ay (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _az
       (sys::poke _az (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _roll_vel
       (sys::poke _roll_vel (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pitch_vel
       (sys::poke _pitch_vel (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw_vel
       (sys::poke _yaw_vel (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; autohyu_msgs/VehicleCAN _vehicle_can
       (send _vehicle_can :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; autohyu_msgs/WGS84 _gnss
     (send _gnss :deserialize buf ptr-) (incf ptr- (send _gnss :serialization-length))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vx
     (setq _vx (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vy
     (setq _vy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vz
     (setq _vz (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ax
     (setq _ax (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ay
     (setq _ay (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _az
     (setq _az (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _roll
     (setq _roll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitch
     (setq _pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _roll_vel
     (setq _roll_vel (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitch_vel
     (setq _pitch_vel (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw_vel
     (setq _yaw_vel (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; autohyu_msgs/VehicleCAN _vehicle_can
     (send _vehicle_can :deserialize buf ptr-) (incf ptr- (send _vehicle_can :serialization-length))
   ;;
   self)
  )

(setf (get autohyu_msgs::VehicleState :md5sum-) "82ceef6f5a703e2f0d1a7958db0b5bce")
(setf (get autohyu_msgs::VehicleState :datatype-) "autohyu_msgs/VehicleState")
(setf (get autohyu_msgs::VehicleState :definition-)
      "# std_msgs/Header
std_msgs/Header header

# gnss
autohyu_msgs/WGS84 gnss

# position and motion
float64 x
float64 y
float64 z

float64 vx
float64 vy
float64 vz

float64 ax
float64 ay
float64 az

float64 roll
float64 pitch
float64 yaw

float64 roll_vel
float64 pitch_vel
float64 yaw_vel

# vehicle can
autohyu_msgs/VehicleCAN vehicle_can
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

================================================================================
MSG: autohyu_msgs/WGS84
float64 latitude
float64 longitude
float64 altitude
================================================================================
MSG: autohyu_msgs/VehicleCAN
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

")



(provide :autohyu_msgs/VehicleState "82ceef6f5a703e2f0d1a7958db0b5bce")


