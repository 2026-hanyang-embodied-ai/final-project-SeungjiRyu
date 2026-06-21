;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::ControlInputOutput)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'ControlInputOutput (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::CONTROLINPUTOUTPUT")
  (make-package "AUTOHYU_MSGS::CONTROLINPUTOUTPUT"))

(in-package "ROS")
;;//! \htmlinclude ControlInputOutput.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autohyu_msgs::ControlInputOutput
  :super ros::object
  :slots (_header _vehicle_state _trajectory _command_steer _command_accel_pedal _command_brake_pedal _command_speed _command_acceleration ))

(defmethod autohyu_msgs::ControlInputOutput
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:vehicle_state __vehicle_state) (instance autohyu_msgs::VehicleState :init))
    ((:trajectory __trajectory) (instance autohyu_msgs::Trajectory :init))
    ((:command_steer __command_steer) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:command_accel_pedal __command_accel_pedal) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:command_brake_pedal __command_brake_pedal) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:command_speed __command_speed) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:command_acceleration __command_acceleration) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _vehicle_state __vehicle_state)
   (setq _trajectory __trajectory)
   (setq _command_steer __command_steer)
   (setq _command_accel_pedal __command_accel_pedal)
   (setq _command_brake_pedal __command_brake_pedal)
   (setq _command_speed __command_speed)
   (setq _command_acceleration __command_acceleration)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:vehicle_state
   (&rest __vehicle_state)
   (if (keywordp (car __vehicle_state))
       (send* _vehicle_state __vehicle_state)
     (progn
       (if __vehicle_state (setq _vehicle_state (car __vehicle_state)))
       _vehicle_state)))
  (:trajectory
   (&rest __trajectory)
   (if (keywordp (car __trajectory))
       (send* _trajectory __trajectory)
     (progn
       (if __trajectory (setq _trajectory (car __trajectory)))
       _trajectory)))
  (:command_steer
   (&optional __command_steer)
   (if __command_steer (setq _command_steer __command_steer)) _command_steer)
  (:command_accel_pedal
   (&optional __command_accel_pedal)
   (if __command_accel_pedal (setq _command_accel_pedal __command_accel_pedal)) _command_accel_pedal)
  (:command_brake_pedal
   (&optional __command_brake_pedal)
   (if __command_brake_pedal (setq _command_brake_pedal __command_brake_pedal)) _command_brake_pedal)
  (:command_speed
   (&optional __command_speed)
   (if __command_speed (setq _command_speed __command_speed)) _command_speed)
  (:command_acceleration
   (&optional __command_acceleration)
   (if __command_acceleration (setq _command_acceleration __command_acceleration)) _command_acceleration)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; autohyu_msgs/VehicleState _vehicle_state
    (send _vehicle_state :serialization-length)
    ;; autohyu_msgs/Trajectory _trajectory
    (send _trajectory :serialization-length)
    ;; float32[] _command_steer
    (* 4    (length _command_steer)) 4
    ;; float32[] _command_accel_pedal
    (* 4    (length _command_accel_pedal)) 4
    ;; float32[] _command_brake_pedal
    (* 4    (length _command_brake_pedal)) 4
    ;; float32[] _command_speed
    (* 4    (length _command_speed)) 4
    ;; float32[] _command_acceleration
    (* 4    (length _command_acceleration)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; autohyu_msgs/VehicleState _vehicle_state
       (send _vehicle_state :serialize s)
     ;; autohyu_msgs/Trajectory _trajectory
       (send _trajectory :serialize s)
     ;; float32[] _command_steer
     (write-long (length _command_steer) s)
     (dotimes (i (length _command_steer))
       (sys::poke (elt _command_steer i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _command_accel_pedal
     (write-long (length _command_accel_pedal) s)
     (dotimes (i (length _command_accel_pedal))
       (sys::poke (elt _command_accel_pedal i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _command_brake_pedal
     (write-long (length _command_brake_pedal) s)
     (dotimes (i (length _command_brake_pedal))
       (sys::poke (elt _command_brake_pedal i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _command_speed
     (write-long (length _command_speed) s)
     (dotimes (i (length _command_speed))
       (sys::poke (elt _command_speed i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _command_acceleration
     (write-long (length _command_acceleration) s)
     (dotimes (i (length _command_acceleration))
       (sys::poke (elt _command_acceleration i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; autohyu_msgs/VehicleState _vehicle_state
     (send _vehicle_state :deserialize buf ptr-) (incf ptr- (send _vehicle_state :serialization-length))
   ;; autohyu_msgs/Trajectory _trajectory
     (send _trajectory :deserialize buf ptr-) (incf ptr- (send _trajectory :serialization-length))
   ;; float32[] _command_steer
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _command_steer (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _command_steer i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _command_accel_pedal
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _command_accel_pedal (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _command_accel_pedal i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _command_brake_pedal
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _command_brake_pedal (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _command_brake_pedal i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _command_speed
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _command_speed (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _command_speed i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _command_acceleration
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _command_acceleration (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _command_acceleration i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get autohyu_msgs::ControlInputOutput :md5sum-) "3ea3f7b2097ca95368fcfd5f0afbc535")
(setf (get autohyu_msgs::ControlInputOutput :datatype-) "autohyu_msgs/ControlInputOutput")
(setf (get autohyu_msgs::ControlInputOutput :definition-)
      "std_msgs/Header header

autohyu_msgs/VehicleState vehicle_state
autohyu_msgs/Trajectory   trajectory
float32[] command_steer
float32[] command_accel_pedal
float32[] command_brake_pedal
float32[] command_speed
float32[] command_acceleration
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
MSG: autohyu_msgs/VehicleState
# std_msgs/Header
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

================================================================================
MSG: autohyu_msgs/Trajectory
# std_msgs/Header
std_msgs/Header header

uint16 id
autohyu_msgs/TrajectoryPoint[] point
================================================================================
MSG: autohyu_msgs/TrajectoryPoint
float32 time
float32 distance
uint16  direction
float32 x
float32 y
float32 z
float32 yaw
float32 curvature
float32 speed
float32 acceleration
")



(provide :autohyu_msgs/ControlInputOutput "3ea3f7b2097ca95368fcfd5f0afbc535")


