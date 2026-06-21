;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::ADState)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'ADState (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::ADSTATE")
  (make-package "AUTOHYU_MSGS::ADSTATE"))

(in-package "ROS")
;;//! \htmlinclude ADState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autohyu_msgs::ADState
  :super ros::object
  :slots (_header _operation_mode _lateral_ad_mode _longitudinal_ad_mode _ad_level _mrm_type _left_sensors _right_sensors _front_sensors _rear_sensors _adk_1_sensors _adk_2_sensors _lidar_top_ruby _lidar_middle_m1_front _lidar_middle_m1_left _lidar_middle_m1_right _lidar_bottom_m1_front _lidar_bottom_m1_rear _lidar_bottom_bp_left _lidar_bottom_bp_right _radar_front _radar_corner_front_left _radar_corner_front_right _radar_corner_rear_left _radar_corner_rear_right _camera_front_left _camera_front_right _camera_left_front _camera_left_rear _camera_right_front _camera_right_rear _camera_rear _gnss_ins _can_device _v2x_device _longitudinal_actuator _lateral_actuator _localization_state _perception_state _prediction_state _planning_state _lateral_control_state _longitudinal_control_state ))

(defmethod autohyu_msgs::ADState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:operation_mode __operation_mode) 0)
    ((:lateral_ad_mode __lateral_ad_mode) 0)
    ((:longitudinal_ad_mode __longitudinal_ad_mode) 0)
    ((:ad_level __ad_level) 0)
    ((:mrm_type __mrm_type) 0)
    ((:left_sensors __left_sensors) 0)
    ((:right_sensors __right_sensors) 0)
    ((:front_sensors __front_sensors) 0)
    ((:rear_sensors __rear_sensors) 0)
    ((:adk_1_sensors __adk_1_sensors) 0)
    ((:adk_2_sensors __adk_2_sensors) 0)
    ((:lidar_top_ruby __lidar_top_ruby) 0)
    ((:lidar_middle_m1_front __lidar_middle_m1_front) 0)
    ((:lidar_middle_m1_left __lidar_middle_m1_left) 0)
    ((:lidar_middle_m1_right __lidar_middle_m1_right) 0)
    ((:lidar_bottom_m1_front __lidar_bottom_m1_front) 0)
    ((:lidar_bottom_m1_rear __lidar_bottom_m1_rear) 0)
    ((:lidar_bottom_bp_left __lidar_bottom_bp_left) 0)
    ((:lidar_bottom_bp_right __lidar_bottom_bp_right) 0)
    ((:radar_front __radar_front) 0)
    ((:radar_corner_front_left __radar_corner_front_left) 0)
    ((:radar_corner_front_right __radar_corner_front_right) 0)
    ((:radar_corner_rear_left __radar_corner_rear_left) 0)
    ((:radar_corner_rear_right __radar_corner_rear_right) 0)
    ((:camera_front_left __camera_front_left) 0)
    ((:camera_front_right __camera_front_right) 0)
    ((:camera_left_front __camera_left_front) 0)
    ((:camera_left_rear __camera_left_rear) 0)
    ((:camera_right_front __camera_right_front) 0)
    ((:camera_right_rear __camera_right_rear) 0)
    ((:camera_rear __camera_rear) 0)
    ((:gnss_ins __gnss_ins) 0)
    ((:can_device __can_device) 0)
    ((:v2x_device __v2x_device) 0)
    ((:longitudinal_actuator __longitudinal_actuator) 0)
    ((:lateral_actuator __lateral_actuator) 0)
    ((:localization_state __localization_state) 0)
    ((:perception_state __perception_state) 0)
    ((:prediction_state __prediction_state) 0)
    ((:planning_state __planning_state) 0)
    ((:lateral_control_state __lateral_control_state) 0)
    ((:longitudinal_control_state __longitudinal_control_state) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _operation_mode (round __operation_mode))
   (setq _lateral_ad_mode (round __lateral_ad_mode))
   (setq _longitudinal_ad_mode (round __longitudinal_ad_mode))
   (setq _ad_level (round __ad_level))
   (setq _mrm_type (round __mrm_type))
   (setq _left_sensors (round __left_sensors))
   (setq _right_sensors (round __right_sensors))
   (setq _front_sensors (round __front_sensors))
   (setq _rear_sensors (round __rear_sensors))
   (setq _adk_1_sensors (round __adk_1_sensors))
   (setq _adk_2_sensors (round __adk_2_sensors))
   (setq _lidar_top_ruby (round __lidar_top_ruby))
   (setq _lidar_middle_m1_front (round __lidar_middle_m1_front))
   (setq _lidar_middle_m1_left (round __lidar_middle_m1_left))
   (setq _lidar_middle_m1_right (round __lidar_middle_m1_right))
   (setq _lidar_bottom_m1_front (round __lidar_bottom_m1_front))
   (setq _lidar_bottom_m1_rear (round __lidar_bottom_m1_rear))
   (setq _lidar_bottom_bp_left (round __lidar_bottom_bp_left))
   (setq _lidar_bottom_bp_right (round __lidar_bottom_bp_right))
   (setq _radar_front (round __radar_front))
   (setq _radar_corner_front_left (round __radar_corner_front_left))
   (setq _radar_corner_front_right (round __radar_corner_front_right))
   (setq _radar_corner_rear_left (round __radar_corner_rear_left))
   (setq _radar_corner_rear_right (round __radar_corner_rear_right))
   (setq _camera_front_left (round __camera_front_left))
   (setq _camera_front_right (round __camera_front_right))
   (setq _camera_left_front (round __camera_left_front))
   (setq _camera_left_rear (round __camera_left_rear))
   (setq _camera_right_front (round __camera_right_front))
   (setq _camera_right_rear (round __camera_right_rear))
   (setq _camera_rear (round __camera_rear))
   (setq _gnss_ins (round __gnss_ins))
   (setq _can_device (round __can_device))
   (setq _v2x_device (round __v2x_device))
   (setq _longitudinal_actuator (round __longitudinal_actuator))
   (setq _lateral_actuator (round __lateral_actuator))
   (setq _localization_state (round __localization_state))
   (setq _perception_state (round __perception_state))
   (setq _prediction_state (round __prediction_state))
   (setq _planning_state (round __planning_state))
   (setq _lateral_control_state (round __lateral_control_state))
   (setq _longitudinal_control_state (round __longitudinal_control_state))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:operation_mode
   (&optional __operation_mode)
   (if __operation_mode (setq _operation_mode __operation_mode)) _operation_mode)
  (:lateral_ad_mode
   (&optional __lateral_ad_mode)
   (if __lateral_ad_mode (setq _lateral_ad_mode __lateral_ad_mode)) _lateral_ad_mode)
  (:longitudinal_ad_mode
   (&optional __longitudinal_ad_mode)
   (if __longitudinal_ad_mode (setq _longitudinal_ad_mode __longitudinal_ad_mode)) _longitudinal_ad_mode)
  (:ad_level
   (&optional __ad_level)
   (if __ad_level (setq _ad_level __ad_level)) _ad_level)
  (:mrm_type
   (&optional __mrm_type)
   (if __mrm_type (setq _mrm_type __mrm_type)) _mrm_type)
  (:left_sensors
   (&optional __left_sensors)
   (if __left_sensors (setq _left_sensors __left_sensors)) _left_sensors)
  (:right_sensors
   (&optional __right_sensors)
   (if __right_sensors (setq _right_sensors __right_sensors)) _right_sensors)
  (:front_sensors
   (&optional __front_sensors)
   (if __front_sensors (setq _front_sensors __front_sensors)) _front_sensors)
  (:rear_sensors
   (&optional __rear_sensors)
   (if __rear_sensors (setq _rear_sensors __rear_sensors)) _rear_sensors)
  (:adk_1_sensors
   (&optional __adk_1_sensors)
   (if __adk_1_sensors (setq _adk_1_sensors __adk_1_sensors)) _adk_1_sensors)
  (:adk_2_sensors
   (&optional __adk_2_sensors)
   (if __adk_2_sensors (setq _adk_2_sensors __adk_2_sensors)) _adk_2_sensors)
  (:lidar_top_ruby
   (&optional __lidar_top_ruby)
   (if __lidar_top_ruby (setq _lidar_top_ruby __lidar_top_ruby)) _lidar_top_ruby)
  (:lidar_middle_m1_front
   (&optional __lidar_middle_m1_front)
   (if __lidar_middle_m1_front (setq _lidar_middle_m1_front __lidar_middle_m1_front)) _lidar_middle_m1_front)
  (:lidar_middle_m1_left
   (&optional __lidar_middle_m1_left)
   (if __lidar_middle_m1_left (setq _lidar_middle_m1_left __lidar_middle_m1_left)) _lidar_middle_m1_left)
  (:lidar_middle_m1_right
   (&optional __lidar_middle_m1_right)
   (if __lidar_middle_m1_right (setq _lidar_middle_m1_right __lidar_middle_m1_right)) _lidar_middle_m1_right)
  (:lidar_bottom_m1_front
   (&optional __lidar_bottom_m1_front)
   (if __lidar_bottom_m1_front (setq _lidar_bottom_m1_front __lidar_bottom_m1_front)) _lidar_bottom_m1_front)
  (:lidar_bottom_m1_rear
   (&optional __lidar_bottom_m1_rear)
   (if __lidar_bottom_m1_rear (setq _lidar_bottom_m1_rear __lidar_bottom_m1_rear)) _lidar_bottom_m1_rear)
  (:lidar_bottom_bp_left
   (&optional __lidar_bottom_bp_left)
   (if __lidar_bottom_bp_left (setq _lidar_bottom_bp_left __lidar_bottom_bp_left)) _lidar_bottom_bp_left)
  (:lidar_bottom_bp_right
   (&optional __lidar_bottom_bp_right)
   (if __lidar_bottom_bp_right (setq _lidar_bottom_bp_right __lidar_bottom_bp_right)) _lidar_bottom_bp_right)
  (:radar_front
   (&optional __radar_front)
   (if __radar_front (setq _radar_front __radar_front)) _radar_front)
  (:radar_corner_front_left
   (&optional __radar_corner_front_left)
   (if __radar_corner_front_left (setq _radar_corner_front_left __radar_corner_front_left)) _radar_corner_front_left)
  (:radar_corner_front_right
   (&optional __radar_corner_front_right)
   (if __radar_corner_front_right (setq _radar_corner_front_right __radar_corner_front_right)) _radar_corner_front_right)
  (:radar_corner_rear_left
   (&optional __radar_corner_rear_left)
   (if __radar_corner_rear_left (setq _radar_corner_rear_left __radar_corner_rear_left)) _radar_corner_rear_left)
  (:radar_corner_rear_right
   (&optional __radar_corner_rear_right)
   (if __radar_corner_rear_right (setq _radar_corner_rear_right __radar_corner_rear_right)) _radar_corner_rear_right)
  (:camera_front_left
   (&optional __camera_front_left)
   (if __camera_front_left (setq _camera_front_left __camera_front_left)) _camera_front_left)
  (:camera_front_right
   (&optional __camera_front_right)
   (if __camera_front_right (setq _camera_front_right __camera_front_right)) _camera_front_right)
  (:camera_left_front
   (&optional __camera_left_front)
   (if __camera_left_front (setq _camera_left_front __camera_left_front)) _camera_left_front)
  (:camera_left_rear
   (&optional __camera_left_rear)
   (if __camera_left_rear (setq _camera_left_rear __camera_left_rear)) _camera_left_rear)
  (:camera_right_front
   (&optional __camera_right_front)
   (if __camera_right_front (setq _camera_right_front __camera_right_front)) _camera_right_front)
  (:camera_right_rear
   (&optional __camera_right_rear)
   (if __camera_right_rear (setq _camera_right_rear __camera_right_rear)) _camera_right_rear)
  (:camera_rear
   (&optional __camera_rear)
   (if __camera_rear (setq _camera_rear __camera_rear)) _camera_rear)
  (:gnss_ins
   (&optional __gnss_ins)
   (if __gnss_ins (setq _gnss_ins __gnss_ins)) _gnss_ins)
  (:can_device
   (&optional __can_device)
   (if __can_device (setq _can_device __can_device)) _can_device)
  (:v2x_device
   (&optional __v2x_device)
   (if __v2x_device (setq _v2x_device __v2x_device)) _v2x_device)
  (:longitudinal_actuator
   (&optional __longitudinal_actuator)
   (if __longitudinal_actuator (setq _longitudinal_actuator __longitudinal_actuator)) _longitudinal_actuator)
  (:lateral_actuator
   (&optional __lateral_actuator)
   (if __lateral_actuator (setq _lateral_actuator __lateral_actuator)) _lateral_actuator)
  (:localization_state
   (&optional __localization_state)
   (if __localization_state (setq _localization_state __localization_state)) _localization_state)
  (:perception_state
   (&optional __perception_state)
   (if __perception_state (setq _perception_state __perception_state)) _perception_state)
  (:prediction_state
   (&optional __prediction_state)
   (if __prediction_state (setq _prediction_state __prediction_state)) _prediction_state)
  (:planning_state
   (&optional __planning_state)
   (if __planning_state (setq _planning_state __planning_state)) _planning_state)
  (:lateral_control_state
   (&optional __lateral_control_state)
   (if __lateral_control_state (setq _lateral_control_state __lateral_control_state)) _lateral_control_state)
  (:longitudinal_control_state
   (&optional __longitudinal_control_state)
   (if __longitudinal_control_state (setq _longitudinal_control_state __longitudinal_control_state)) _longitudinal_control_state)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _operation_mode
    1
    ;; uint8 _lateral_ad_mode
    1
    ;; uint8 _longitudinal_ad_mode
    1
    ;; uint8 _ad_level
    1
    ;; uint8 _mrm_type
    1
    ;; uint8 _left_sensors
    1
    ;; uint8 _right_sensors
    1
    ;; uint8 _front_sensors
    1
    ;; uint8 _rear_sensors
    1
    ;; uint8 _adk_1_sensors
    1
    ;; uint8 _adk_2_sensors
    1
    ;; uint8 _lidar_top_ruby
    1
    ;; uint8 _lidar_middle_m1_front
    1
    ;; uint8 _lidar_middle_m1_left
    1
    ;; uint8 _lidar_middle_m1_right
    1
    ;; uint8 _lidar_bottom_m1_front
    1
    ;; uint8 _lidar_bottom_m1_rear
    1
    ;; uint8 _lidar_bottom_bp_left
    1
    ;; uint8 _lidar_bottom_bp_right
    1
    ;; uint8 _radar_front
    1
    ;; uint8 _radar_corner_front_left
    1
    ;; uint8 _radar_corner_front_right
    1
    ;; uint8 _radar_corner_rear_left
    1
    ;; uint8 _radar_corner_rear_right
    1
    ;; uint8 _camera_front_left
    1
    ;; uint8 _camera_front_right
    1
    ;; uint8 _camera_left_front
    1
    ;; uint8 _camera_left_rear
    1
    ;; uint8 _camera_right_front
    1
    ;; uint8 _camera_right_rear
    1
    ;; uint8 _camera_rear
    1
    ;; uint8 _gnss_ins
    1
    ;; uint8 _can_device
    1
    ;; uint8 _v2x_device
    1
    ;; uint8 _longitudinal_actuator
    1
    ;; uint8 _lateral_actuator
    1
    ;; uint8 _localization_state
    1
    ;; uint8 _perception_state
    1
    ;; uint8 _prediction_state
    1
    ;; uint8 _planning_state
    1
    ;; uint8 _lateral_control_state
    1
    ;; uint8 _longitudinal_control_state
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _operation_mode
       (write-byte _operation_mode s)
     ;; uint8 _lateral_ad_mode
       (write-byte _lateral_ad_mode s)
     ;; uint8 _longitudinal_ad_mode
       (write-byte _longitudinal_ad_mode s)
     ;; uint8 _ad_level
       (write-byte _ad_level s)
     ;; uint8 _mrm_type
       (write-byte _mrm_type s)
     ;; uint8 _left_sensors
       (write-byte _left_sensors s)
     ;; uint8 _right_sensors
       (write-byte _right_sensors s)
     ;; uint8 _front_sensors
       (write-byte _front_sensors s)
     ;; uint8 _rear_sensors
       (write-byte _rear_sensors s)
     ;; uint8 _adk_1_sensors
       (write-byte _adk_1_sensors s)
     ;; uint8 _adk_2_sensors
       (write-byte _adk_2_sensors s)
     ;; uint8 _lidar_top_ruby
       (write-byte _lidar_top_ruby s)
     ;; uint8 _lidar_middle_m1_front
       (write-byte _lidar_middle_m1_front s)
     ;; uint8 _lidar_middle_m1_left
       (write-byte _lidar_middle_m1_left s)
     ;; uint8 _lidar_middle_m1_right
       (write-byte _lidar_middle_m1_right s)
     ;; uint8 _lidar_bottom_m1_front
       (write-byte _lidar_bottom_m1_front s)
     ;; uint8 _lidar_bottom_m1_rear
       (write-byte _lidar_bottom_m1_rear s)
     ;; uint8 _lidar_bottom_bp_left
       (write-byte _lidar_bottom_bp_left s)
     ;; uint8 _lidar_bottom_bp_right
       (write-byte _lidar_bottom_bp_right s)
     ;; uint8 _radar_front
       (write-byte _radar_front s)
     ;; uint8 _radar_corner_front_left
       (write-byte _radar_corner_front_left s)
     ;; uint8 _radar_corner_front_right
       (write-byte _radar_corner_front_right s)
     ;; uint8 _radar_corner_rear_left
       (write-byte _radar_corner_rear_left s)
     ;; uint8 _radar_corner_rear_right
       (write-byte _radar_corner_rear_right s)
     ;; uint8 _camera_front_left
       (write-byte _camera_front_left s)
     ;; uint8 _camera_front_right
       (write-byte _camera_front_right s)
     ;; uint8 _camera_left_front
       (write-byte _camera_left_front s)
     ;; uint8 _camera_left_rear
       (write-byte _camera_left_rear s)
     ;; uint8 _camera_right_front
       (write-byte _camera_right_front s)
     ;; uint8 _camera_right_rear
       (write-byte _camera_right_rear s)
     ;; uint8 _camera_rear
       (write-byte _camera_rear s)
     ;; uint8 _gnss_ins
       (write-byte _gnss_ins s)
     ;; uint8 _can_device
       (write-byte _can_device s)
     ;; uint8 _v2x_device
       (write-byte _v2x_device s)
     ;; uint8 _longitudinal_actuator
       (write-byte _longitudinal_actuator s)
     ;; uint8 _lateral_actuator
       (write-byte _lateral_actuator s)
     ;; uint8 _localization_state
       (write-byte _localization_state s)
     ;; uint8 _perception_state
       (write-byte _perception_state s)
     ;; uint8 _prediction_state
       (write-byte _prediction_state s)
     ;; uint8 _planning_state
       (write-byte _planning_state s)
     ;; uint8 _lateral_control_state
       (write-byte _lateral_control_state s)
     ;; uint8 _longitudinal_control_state
       (write-byte _longitudinal_control_state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _operation_mode
     (setq _operation_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _lateral_ad_mode
     (setq _lateral_ad_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _longitudinal_ad_mode
     (setq _longitudinal_ad_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _ad_level
     (setq _ad_level (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _mrm_type
     (setq _mrm_type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _left_sensors
     (setq _left_sensors (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _right_sensors
     (setq _right_sensors (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _front_sensors
     (setq _front_sensors (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rear_sensors
     (setq _rear_sensors (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _adk_1_sensors
     (setq _adk_1_sensors (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _adk_2_sensors
     (setq _adk_2_sensors (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _lidar_top_ruby
     (setq _lidar_top_ruby (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _lidar_middle_m1_front
     (setq _lidar_middle_m1_front (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _lidar_middle_m1_left
     (setq _lidar_middle_m1_left (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _lidar_middle_m1_right
     (setq _lidar_middle_m1_right (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _lidar_bottom_m1_front
     (setq _lidar_bottom_m1_front (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _lidar_bottom_m1_rear
     (setq _lidar_bottom_m1_rear (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _lidar_bottom_bp_left
     (setq _lidar_bottom_bp_left (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _lidar_bottom_bp_right
     (setq _lidar_bottom_bp_right (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _radar_front
     (setq _radar_front (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _radar_corner_front_left
     (setq _radar_corner_front_left (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _radar_corner_front_right
     (setq _radar_corner_front_right (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _radar_corner_rear_left
     (setq _radar_corner_rear_left (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _radar_corner_rear_right
     (setq _radar_corner_rear_right (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _camera_front_left
     (setq _camera_front_left (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _camera_front_right
     (setq _camera_front_right (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _camera_left_front
     (setq _camera_left_front (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _camera_left_rear
     (setq _camera_left_rear (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _camera_right_front
     (setq _camera_right_front (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _camera_right_rear
     (setq _camera_right_rear (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _camera_rear
     (setq _camera_rear (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gnss_ins
     (setq _gnss_ins (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _can_device
     (setq _can_device (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _v2x_device
     (setq _v2x_device (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _longitudinal_actuator
     (setq _longitudinal_actuator (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _lateral_actuator
     (setq _lateral_actuator (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _localization_state
     (setq _localization_state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _perception_state
     (setq _perception_state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _prediction_state
     (setq _prediction_state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _planning_state
     (setq _planning_state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _lateral_control_state
     (setq _lateral_control_state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _longitudinal_control_state
     (setq _longitudinal_control_state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get autohyu_msgs::ADState :md5sum-) "3c386ce2eaf4a126b64bd56805cf7d25")
(setf (get autohyu_msgs::ADState :datatype-) "autohyu_msgs/ADState")
(setf (get autohyu_msgs::ADState :definition-)
      "# std_msgs/Header
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



(provide :autohyu_msgs/ADState "3c386ce2eaf4a126b64bd56805cf7d25")


