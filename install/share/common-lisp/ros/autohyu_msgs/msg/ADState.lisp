; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude ADState.msg.html

(cl:defclass <ADState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
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
    :initform 0)
   (ad_level
    :reader ad_level
    :initarg :ad_level
    :type cl:fixnum
    :initform 0)
   (mrm_type
    :reader mrm_type
    :initarg :mrm_type
    :type cl:fixnum
    :initform 0)
   (left_sensors
    :reader left_sensors
    :initarg :left_sensors
    :type cl:fixnum
    :initform 0)
   (right_sensors
    :reader right_sensors
    :initarg :right_sensors
    :type cl:fixnum
    :initform 0)
   (front_sensors
    :reader front_sensors
    :initarg :front_sensors
    :type cl:fixnum
    :initform 0)
   (rear_sensors
    :reader rear_sensors
    :initarg :rear_sensors
    :type cl:fixnum
    :initform 0)
   (adk_1_sensors
    :reader adk_1_sensors
    :initarg :adk_1_sensors
    :type cl:fixnum
    :initform 0)
   (adk_2_sensors
    :reader adk_2_sensors
    :initarg :adk_2_sensors
    :type cl:fixnum
    :initform 0)
   (lidar_top_ruby
    :reader lidar_top_ruby
    :initarg :lidar_top_ruby
    :type cl:fixnum
    :initform 0)
   (lidar_middle_m1_front
    :reader lidar_middle_m1_front
    :initarg :lidar_middle_m1_front
    :type cl:fixnum
    :initform 0)
   (lidar_middle_m1_left
    :reader lidar_middle_m1_left
    :initarg :lidar_middle_m1_left
    :type cl:fixnum
    :initform 0)
   (lidar_middle_m1_right
    :reader lidar_middle_m1_right
    :initarg :lidar_middle_m1_right
    :type cl:fixnum
    :initform 0)
   (lidar_bottom_m1_front
    :reader lidar_bottom_m1_front
    :initarg :lidar_bottom_m1_front
    :type cl:fixnum
    :initform 0)
   (lidar_bottom_m1_rear
    :reader lidar_bottom_m1_rear
    :initarg :lidar_bottom_m1_rear
    :type cl:fixnum
    :initform 0)
   (lidar_bottom_bp_left
    :reader lidar_bottom_bp_left
    :initarg :lidar_bottom_bp_left
    :type cl:fixnum
    :initform 0)
   (lidar_bottom_bp_right
    :reader lidar_bottom_bp_right
    :initarg :lidar_bottom_bp_right
    :type cl:fixnum
    :initform 0)
   (radar_front
    :reader radar_front
    :initarg :radar_front
    :type cl:fixnum
    :initform 0)
   (radar_corner_front_left
    :reader radar_corner_front_left
    :initarg :radar_corner_front_left
    :type cl:fixnum
    :initform 0)
   (radar_corner_front_right
    :reader radar_corner_front_right
    :initarg :radar_corner_front_right
    :type cl:fixnum
    :initform 0)
   (radar_corner_rear_left
    :reader radar_corner_rear_left
    :initarg :radar_corner_rear_left
    :type cl:fixnum
    :initform 0)
   (radar_corner_rear_right
    :reader radar_corner_rear_right
    :initarg :radar_corner_rear_right
    :type cl:fixnum
    :initform 0)
   (camera_front_left
    :reader camera_front_left
    :initarg :camera_front_left
    :type cl:fixnum
    :initform 0)
   (camera_front_right
    :reader camera_front_right
    :initarg :camera_front_right
    :type cl:fixnum
    :initform 0)
   (camera_left_front
    :reader camera_left_front
    :initarg :camera_left_front
    :type cl:fixnum
    :initform 0)
   (camera_left_rear
    :reader camera_left_rear
    :initarg :camera_left_rear
    :type cl:fixnum
    :initform 0)
   (camera_right_front
    :reader camera_right_front
    :initarg :camera_right_front
    :type cl:fixnum
    :initform 0)
   (camera_right_rear
    :reader camera_right_rear
    :initarg :camera_right_rear
    :type cl:fixnum
    :initform 0)
   (camera_rear
    :reader camera_rear
    :initarg :camera_rear
    :type cl:fixnum
    :initform 0)
   (gnss_ins
    :reader gnss_ins
    :initarg :gnss_ins
    :type cl:fixnum
    :initform 0)
   (can_device
    :reader can_device
    :initarg :can_device
    :type cl:fixnum
    :initform 0)
   (v2x_device
    :reader v2x_device
    :initarg :v2x_device
    :type cl:fixnum
    :initform 0)
   (longitudinal_actuator
    :reader longitudinal_actuator
    :initarg :longitudinal_actuator
    :type cl:fixnum
    :initform 0)
   (lateral_actuator
    :reader lateral_actuator
    :initarg :lateral_actuator
    :type cl:fixnum
    :initform 0)
   (localization_state
    :reader localization_state
    :initarg :localization_state
    :type cl:fixnum
    :initform 0)
   (perception_state
    :reader perception_state
    :initarg :perception_state
    :type cl:fixnum
    :initform 0)
   (prediction_state
    :reader prediction_state
    :initarg :prediction_state
    :type cl:fixnum
    :initform 0)
   (planning_state
    :reader planning_state
    :initarg :planning_state
    :type cl:fixnum
    :initform 0)
   (lateral_control_state
    :reader lateral_control_state
    :initarg :lateral_control_state
    :type cl:fixnum
    :initform 0)
   (longitudinal_control_state
    :reader longitudinal_control_state
    :initarg :longitudinal_control_state
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ADState (<ADState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ADState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ADState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<ADState> is deprecated: use autohyu_msgs-msg:ADState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:header-val is deprecated.  Use autohyu_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'operation_mode-val :lambda-list '(m))
(cl:defmethod operation_mode-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:operation_mode-val is deprecated.  Use autohyu_msgs-msg:operation_mode instead.")
  (operation_mode m))

(cl:ensure-generic-function 'lateral_ad_mode-val :lambda-list '(m))
(cl:defmethod lateral_ad_mode-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:lateral_ad_mode-val is deprecated.  Use autohyu_msgs-msg:lateral_ad_mode instead.")
  (lateral_ad_mode m))

(cl:ensure-generic-function 'longitudinal_ad_mode-val :lambda-list '(m))
(cl:defmethod longitudinal_ad_mode-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:longitudinal_ad_mode-val is deprecated.  Use autohyu_msgs-msg:longitudinal_ad_mode instead.")
  (longitudinal_ad_mode m))

(cl:ensure-generic-function 'ad_level-val :lambda-list '(m))
(cl:defmethod ad_level-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:ad_level-val is deprecated.  Use autohyu_msgs-msg:ad_level instead.")
  (ad_level m))

(cl:ensure-generic-function 'mrm_type-val :lambda-list '(m))
(cl:defmethod mrm_type-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:mrm_type-val is deprecated.  Use autohyu_msgs-msg:mrm_type instead.")
  (mrm_type m))

(cl:ensure-generic-function 'left_sensors-val :lambda-list '(m))
(cl:defmethod left_sensors-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:left_sensors-val is deprecated.  Use autohyu_msgs-msg:left_sensors instead.")
  (left_sensors m))

(cl:ensure-generic-function 'right_sensors-val :lambda-list '(m))
(cl:defmethod right_sensors-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:right_sensors-val is deprecated.  Use autohyu_msgs-msg:right_sensors instead.")
  (right_sensors m))

(cl:ensure-generic-function 'front_sensors-val :lambda-list '(m))
(cl:defmethod front_sensors-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:front_sensors-val is deprecated.  Use autohyu_msgs-msg:front_sensors instead.")
  (front_sensors m))

(cl:ensure-generic-function 'rear_sensors-val :lambda-list '(m))
(cl:defmethod rear_sensors-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:rear_sensors-val is deprecated.  Use autohyu_msgs-msg:rear_sensors instead.")
  (rear_sensors m))

(cl:ensure-generic-function 'adk_1_sensors-val :lambda-list '(m))
(cl:defmethod adk_1_sensors-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:adk_1_sensors-val is deprecated.  Use autohyu_msgs-msg:adk_1_sensors instead.")
  (adk_1_sensors m))

(cl:ensure-generic-function 'adk_2_sensors-val :lambda-list '(m))
(cl:defmethod adk_2_sensors-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:adk_2_sensors-val is deprecated.  Use autohyu_msgs-msg:adk_2_sensors instead.")
  (adk_2_sensors m))

(cl:ensure-generic-function 'lidar_top_ruby-val :lambda-list '(m))
(cl:defmethod lidar_top_ruby-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:lidar_top_ruby-val is deprecated.  Use autohyu_msgs-msg:lidar_top_ruby instead.")
  (lidar_top_ruby m))

(cl:ensure-generic-function 'lidar_middle_m1_front-val :lambda-list '(m))
(cl:defmethod lidar_middle_m1_front-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:lidar_middle_m1_front-val is deprecated.  Use autohyu_msgs-msg:lidar_middle_m1_front instead.")
  (lidar_middle_m1_front m))

(cl:ensure-generic-function 'lidar_middle_m1_left-val :lambda-list '(m))
(cl:defmethod lidar_middle_m1_left-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:lidar_middle_m1_left-val is deprecated.  Use autohyu_msgs-msg:lidar_middle_m1_left instead.")
  (lidar_middle_m1_left m))

(cl:ensure-generic-function 'lidar_middle_m1_right-val :lambda-list '(m))
(cl:defmethod lidar_middle_m1_right-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:lidar_middle_m1_right-val is deprecated.  Use autohyu_msgs-msg:lidar_middle_m1_right instead.")
  (lidar_middle_m1_right m))

(cl:ensure-generic-function 'lidar_bottom_m1_front-val :lambda-list '(m))
(cl:defmethod lidar_bottom_m1_front-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:lidar_bottom_m1_front-val is deprecated.  Use autohyu_msgs-msg:lidar_bottom_m1_front instead.")
  (lidar_bottom_m1_front m))

(cl:ensure-generic-function 'lidar_bottom_m1_rear-val :lambda-list '(m))
(cl:defmethod lidar_bottom_m1_rear-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:lidar_bottom_m1_rear-val is deprecated.  Use autohyu_msgs-msg:lidar_bottom_m1_rear instead.")
  (lidar_bottom_m1_rear m))

(cl:ensure-generic-function 'lidar_bottom_bp_left-val :lambda-list '(m))
(cl:defmethod lidar_bottom_bp_left-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:lidar_bottom_bp_left-val is deprecated.  Use autohyu_msgs-msg:lidar_bottom_bp_left instead.")
  (lidar_bottom_bp_left m))

(cl:ensure-generic-function 'lidar_bottom_bp_right-val :lambda-list '(m))
(cl:defmethod lidar_bottom_bp_right-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:lidar_bottom_bp_right-val is deprecated.  Use autohyu_msgs-msg:lidar_bottom_bp_right instead.")
  (lidar_bottom_bp_right m))

(cl:ensure-generic-function 'radar_front-val :lambda-list '(m))
(cl:defmethod radar_front-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:radar_front-val is deprecated.  Use autohyu_msgs-msg:radar_front instead.")
  (radar_front m))

(cl:ensure-generic-function 'radar_corner_front_left-val :lambda-list '(m))
(cl:defmethod radar_corner_front_left-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:radar_corner_front_left-val is deprecated.  Use autohyu_msgs-msg:radar_corner_front_left instead.")
  (radar_corner_front_left m))

(cl:ensure-generic-function 'radar_corner_front_right-val :lambda-list '(m))
(cl:defmethod radar_corner_front_right-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:radar_corner_front_right-val is deprecated.  Use autohyu_msgs-msg:radar_corner_front_right instead.")
  (radar_corner_front_right m))

(cl:ensure-generic-function 'radar_corner_rear_left-val :lambda-list '(m))
(cl:defmethod radar_corner_rear_left-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:radar_corner_rear_left-val is deprecated.  Use autohyu_msgs-msg:radar_corner_rear_left instead.")
  (radar_corner_rear_left m))

(cl:ensure-generic-function 'radar_corner_rear_right-val :lambda-list '(m))
(cl:defmethod radar_corner_rear_right-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:radar_corner_rear_right-val is deprecated.  Use autohyu_msgs-msg:radar_corner_rear_right instead.")
  (radar_corner_rear_right m))

(cl:ensure-generic-function 'camera_front_left-val :lambda-list '(m))
(cl:defmethod camera_front_left-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:camera_front_left-val is deprecated.  Use autohyu_msgs-msg:camera_front_left instead.")
  (camera_front_left m))

(cl:ensure-generic-function 'camera_front_right-val :lambda-list '(m))
(cl:defmethod camera_front_right-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:camera_front_right-val is deprecated.  Use autohyu_msgs-msg:camera_front_right instead.")
  (camera_front_right m))

(cl:ensure-generic-function 'camera_left_front-val :lambda-list '(m))
(cl:defmethod camera_left_front-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:camera_left_front-val is deprecated.  Use autohyu_msgs-msg:camera_left_front instead.")
  (camera_left_front m))

(cl:ensure-generic-function 'camera_left_rear-val :lambda-list '(m))
(cl:defmethod camera_left_rear-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:camera_left_rear-val is deprecated.  Use autohyu_msgs-msg:camera_left_rear instead.")
  (camera_left_rear m))

(cl:ensure-generic-function 'camera_right_front-val :lambda-list '(m))
(cl:defmethod camera_right_front-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:camera_right_front-val is deprecated.  Use autohyu_msgs-msg:camera_right_front instead.")
  (camera_right_front m))

(cl:ensure-generic-function 'camera_right_rear-val :lambda-list '(m))
(cl:defmethod camera_right_rear-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:camera_right_rear-val is deprecated.  Use autohyu_msgs-msg:camera_right_rear instead.")
  (camera_right_rear m))

(cl:ensure-generic-function 'camera_rear-val :lambda-list '(m))
(cl:defmethod camera_rear-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:camera_rear-val is deprecated.  Use autohyu_msgs-msg:camera_rear instead.")
  (camera_rear m))

(cl:ensure-generic-function 'gnss_ins-val :lambda-list '(m))
(cl:defmethod gnss_ins-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:gnss_ins-val is deprecated.  Use autohyu_msgs-msg:gnss_ins instead.")
  (gnss_ins m))

(cl:ensure-generic-function 'can_device-val :lambda-list '(m))
(cl:defmethod can_device-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:can_device-val is deprecated.  Use autohyu_msgs-msg:can_device instead.")
  (can_device m))

(cl:ensure-generic-function 'v2x_device-val :lambda-list '(m))
(cl:defmethod v2x_device-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:v2x_device-val is deprecated.  Use autohyu_msgs-msg:v2x_device instead.")
  (v2x_device m))

(cl:ensure-generic-function 'longitudinal_actuator-val :lambda-list '(m))
(cl:defmethod longitudinal_actuator-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:longitudinal_actuator-val is deprecated.  Use autohyu_msgs-msg:longitudinal_actuator instead.")
  (longitudinal_actuator m))

(cl:ensure-generic-function 'lateral_actuator-val :lambda-list '(m))
(cl:defmethod lateral_actuator-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:lateral_actuator-val is deprecated.  Use autohyu_msgs-msg:lateral_actuator instead.")
  (lateral_actuator m))

(cl:ensure-generic-function 'localization_state-val :lambda-list '(m))
(cl:defmethod localization_state-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:localization_state-val is deprecated.  Use autohyu_msgs-msg:localization_state instead.")
  (localization_state m))

(cl:ensure-generic-function 'perception_state-val :lambda-list '(m))
(cl:defmethod perception_state-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:perception_state-val is deprecated.  Use autohyu_msgs-msg:perception_state instead.")
  (perception_state m))

(cl:ensure-generic-function 'prediction_state-val :lambda-list '(m))
(cl:defmethod prediction_state-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:prediction_state-val is deprecated.  Use autohyu_msgs-msg:prediction_state instead.")
  (prediction_state m))

(cl:ensure-generic-function 'planning_state-val :lambda-list '(m))
(cl:defmethod planning_state-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:planning_state-val is deprecated.  Use autohyu_msgs-msg:planning_state instead.")
  (planning_state m))

(cl:ensure-generic-function 'lateral_control_state-val :lambda-list '(m))
(cl:defmethod lateral_control_state-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:lateral_control_state-val is deprecated.  Use autohyu_msgs-msg:lateral_control_state instead.")
  (lateral_control_state m))

(cl:ensure-generic-function 'longitudinal_control_state-val :lambda-list '(m))
(cl:defmethod longitudinal_control_state-val ((m <ADState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:longitudinal_control_state-val is deprecated.  Use autohyu_msgs-msg:longitudinal_control_state instead.")
  (longitudinal_control_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ADState>) ostream)
  "Serializes a message object of type '<ADState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'operation_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lateral_ad_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'longitudinal_ad_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ad_level)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mrm_type)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'left_sensors)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'right_sensors)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'front_sensors)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rear_sensors)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'adk_1_sensors)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'adk_2_sensors)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lidar_top_ruby)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lidar_middle_m1_front)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lidar_middle_m1_left)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lidar_middle_m1_right)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lidar_bottom_m1_front)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lidar_bottom_m1_rear)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lidar_bottom_bp_left)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lidar_bottom_bp_right)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radar_front)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radar_corner_front_left)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radar_corner_front_right)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radar_corner_rear_left)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radar_corner_rear_right)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'camera_front_left)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'camera_front_right)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'camera_left_front)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'camera_left_rear)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'camera_right_front)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'camera_right_rear)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'camera_rear)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gnss_ins)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'can_device)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'v2x_device)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'longitudinal_actuator)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lateral_actuator)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'localization_state)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'perception_state)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'prediction_state)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'planning_state)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lateral_control_state)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'longitudinal_control_state)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ADState>) istream)
  "Deserializes a message object of type '<ADState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'operation_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lateral_ad_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'longitudinal_ad_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ad_level)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mrm_type)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'left_sensors)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'right_sensors)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'front_sensors)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rear_sensors)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'adk_1_sensors)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'adk_2_sensors)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lidar_top_ruby)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lidar_middle_m1_front)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lidar_middle_m1_left)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lidar_middle_m1_right)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lidar_bottom_m1_front)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lidar_bottom_m1_rear)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lidar_bottom_bp_left)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lidar_bottom_bp_right)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radar_front)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radar_corner_front_left)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radar_corner_front_right)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radar_corner_rear_left)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radar_corner_rear_right)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'camera_front_left)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'camera_front_right)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'camera_left_front)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'camera_left_rear)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'camera_right_front)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'camera_right_rear)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'camera_rear)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gnss_ins)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'can_device)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'v2x_device)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'longitudinal_actuator)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lateral_actuator)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'localization_state)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'perception_state)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'prediction_state)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'planning_state)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lateral_control_state)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'longitudinal_control_state)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ADState>)))
  "Returns string type for a message object of type '<ADState>"
  "autohyu_msgs/ADState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ADState)))
  "Returns string type for a message object of type 'ADState"
  "autohyu_msgs/ADState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ADState>)))
  "Returns md5sum for a message object of type '<ADState>"
  "3c386ce2eaf4a126b64bd56805cf7d25")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ADState)))
  "Returns md5sum for a message object of type 'ADState"
  "3c386ce2eaf4a126b64bd56805cf7d25")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ADState>)))
  "Returns full string definition for message of type '<ADState>"
  (cl:format cl:nil "# std_msgs/Header~%std_msgs/Header header~%~%# AD Mode~%uint8 operation_mode~%uint8 lateral_ad_mode~%uint8 longitudinal_ad_mode~%uint8 ad_level~%uint8 mrm_type~%~%# Sensor state~%uint8 left_sensors~%uint8 right_sensors~%uint8 front_sensors~%uint8 rear_sensors~%uint8 adk_1_sensors~%uint8 adk_2_sensors~%~%uint8 lidar_top_ruby~%uint8 lidar_middle_m1_front~%uint8 lidar_middle_m1_left~%uint8 lidar_middle_m1_right~%uint8 lidar_bottom_m1_front~%uint8 lidar_bottom_m1_rear~%uint8 lidar_bottom_bp_left~%uint8 lidar_bottom_bp_right~%~%uint8 radar_front~%uint8 radar_corner_front_left~%uint8 radar_corner_front_right~%uint8 radar_corner_rear_left~%uint8 radar_corner_rear_right~%~%uint8 camera_front_left~%uint8 camera_front_right~%uint8 camera_left_front~%uint8 camera_left_rear~%uint8 camera_right_front~%uint8 camera_right_rear~%uint8 camera_rear~%~%uint8 gnss_ins~%uint8 can_device~%uint8 v2x_device~%~%# Actuator state~%uint8 longitudinal_actuator~%uint8 lateral_actuator~%~%# SWC State~%uint8 localization_state~%uint8 perception_state~%uint8 prediction_state~%uint8 planning_state~%uint8 lateral_control_state~%uint8 longitudinal_control_state~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ADState)))
  "Returns full string definition for message of type 'ADState"
  (cl:format cl:nil "# std_msgs/Header~%std_msgs/Header header~%~%# AD Mode~%uint8 operation_mode~%uint8 lateral_ad_mode~%uint8 longitudinal_ad_mode~%uint8 ad_level~%uint8 mrm_type~%~%# Sensor state~%uint8 left_sensors~%uint8 right_sensors~%uint8 front_sensors~%uint8 rear_sensors~%uint8 adk_1_sensors~%uint8 adk_2_sensors~%~%uint8 lidar_top_ruby~%uint8 lidar_middle_m1_front~%uint8 lidar_middle_m1_left~%uint8 lidar_middle_m1_right~%uint8 lidar_bottom_m1_front~%uint8 lidar_bottom_m1_rear~%uint8 lidar_bottom_bp_left~%uint8 lidar_bottom_bp_right~%~%uint8 radar_front~%uint8 radar_corner_front_left~%uint8 radar_corner_front_right~%uint8 radar_corner_rear_left~%uint8 radar_corner_rear_right~%~%uint8 camera_front_left~%uint8 camera_front_right~%uint8 camera_left_front~%uint8 camera_left_rear~%uint8 camera_right_front~%uint8 camera_right_rear~%uint8 camera_rear~%~%uint8 gnss_ins~%uint8 can_device~%uint8 v2x_device~%~%# Actuator state~%uint8 longitudinal_actuator~%uint8 lateral_actuator~%~%# SWC State~%uint8 localization_state~%uint8 perception_state~%uint8 prediction_state~%uint8 planning_state~%uint8 lateral_control_state~%uint8 longitudinal_control_state~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ADState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
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
     1
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ADState>))
  "Converts a ROS message object to a list"
  (cl:list 'ADState
    (cl:cons ':header (header msg))
    (cl:cons ':operation_mode (operation_mode msg))
    (cl:cons ':lateral_ad_mode (lateral_ad_mode msg))
    (cl:cons ':longitudinal_ad_mode (longitudinal_ad_mode msg))
    (cl:cons ':ad_level (ad_level msg))
    (cl:cons ':mrm_type (mrm_type msg))
    (cl:cons ':left_sensors (left_sensors msg))
    (cl:cons ':right_sensors (right_sensors msg))
    (cl:cons ':front_sensors (front_sensors msg))
    (cl:cons ':rear_sensors (rear_sensors msg))
    (cl:cons ':adk_1_sensors (adk_1_sensors msg))
    (cl:cons ':adk_2_sensors (adk_2_sensors msg))
    (cl:cons ':lidar_top_ruby (lidar_top_ruby msg))
    (cl:cons ':lidar_middle_m1_front (lidar_middle_m1_front msg))
    (cl:cons ':lidar_middle_m1_left (lidar_middle_m1_left msg))
    (cl:cons ':lidar_middle_m1_right (lidar_middle_m1_right msg))
    (cl:cons ':lidar_bottom_m1_front (lidar_bottom_m1_front msg))
    (cl:cons ':lidar_bottom_m1_rear (lidar_bottom_m1_rear msg))
    (cl:cons ':lidar_bottom_bp_left (lidar_bottom_bp_left msg))
    (cl:cons ':lidar_bottom_bp_right (lidar_bottom_bp_right msg))
    (cl:cons ':radar_front (radar_front msg))
    (cl:cons ':radar_corner_front_left (radar_corner_front_left msg))
    (cl:cons ':radar_corner_front_right (radar_corner_front_right msg))
    (cl:cons ':radar_corner_rear_left (radar_corner_rear_left msg))
    (cl:cons ':radar_corner_rear_right (radar_corner_rear_right msg))
    (cl:cons ':camera_front_left (camera_front_left msg))
    (cl:cons ':camera_front_right (camera_front_right msg))
    (cl:cons ':camera_left_front (camera_left_front msg))
    (cl:cons ':camera_left_rear (camera_left_rear msg))
    (cl:cons ':camera_right_front (camera_right_front msg))
    (cl:cons ':camera_right_rear (camera_right_rear msg))
    (cl:cons ':camera_rear (camera_rear msg))
    (cl:cons ':gnss_ins (gnss_ins msg))
    (cl:cons ':can_device (can_device msg))
    (cl:cons ':v2x_device (v2x_device msg))
    (cl:cons ':longitudinal_actuator (longitudinal_actuator msg))
    (cl:cons ':lateral_actuator (lateral_actuator msg))
    (cl:cons ':localization_state (localization_state msg))
    (cl:cons ':perception_state (perception_state msg))
    (cl:cons ':prediction_state (prediction_state msg))
    (cl:cons ':planning_state (planning_state msg))
    (cl:cons ':lateral_control_state (lateral_control_state msg))
    (cl:cons ':longitudinal_control_state (longitudinal_control_state msg))
))
