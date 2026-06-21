// Auto-generated. Do not edit!

// (in-package autohyu_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ADState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.operation_mode = null;
      this.lateral_ad_mode = null;
      this.longitudinal_ad_mode = null;
      this.ad_level = null;
      this.mrm_type = null;
      this.left_sensors = null;
      this.right_sensors = null;
      this.front_sensors = null;
      this.rear_sensors = null;
      this.adk_1_sensors = null;
      this.adk_2_sensors = null;
      this.lidar_top_ruby = null;
      this.lidar_middle_m1_front = null;
      this.lidar_middle_m1_left = null;
      this.lidar_middle_m1_right = null;
      this.lidar_bottom_m1_front = null;
      this.lidar_bottom_m1_rear = null;
      this.lidar_bottom_bp_left = null;
      this.lidar_bottom_bp_right = null;
      this.radar_front = null;
      this.radar_corner_front_left = null;
      this.radar_corner_front_right = null;
      this.radar_corner_rear_left = null;
      this.radar_corner_rear_right = null;
      this.camera_front_left = null;
      this.camera_front_right = null;
      this.camera_left_front = null;
      this.camera_left_rear = null;
      this.camera_right_front = null;
      this.camera_right_rear = null;
      this.camera_rear = null;
      this.gnss_ins = null;
      this.can_device = null;
      this.v2x_device = null;
      this.longitudinal_actuator = null;
      this.lateral_actuator = null;
      this.localization_state = null;
      this.perception_state = null;
      this.prediction_state = null;
      this.planning_state = null;
      this.lateral_control_state = null;
      this.longitudinal_control_state = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('operation_mode')) {
        this.operation_mode = initObj.operation_mode
      }
      else {
        this.operation_mode = 0;
      }
      if (initObj.hasOwnProperty('lateral_ad_mode')) {
        this.lateral_ad_mode = initObj.lateral_ad_mode
      }
      else {
        this.lateral_ad_mode = 0;
      }
      if (initObj.hasOwnProperty('longitudinal_ad_mode')) {
        this.longitudinal_ad_mode = initObj.longitudinal_ad_mode
      }
      else {
        this.longitudinal_ad_mode = 0;
      }
      if (initObj.hasOwnProperty('ad_level')) {
        this.ad_level = initObj.ad_level
      }
      else {
        this.ad_level = 0;
      }
      if (initObj.hasOwnProperty('mrm_type')) {
        this.mrm_type = initObj.mrm_type
      }
      else {
        this.mrm_type = 0;
      }
      if (initObj.hasOwnProperty('left_sensors')) {
        this.left_sensors = initObj.left_sensors
      }
      else {
        this.left_sensors = 0;
      }
      if (initObj.hasOwnProperty('right_sensors')) {
        this.right_sensors = initObj.right_sensors
      }
      else {
        this.right_sensors = 0;
      }
      if (initObj.hasOwnProperty('front_sensors')) {
        this.front_sensors = initObj.front_sensors
      }
      else {
        this.front_sensors = 0;
      }
      if (initObj.hasOwnProperty('rear_sensors')) {
        this.rear_sensors = initObj.rear_sensors
      }
      else {
        this.rear_sensors = 0;
      }
      if (initObj.hasOwnProperty('adk_1_sensors')) {
        this.adk_1_sensors = initObj.adk_1_sensors
      }
      else {
        this.adk_1_sensors = 0;
      }
      if (initObj.hasOwnProperty('adk_2_sensors')) {
        this.adk_2_sensors = initObj.adk_2_sensors
      }
      else {
        this.adk_2_sensors = 0;
      }
      if (initObj.hasOwnProperty('lidar_top_ruby')) {
        this.lidar_top_ruby = initObj.lidar_top_ruby
      }
      else {
        this.lidar_top_ruby = 0;
      }
      if (initObj.hasOwnProperty('lidar_middle_m1_front')) {
        this.lidar_middle_m1_front = initObj.lidar_middle_m1_front
      }
      else {
        this.lidar_middle_m1_front = 0;
      }
      if (initObj.hasOwnProperty('lidar_middle_m1_left')) {
        this.lidar_middle_m1_left = initObj.lidar_middle_m1_left
      }
      else {
        this.lidar_middle_m1_left = 0;
      }
      if (initObj.hasOwnProperty('lidar_middle_m1_right')) {
        this.lidar_middle_m1_right = initObj.lidar_middle_m1_right
      }
      else {
        this.lidar_middle_m1_right = 0;
      }
      if (initObj.hasOwnProperty('lidar_bottom_m1_front')) {
        this.lidar_bottom_m1_front = initObj.lidar_bottom_m1_front
      }
      else {
        this.lidar_bottom_m1_front = 0;
      }
      if (initObj.hasOwnProperty('lidar_bottom_m1_rear')) {
        this.lidar_bottom_m1_rear = initObj.lidar_bottom_m1_rear
      }
      else {
        this.lidar_bottom_m1_rear = 0;
      }
      if (initObj.hasOwnProperty('lidar_bottom_bp_left')) {
        this.lidar_bottom_bp_left = initObj.lidar_bottom_bp_left
      }
      else {
        this.lidar_bottom_bp_left = 0;
      }
      if (initObj.hasOwnProperty('lidar_bottom_bp_right')) {
        this.lidar_bottom_bp_right = initObj.lidar_bottom_bp_right
      }
      else {
        this.lidar_bottom_bp_right = 0;
      }
      if (initObj.hasOwnProperty('radar_front')) {
        this.radar_front = initObj.radar_front
      }
      else {
        this.radar_front = 0;
      }
      if (initObj.hasOwnProperty('radar_corner_front_left')) {
        this.radar_corner_front_left = initObj.radar_corner_front_left
      }
      else {
        this.radar_corner_front_left = 0;
      }
      if (initObj.hasOwnProperty('radar_corner_front_right')) {
        this.radar_corner_front_right = initObj.radar_corner_front_right
      }
      else {
        this.radar_corner_front_right = 0;
      }
      if (initObj.hasOwnProperty('radar_corner_rear_left')) {
        this.radar_corner_rear_left = initObj.radar_corner_rear_left
      }
      else {
        this.radar_corner_rear_left = 0;
      }
      if (initObj.hasOwnProperty('radar_corner_rear_right')) {
        this.radar_corner_rear_right = initObj.radar_corner_rear_right
      }
      else {
        this.radar_corner_rear_right = 0;
      }
      if (initObj.hasOwnProperty('camera_front_left')) {
        this.camera_front_left = initObj.camera_front_left
      }
      else {
        this.camera_front_left = 0;
      }
      if (initObj.hasOwnProperty('camera_front_right')) {
        this.camera_front_right = initObj.camera_front_right
      }
      else {
        this.camera_front_right = 0;
      }
      if (initObj.hasOwnProperty('camera_left_front')) {
        this.camera_left_front = initObj.camera_left_front
      }
      else {
        this.camera_left_front = 0;
      }
      if (initObj.hasOwnProperty('camera_left_rear')) {
        this.camera_left_rear = initObj.camera_left_rear
      }
      else {
        this.camera_left_rear = 0;
      }
      if (initObj.hasOwnProperty('camera_right_front')) {
        this.camera_right_front = initObj.camera_right_front
      }
      else {
        this.camera_right_front = 0;
      }
      if (initObj.hasOwnProperty('camera_right_rear')) {
        this.camera_right_rear = initObj.camera_right_rear
      }
      else {
        this.camera_right_rear = 0;
      }
      if (initObj.hasOwnProperty('camera_rear')) {
        this.camera_rear = initObj.camera_rear
      }
      else {
        this.camera_rear = 0;
      }
      if (initObj.hasOwnProperty('gnss_ins')) {
        this.gnss_ins = initObj.gnss_ins
      }
      else {
        this.gnss_ins = 0;
      }
      if (initObj.hasOwnProperty('can_device')) {
        this.can_device = initObj.can_device
      }
      else {
        this.can_device = 0;
      }
      if (initObj.hasOwnProperty('v2x_device')) {
        this.v2x_device = initObj.v2x_device
      }
      else {
        this.v2x_device = 0;
      }
      if (initObj.hasOwnProperty('longitudinal_actuator')) {
        this.longitudinal_actuator = initObj.longitudinal_actuator
      }
      else {
        this.longitudinal_actuator = 0;
      }
      if (initObj.hasOwnProperty('lateral_actuator')) {
        this.lateral_actuator = initObj.lateral_actuator
      }
      else {
        this.lateral_actuator = 0;
      }
      if (initObj.hasOwnProperty('localization_state')) {
        this.localization_state = initObj.localization_state
      }
      else {
        this.localization_state = 0;
      }
      if (initObj.hasOwnProperty('perception_state')) {
        this.perception_state = initObj.perception_state
      }
      else {
        this.perception_state = 0;
      }
      if (initObj.hasOwnProperty('prediction_state')) {
        this.prediction_state = initObj.prediction_state
      }
      else {
        this.prediction_state = 0;
      }
      if (initObj.hasOwnProperty('planning_state')) {
        this.planning_state = initObj.planning_state
      }
      else {
        this.planning_state = 0;
      }
      if (initObj.hasOwnProperty('lateral_control_state')) {
        this.lateral_control_state = initObj.lateral_control_state
      }
      else {
        this.lateral_control_state = 0;
      }
      if (initObj.hasOwnProperty('longitudinal_control_state')) {
        this.longitudinal_control_state = initObj.longitudinal_control_state
      }
      else {
        this.longitudinal_control_state = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ADState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [operation_mode]
    bufferOffset = _serializer.uint8(obj.operation_mode, buffer, bufferOffset);
    // Serialize message field [lateral_ad_mode]
    bufferOffset = _serializer.uint8(obj.lateral_ad_mode, buffer, bufferOffset);
    // Serialize message field [longitudinal_ad_mode]
    bufferOffset = _serializer.uint8(obj.longitudinal_ad_mode, buffer, bufferOffset);
    // Serialize message field [ad_level]
    bufferOffset = _serializer.uint8(obj.ad_level, buffer, bufferOffset);
    // Serialize message field [mrm_type]
    bufferOffset = _serializer.uint8(obj.mrm_type, buffer, bufferOffset);
    // Serialize message field [left_sensors]
    bufferOffset = _serializer.uint8(obj.left_sensors, buffer, bufferOffset);
    // Serialize message field [right_sensors]
    bufferOffset = _serializer.uint8(obj.right_sensors, buffer, bufferOffset);
    // Serialize message field [front_sensors]
    bufferOffset = _serializer.uint8(obj.front_sensors, buffer, bufferOffset);
    // Serialize message field [rear_sensors]
    bufferOffset = _serializer.uint8(obj.rear_sensors, buffer, bufferOffset);
    // Serialize message field [adk_1_sensors]
    bufferOffset = _serializer.uint8(obj.adk_1_sensors, buffer, bufferOffset);
    // Serialize message field [adk_2_sensors]
    bufferOffset = _serializer.uint8(obj.adk_2_sensors, buffer, bufferOffset);
    // Serialize message field [lidar_top_ruby]
    bufferOffset = _serializer.uint8(obj.lidar_top_ruby, buffer, bufferOffset);
    // Serialize message field [lidar_middle_m1_front]
    bufferOffset = _serializer.uint8(obj.lidar_middle_m1_front, buffer, bufferOffset);
    // Serialize message field [lidar_middle_m1_left]
    bufferOffset = _serializer.uint8(obj.lidar_middle_m1_left, buffer, bufferOffset);
    // Serialize message field [lidar_middle_m1_right]
    bufferOffset = _serializer.uint8(obj.lidar_middle_m1_right, buffer, bufferOffset);
    // Serialize message field [lidar_bottom_m1_front]
    bufferOffset = _serializer.uint8(obj.lidar_bottom_m1_front, buffer, bufferOffset);
    // Serialize message field [lidar_bottom_m1_rear]
    bufferOffset = _serializer.uint8(obj.lidar_bottom_m1_rear, buffer, bufferOffset);
    // Serialize message field [lidar_bottom_bp_left]
    bufferOffset = _serializer.uint8(obj.lidar_bottom_bp_left, buffer, bufferOffset);
    // Serialize message field [lidar_bottom_bp_right]
    bufferOffset = _serializer.uint8(obj.lidar_bottom_bp_right, buffer, bufferOffset);
    // Serialize message field [radar_front]
    bufferOffset = _serializer.uint8(obj.radar_front, buffer, bufferOffset);
    // Serialize message field [radar_corner_front_left]
    bufferOffset = _serializer.uint8(obj.radar_corner_front_left, buffer, bufferOffset);
    // Serialize message field [radar_corner_front_right]
    bufferOffset = _serializer.uint8(obj.radar_corner_front_right, buffer, bufferOffset);
    // Serialize message field [radar_corner_rear_left]
    bufferOffset = _serializer.uint8(obj.radar_corner_rear_left, buffer, bufferOffset);
    // Serialize message field [radar_corner_rear_right]
    bufferOffset = _serializer.uint8(obj.radar_corner_rear_right, buffer, bufferOffset);
    // Serialize message field [camera_front_left]
    bufferOffset = _serializer.uint8(obj.camera_front_left, buffer, bufferOffset);
    // Serialize message field [camera_front_right]
    bufferOffset = _serializer.uint8(obj.camera_front_right, buffer, bufferOffset);
    // Serialize message field [camera_left_front]
    bufferOffset = _serializer.uint8(obj.camera_left_front, buffer, bufferOffset);
    // Serialize message field [camera_left_rear]
    bufferOffset = _serializer.uint8(obj.camera_left_rear, buffer, bufferOffset);
    // Serialize message field [camera_right_front]
    bufferOffset = _serializer.uint8(obj.camera_right_front, buffer, bufferOffset);
    // Serialize message field [camera_right_rear]
    bufferOffset = _serializer.uint8(obj.camera_right_rear, buffer, bufferOffset);
    // Serialize message field [camera_rear]
    bufferOffset = _serializer.uint8(obj.camera_rear, buffer, bufferOffset);
    // Serialize message field [gnss_ins]
    bufferOffset = _serializer.uint8(obj.gnss_ins, buffer, bufferOffset);
    // Serialize message field [can_device]
    bufferOffset = _serializer.uint8(obj.can_device, buffer, bufferOffset);
    // Serialize message field [v2x_device]
    bufferOffset = _serializer.uint8(obj.v2x_device, buffer, bufferOffset);
    // Serialize message field [longitudinal_actuator]
    bufferOffset = _serializer.uint8(obj.longitudinal_actuator, buffer, bufferOffset);
    // Serialize message field [lateral_actuator]
    bufferOffset = _serializer.uint8(obj.lateral_actuator, buffer, bufferOffset);
    // Serialize message field [localization_state]
    bufferOffset = _serializer.uint8(obj.localization_state, buffer, bufferOffset);
    // Serialize message field [perception_state]
    bufferOffset = _serializer.uint8(obj.perception_state, buffer, bufferOffset);
    // Serialize message field [prediction_state]
    bufferOffset = _serializer.uint8(obj.prediction_state, buffer, bufferOffset);
    // Serialize message field [planning_state]
    bufferOffset = _serializer.uint8(obj.planning_state, buffer, bufferOffset);
    // Serialize message field [lateral_control_state]
    bufferOffset = _serializer.uint8(obj.lateral_control_state, buffer, bufferOffset);
    // Serialize message field [longitudinal_control_state]
    bufferOffset = _serializer.uint8(obj.longitudinal_control_state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ADState
    let len;
    let data = new ADState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [operation_mode]
    data.operation_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [lateral_ad_mode]
    data.lateral_ad_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [longitudinal_ad_mode]
    data.longitudinal_ad_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [ad_level]
    data.ad_level = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [mrm_type]
    data.mrm_type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [left_sensors]
    data.left_sensors = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [right_sensors]
    data.right_sensors = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [front_sensors]
    data.front_sensors = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [rear_sensors]
    data.rear_sensors = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [adk_1_sensors]
    data.adk_1_sensors = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [adk_2_sensors]
    data.adk_2_sensors = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [lidar_top_ruby]
    data.lidar_top_ruby = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [lidar_middle_m1_front]
    data.lidar_middle_m1_front = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [lidar_middle_m1_left]
    data.lidar_middle_m1_left = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [lidar_middle_m1_right]
    data.lidar_middle_m1_right = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [lidar_bottom_m1_front]
    data.lidar_bottom_m1_front = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [lidar_bottom_m1_rear]
    data.lidar_bottom_m1_rear = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [lidar_bottom_bp_left]
    data.lidar_bottom_bp_left = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [lidar_bottom_bp_right]
    data.lidar_bottom_bp_right = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [radar_front]
    data.radar_front = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [radar_corner_front_left]
    data.radar_corner_front_left = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [radar_corner_front_right]
    data.radar_corner_front_right = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [radar_corner_rear_left]
    data.radar_corner_rear_left = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [radar_corner_rear_right]
    data.radar_corner_rear_right = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [camera_front_left]
    data.camera_front_left = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [camera_front_right]
    data.camera_front_right = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [camera_left_front]
    data.camera_left_front = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [camera_left_rear]
    data.camera_left_rear = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [camera_right_front]
    data.camera_right_front = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [camera_right_rear]
    data.camera_right_rear = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [camera_rear]
    data.camera_rear = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gnss_ins]
    data.gnss_ins = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [can_device]
    data.can_device = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [v2x_device]
    data.v2x_device = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [longitudinal_actuator]
    data.longitudinal_actuator = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [lateral_actuator]
    data.lateral_actuator = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [localization_state]
    data.localization_state = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [perception_state]
    data.perception_state = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [prediction_state]
    data.prediction_state = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [planning_state]
    data.planning_state = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [lateral_control_state]
    data.lateral_control_state = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [longitudinal_control_state]
    data.longitudinal_control_state = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 42;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/ADState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3c386ce2eaf4a126b64bd56805cf7d25';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ADState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.operation_mode !== undefined) {
      resolved.operation_mode = msg.operation_mode;
    }
    else {
      resolved.operation_mode = 0
    }

    if (msg.lateral_ad_mode !== undefined) {
      resolved.lateral_ad_mode = msg.lateral_ad_mode;
    }
    else {
      resolved.lateral_ad_mode = 0
    }

    if (msg.longitudinal_ad_mode !== undefined) {
      resolved.longitudinal_ad_mode = msg.longitudinal_ad_mode;
    }
    else {
      resolved.longitudinal_ad_mode = 0
    }

    if (msg.ad_level !== undefined) {
      resolved.ad_level = msg.ad_level;
    }
    else {
      resolved.ad_level = 0
    }

    if (msg.mrm_type !== undefined) {
      resolved.mrm_type = msg.mrm_type;
    }
    else {
      resolved.mrm_type = 0
    }

    if (msg.left_sensors !== undefined) {
      resolved.left_sensors = msg.left_sensors;
    }
    else {
      resolved.left_sensors = 0
    }

    if (msg.right_sensors !== undefined) {
      resolved.right_sensors = msg.right_sensors;
    }
    else {
      resolved.right_sensors = 0
    }

    if (msg.front_sensors !== undefined) {
      resolved.front_sensors = msg.front_sensors;
    }
    else {
      resolved.front_sensors = 0
    }

    if (msg.rear_sensors !== undefined) {
      resolved.rear_sensors = msg.rear_sensors;
    }
    else {
      resolved.rear_sensors = 0
    }

    if (msg.adk_1_sensors !== undefined) {
      resolved.adk_1_sensors = msg.adk_1_sensors;
    }
    else {
      resolved.adk_1_sensors = 0
    }

    if (msg.adk_2_sensors !== undefined) {
      resolved.adk_2_sensors = msg.adk_2_sensors;
    }
    else {
      resolved.adk_2_sensors = 0
    }

    if (msg.lidar_top_ruby !== undefined) {
      resolved.lidar_top_ruby = msg.lidar_top_ruby;
    }
    else {
      resolved.lidar_top_ruby = 0
    }

    if (msg.lidar_middle_m1_front !== undefined) {
      resolved.lidar_middle_m1_front = msg.lidar_middle_m1_front;
    }
    else {
      resolved.lidar_middle_m1_front = 0
    }

    if (msg.lidar_middle_m1_left !== undefined) {
      resolved.lidar_middle_m1_left = msg.lidar_middle_m1_left;
    }
    else {
      resolved.lidar_middle_m1_left = 0
    }

    if (msg.lidar_middle_m1_right !== undefined) {
      resolved.lidar_middle_m1_right = msg.lidar_middle_m1_right;
    }
    else {
      resolved.lidar_middle_m1_right = 0
    }

    if (msg.lidar_bottom_m1_front !== undefined) {
      resolved.lidar_bottom_m1_front = msg.lidar_bottom_m1_front;
    }
    else {
      resolved.lidar_bottom_m1_front = 0
    }

    if (msg.lidar_bottom_m1_rear !== undefined) {
      resolved.lidar_bottom_m1_rear = msg.lidar_bottom_m1_rear;
    }
    else {
      resolved.lidar_bottom_m1_rear = 0
    }

    if (msg.lidar_bottom_bp_left !== undefined) {
      resolved.lidar_bottom_bp_left = msg.lidar_bottom_bp_left;
    }
    else {
      resolved.lidar_bottom_bp_left = 0
    }

    if (msg.lidar_bottom_bp_right !== undefined) {
      resolved.lidar_bottom_bp_right = msg.lidar_bottom_bp_right;
    }
    else {
      resolved.lidar_bottom_bp_right = 0
    }

    if (msg.radar_front !== undefined) {
      resolved.radar_front = msg.radar_front;
    }
    else {
      resolved.radar_front = 0
    }

    if (msg.radar_corner_front_left !== undefined) {
      resolved.radar_corner_front_left = msg.radar_corner_front_left;
    }
    else {
      resolved.radar_corner_front_left = 0
    }

    if (msg.radar_corner_front_right !== undefined) {
      resolved.radar_corner_front_right = msg.radar_corner_front_right;
    }
    else {
      resolved.radar_corner_front_right = 0
    }

    if (msg.radar_corner_rear_left !== undefined) {
      resolved.radar_corner_rear_left = msg.radar_corner_rear_left;
    }
    else {
      resolved.radar_corner_rear_left = 0
    }

    if (msg.radar_corner_rear_right !== undefined) {
      resolved.radar_corner_rear_right = msg.radar_corner_rear_right;
    }
    else {
      resolved.radar_corner_rear_right = 0
    }

    if (msg.camera_front_left !== undefined) {
      resolved.camera_front_left = msg.camera_front_left;
    }
    else {
      resolved.camera_front_left = 0
    }

    if (msg.camera_front_right !== undefined) {
      resolved.camera_front_right = msg.camera_front_right;
    }
    else {
      resolved.camera_front_right = 0
    }

    if (msg.camera_left_front !== undefined) {
      resolved.camera_left_front = msg.camera_left_front;
    }
    else {
      resolved.camera_left_front = 0
    }

    if (msg.camera_left_rear !== undefined) {
      resolved.camera_left_rear = msg.camera_left_rear;
    }
    else {
      resolved.camera_left_rear = 0
    }

    if (msg.camera_right_front !== undefined) {
      resolved.camera_right_front = msg.camera_right_front;
    }
    else {
      resolved.camera_right_front = 0
    }

    if (msg.camera_right_rear !== undefined) {
      resolved.camera_right_rear = msg.camera_right_rear;
    }
    else {
      resolved.camera_right_rear = 0
    }

    if (msg.camera_rear !== undefined) {
      resolved.camera_rear = msg.camera_rear;
    }
    else {
      resolved.camera_rear = 0
    }

    if (msg.gnss_ins !== undefined) {
      resolved.gnss_ins = msg.gnss_ins;
    }
    else {
      resolved.gnss_ins = 0
    }

    if (msg.can_device !== undefined) {
      resolved.can_device = msg.can_device;
    }
    else {
      resolved.can_device = 0
    }

    if (msg.v2x_device !== undefined) {
      resolved.v2x_device = msg.v2x_device;
    }
    else {
      resolved.v2x_device = 0
    }

    if (msg.longitudinal_actuator !== undefined) {
      resolved.longitudinal_actuator = msg.longitudinal_actuator;
    }
    else {
      resolved.longitudinal_actuator = 0
    }

    if (msg.lateral_actuator !== undefined) {
      resolved.lateral_actuator = msg.lateral_actuator;
    }
    else {
      resolved.lateral_actuator = 0
    }

    if (msg.localization_state !== undefined) {
      resolved.localization_state = msg.localization_state;
    }
    else {
      resolved.localization_state = 0
    }

    if (msg.perception_state !== undefined) {
      resolved.perception_state = msg.perception_state;
    }
    else {
      resolved.perception_state = 0
    }

    if (msg.prediction_state !== undefined) {
      resolved.prediction_state = msg.prediction_state;
    }
    else {
      resolved.prediction_state = 0
    }

    if (msg.planning_state !== undefined) {
      resolved.planning_state = msg.planning_state;
    }
    else {
      resolved.planning_state = 0
    }

    if (msg.lateral_control_state !== undefined) {
      resolved.lateral_control_state = msg.lateral_control_state;
    }
    else {
      resolved.lateral_control_state = 0
    }

    if (msg.longitudinal_control_state !== undefined) {
      resolved.longitudinal_control_state = msg.longitudinal_control_state;
    }
    else {
      resolved.longitudinal_control_state = 0
    }

    return resolved;
    }
};

module.exports = ADState;
