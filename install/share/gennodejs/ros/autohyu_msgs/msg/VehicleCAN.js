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

class VehicleCAN {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.wheel_speed_fl = null;
      this.wheel_speed_fr = null;
      this.wheel_speed_rl = null;
      this.wheel_speed_rr = null;
      this.vehicle_speed = null;
      this.lateral_accel = null;
      this.longitudinal_accel = null;
      this.yaw_rate = null;
      this.steering_torque = null;
      this.steering_angle = null;
      this.steering_tire_angle = null;
      this.accel_pedal_position = null;
      this.brake_pressure = null;
      this.cruise_main_status = null;
      this.cruise_switch_status = null;
      this.gear_status = null;
      this.auto_status = null;
      this.steering_override = null;
      this.acceleration_override = null;
      this.brake_override = null;
      this.sw_estop = null;
      this.mdps_act_error = null;
      this.epb_status = null;
      this.gear_display = null;
      this.left_turn_signal = null;
      this.right_turn_signal = null;
      this.hazard_lamp_status = null;
      this.kecu_cnt = null;
      this.power_state = null;
      this.power_MRMdrivingTime = null;
      this.power_main_current = null;
      this.power_sub_current = null;
      this.power_main_voltage = null;
      this.power_sub_voltage = null;
      this.steering_state = null;
      this.operation_mode = null;
      this.lateral_ad_mode = null;
      this.longitudinal_ad_mode = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('wheel_speed_fl')) {
        this.wheel_speed_fl = initObj.wheel_speed_fl
      }
      else {
        this.wheel_speed_fl = 0.0;
      }
      if (initObj.hasOwnProperty('wheel_speed_fr')) {
        this.wheel_speed_fr = initObj.wheel_speed_fr
      }
      else {
        this.wheel_speed_fr = 0.0;
      }
      if (initObj.hasOwnProperty('wheel_speed_rl')) {
        this.wheel_speed_rl = initObj.wheel_speed_rl
      }
      else {
        this.wheel_speed_rl = 0.0;
      }
      if (initObj.hasOwnProperty('wheel_speed_rr')) {
        this.wheel_speed_rr = initObj.wheel_speed_rr
      }
      else {
        this.wheel_speed_rr = 0.0;
      }
      if (initObj.hasOwnProperty('vehicle_speed')) {
        this.vehicle_speed = initObj.vehicle_speed
      }
      else {
        this.vehicle_speed = 0;
      }
      if (initObj.hasOwnProperty('lateral_accel')) {
        this.lateral_accel = initObj.lateral_accel
      }
      else {
        this.lateral_accel = 0.0;
      }
      if (initObj.hasOwnProperty('longitudinal_accel')) {
        this.longitudinal_accel = initObj.longitudinal_accel
      }
      else {
        this.longitudinal_accel = 0.0;
      }
      if (initObj.hasOwnProperty('yaw_rate')) {
        this.yaw_rate = initObj.yaw_rate
      }
      else {
        this.yaw_rate = 0.0;
      }
      if (initObj.hasOwnProperty('steering_torque')) {
        this.steering_torque = initObj.steering_torque
      }
      else {
        this.steering_torque = 0.0;
      }
      if (initObj.hasOwnProperty('steering_angle')) {
        this.steering_angle = initObj.steering_angle
      }
      else {
        this.steering_angle = 0.0;
      }
      if (initObj.hasOwnProperty('steering_tire_angle')) {
        this.steering_tire_angle = initObj.steering_tire_angle
      }
      else {
        this.steering_tire_angle = 0.0;
      }
      if (initObj.hasOwnProperty('accel_pedal_position')) {
        this.accel_pedal_position = initObj.accel_pedal_position
      }
      else {
        this.accel_pedal_position = 0.0;
      }
      if (initObj.hasOwnProperty('brake_pressure')) {
        this.brake_pressure = initObj.brake_pressure
      }
      else {
        this.brake_pressure = 0.0;
      }
      if (initObj.hasOwnProperty('cruise_main_status')) {
        this.cruise_main_status = initObj.cruise_main_status
      }
      else {
        this.cruise_main_status = 0;
      }
      if (initObj.hasOwnProperty('cruise_switch_status')) {
        this.cruise_switch_status = initObj.cruise_switch_status
      }
      else {
        this.cruise_switch_status = 0;
      }
      if (initObj.hasOwnProperty('gear_status')) {
        this.gear_status = initObj.gear_status
      }
      else {
        this.gear_status = 0;
      }
      if (initObj.hasOwnProperty('auto_status')) {
        this.auto_status = initObj.auto_status
      }
      else {
        this.auto_status = 0;
      }
      if (initObj.hasOwnProperty('steering_override')) {
        this.steering_override = initObj.steering_override
      }
      else {
        this.steering_override = 0;
      }
      if (initObj.hasOwnProperty('acceleration_override')) {
        this.acceleration_override = initObj.acceleration_override
      }
      else {
        this.acceleration_override = 0;
      }
      if (initObj.hasOwnProperty('brake_override')) {
        this.brake_override = initObj.brake_override
      }
      else {
        this.brake_override = 0;
      }
      if (initObj.hasOwnProperty('sw_estop')) {
        this.sw_estop = initObj.sw_estop
      }
      else {
        this.sw_estop = 0;
      }
      if (initObj.hasOwnProperty('mdps_act_error')) {
        this.mdps_act_error = initObj.mdps_act_error
      }
      else {
        this.mdps_act_error = 0;
      }
      if (initObj.hasOwnProperty('epb_status')) {
        this.epb_status = initObj.epb_status
      }
      else {
        this.epb_status = 0;
      }
      if (initObj.hasOwnProperty('gear_display')) {
        this.gear_display = initObj.gear_display
      }
      else {
        this.gear_display = 0;
      }
      if (initObj.hasOwnProperty('left_turn_signal')) {
        this.left_turn_signal = initObj.left_turn_signal
      }
      else {
        this.left_turn_signal = 0;
      }
      if (initObj.hasOwnProperty('right_turn_signal')) {
        this.right_turn_signal = initObj.right_turn_signal
      }
      else {
        this.right_turn_signal = 0;
      }
      if (initObj.hasOwnProperty('hazard_lamp_status')) {
        this.hazard_lamp_status = initObj.hazard_lamp_status
      }
      else {
        this.hazard_lamp_status = 0;
      }
      if (initObj.hasOwnProperty('kecu_cnt')) {
        this.kecu_cnt = initObj.kecu_cnt
      }
      else {
        this.kecu_cnt = 0;
      }
      if (initObj.hasOwnProperty('power_state')) {
        this.power_state = initObj.power_state
      }
      else {
        this.power_state = 0;
      }
      if (initObj.hasOwnProperty('power_MRMdrivingTime')) {
        this.power_MRMdrivingTime = initObj.power_MRMdrivingTime
      }
      else {
        this.power_MRMdrivingTime = 0;
      }
      if (initObj.hasOwnProperty('power_main_current')) {
        this.power_main_current = initObj.power_main_current
      }
      else {
        this.power_main_current = 0.0;
      }
      if (initObj.hasOwnProperty('power_sub_current')) {
        this.power_sub_current = initObj.power_sub_current
      }
      else {
        this.power_sub_current = 0.0;
      }
      if (initObj.hasOwnProperty('power_main_voltage')) {
        this.power_main_voltage = initObj.power_main_voltage
      }
      else {
        this.power_main_voltage = 0.0;
      }
      if (initObj.hasOwnProperty('power_sub_voltage')) {
        this.power_sub_voltage = initObj.power_sub_voltage
      }
      else {
        this.power_sub_voltage = 0.0;
      }
      if (initObj.hasOwnProperty('steering_state')) {
        this.steering_state = initObj.steering_state
      }
      else {
        this.steering_state = 0;
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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VehicleCAN
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [wheel_speed_fl]
    bufferOffset = _serializer.float64(obj.wheel_speed_fl, buffer, bufferOffset);
    // Serialize message field [wheel_speed_fr]
    bufferOffset = _serializer.float64(obj.wheel_speed_fr, buffer, bufferOffset);
    // Serialize message field [wheel_speed_rl]
    bufferOffset = _serializer.float64(obj.wheel_speed_rl, buffer, bufferOffset);
    // Serialize message field [wheel_speed_rr]
    bufferOffset = _serializer.float64(obj.wheel_speed_rr, buffer, bufferOffset);
    // Serialize message field [vehicle_speed]
    bufferOffset = _serializer.uint16(obj.vehicle_speed, buffer, bufferOffset);
    // Serialize message field [lateral_accel]
    bufferOffset = _serializer.float64(obj.lateral_accel, buffer, bufferOffset);
    // Serialize message field [longitudinal_accel]
    bufferOffset = _serializer.float64(obj.longitudinal_accel, buffer, bufferOffset);
    // Serialize message field [yaw_rate]
    bufferOffset = _serializer.float64(obj.yaw_rate, buffer, bufferOffset);
    // Serialize message field [steering_torque]
    bufferOffset = _serializer.float64(obj.steering_torque, buffer, bufferOffset);
    // Serialize message field [steering_angle]
    bufferOffset = _serializer.float64(obj.steering_angle, buffer, bufferOffset);
    // Serialize message field [steering_tire_angle]
    bufferOffset = _serializer.float64(obj.steering_tire_angle, buffer, bufferOffset);
    // Serialize message field [accel_pedal_position]
    bufferOffset = _serializer.float64(obj.accel_pedal_position, buffer, bufferOffset);
    // Serialize message field [brake_pressure]
    bufferOffset = _serializer.float64(obj.brake_pressure, buffer, bufferOffset);
    // Serialize message field [cruise_main_status]
    bufferOffset = _serializer.uint8(obj.cruise_main_status, buffer, bufferOffset);
    // Serialize message field [cruise_switch_status]
    bufferOffset = _serializer.uint8(obj.cruise_switch_status, buffer, bufferOffset);
    // Serialize message field [gear_status]
    bufferOffset = _serializer.uint8(obj.gear_status, buffer, bufferOffset);
    // Serialize message field [auto_status]
    bufferOffset = _serializer.uint8(obj.auto_status, buffer, bufferOffset);
    // Serialize message field [steering_override]
    bufferOffset = _serializer.uint8(obj.steering_override, buffer, bufferOffset);
    // Serialize message field [acceleration_override]
    bufferOffset = _serializer.uint8(obj.acceleration_override, buffer, bufferOffset);
    // Serialize message field [brake_override]
    bufferOffset = _serializer.uint8(obj.brake_override, buffer, bufferOffset);
    // Serialize message field [sw_estop]
    bufferOffset = _serializer.uint8(obj.sw_estop, buffer, bufferOffset);
    // Serialize message field [mdps_act_error]
    bufferOffset = _serializer.uint8(obj.mdps_act_error, buffer, bufferOffset);
    // Serialize message field [epb_status]
    bufferOffset = _serializer.uint8(obj.epb_status, buffer, bufferOffset);
    // Serialize message field [gear_display]
    bufferOffset = _serializer.uint8(obj.gear_display, buffer, bufferOffset);
    // Serialize message field [left_turn_signal]
    bufferOffset = _serializer.uint8(obj.left_turn_signal, buffer, bufferOffset);
    // Serialize message field [right_turn_signal]
    bufferOffset = _serializer.uint8(obj.right_turn_signal, buffer, bufferOffset);
    // Serialize message field [hazard_lamp_status]
    bufferOffset = _serializer.uint8(obj.hazard_lamp_status, buffer, bufferOffset);
    // Serialize message field [kecu_cnt]
    bufferOffset = _serializer.uint8(obj.kecu_cnt, buffer, bufferOffset);
    // Serialize message field [power_state]
    bufferOffset = _serializer.uint8(obj.power_state, buffer, bufferOffset);
    // Serialize message field [power_MRMdrivingTime]
    bufferOffset = _serializer.uint8(obj.power_MRMdrivingTime, buffer, bufferOffset);
    // Serialize message field [power_main_current]
    bufferOffset = _serializer.float64(obj.power_main_current, buffer, bufferOffset);
    // Serialize message field [power_sub_current]
    bufferOffset = _serializer.float64(obj.power_sub_current, buffer, bufferOffset);
    // Serialize message field [power_main_voltage]
    bufferOffset = _serializer.float64(obj.power_main_voltage, buffer, bufferOffset);
    // Serialize message field [power_sub_voltage]
    bufferOffset = _serializer.float64(obj.power_sub_voltage, buffer, bufferOffset);
    // Serialize message field [steering_state]
    bufferOffset = _serializer.uint8(obj.steering_state, buffer, bufferOffset);
    // Serialize message field [operation_mode]
    bufferOffset = _serializer.uint8(obj.operation_mode, buffer, bufferOffset);
    // Serialize message field [lateral_ad_mode]
    bufferOffset = _serializer.uint8(obj.lateral_ad_mode, buffer, bufferOffset);
    // Serialize message field [longitudinal_ad_mode]
    bufferOffset = _serializer.uint8(obj.longitudinal_ad_mode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VehicleCAN
    let len;
    let data = new VehicleCAN(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [wheel_speed_fl]
    data.wheel_speed_fl = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wheel_speed_fr]
    data.wheel_speed_fr = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wheel_speed_rl]
    data.wheel_speed_rl = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wheel_speed_rr]
    data.wheel_speed_rr = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vehicle_speed]
    data.vehicle_speed = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [lateral_accel]
    data.lateral_accel = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [longitudinal_accel]
    data.longitudinal_accel = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yaw_rate]
    data.yaw_rate = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [steering_torque]
    data.steering_torque = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [steering_angle]
    data.steering_angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [steering_tire_angle]
    data.steering_tire_angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [accel_pedal_position]
    data.accel_pedal_position = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [brake_pressure]
    data.brake_pressure = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [cruise_main_status]
    data.cruise_main_status = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [cruise_switch_status]
    data.cruise_switch_status = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gear_status]
    data.gear_status = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [auto_status]
    data.auto_status = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [steering_override]
    data.steering_override = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [acceleration_override]
    data.acceleration_override = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [brake_override]
    data.brake_override = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [sw_estop]
    data.sw_estop = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [mdps_act_error]
    data.mdps_act_error = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [epb_status]
    data.epb_status = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gear_display]
    data.gear_display = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [left_turn_signal]
    data.left_turn_signal = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [right_turn_signal]
    data.right_turn_signal = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [hazard_lamp_status]
    data.hazard_lamp_status = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [kecu_cnt]
    data.kecu_cnt = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [power_state]
    data.power_state = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [power_MRMdrivingTime]
    data.power_MRMdrivingTime = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [power_main_current]
    data.power_main_current = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [power_sub_current]
    data.power_sub_current = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [power_main_voltage]
    data.power_main_voltage = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [power_sub_voltage]
    data.power_sub_voltage = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [steering_state]
    data.steering_state = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [operation_mode]
    data.operation_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [lateral_ad_mode]
    data.lateral_ad_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [longitudinal_ad_mode]
    data.longitudinal_ad_mode = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 151;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/VehicleCAN';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ce768e61bd6f2c0239a3b3e0a9963e4d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new VehicleCAN(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.wheel_speed_fl !== undefined) {
      resolved.wheel_speed_fl = msg.wheel_speed_fl;
    }
    else {
      resolved.wheel_speed_fl = 0.0
    }

    if (msg.wheel_speed_fr !== undefined) {
      resolved.wheel_speed_fr = msg.wheel_speed_fr;
    }
    else {
      resolved.wheel_speed_fr = 0.0
    }

    if (msg.wheel_speed_rl !== undefined) {
      resolved.wheel_speed_rl = msg.wheel_speed_rl;
    }
    else {
      resolved.wheel_speed_rl = 0.0
    }

    if (msg.wheel_speed_rr !== undefined) {
      resolved.wheel_speed_rr = msg.wheel_speed_rr;
    }
    else {
      resolved.wheel_speed_rr = 0.0
    }

    if (msg.vehicle_speed !== undefined) {
      resolved.vehicle_speed = msg.vehicle_speed;
    }
    else {
      resolved.vehicle_speed = 0
    }

    if (msg.lateral_accel !== undefined) {
      resolved.lateral_accel = msg.lateral_accel;
    }
    else {
      resolved.lateral_accel = 0.0
    }

    if (msg.longitudinal_accel !== undefined) {
      resolved.longitudinal_accel = msg.longitudinal_accel;
    }
    else {
      resolved.longitudinal_accel = 0.0
    }

    if (msg.yaw_rate !== undefined) {
      resolved.yaw_rate = msg.yaw_rate;
    }
    else {
      resolved.yaw_rate = 0.0
    }

    if (msg.steering_torque !== undefined) {
      resolved.steering_torque = msg.steering_torque;
    }
    else {
      resolved.steering_torque = 0.0
    }

    if (msg.steering_angle !== undefined) {
      resolved.steering_angle = msg.steering_angle;
    }
    else {
      resolved.steering_angle = 0.0
    }

    if (msg.steering_tire_angle !== undefined) {
      resolved.steering_tire_angle = msg.steering_tire_angle;
    }
    else {
      resolved.steering_tire_angle = 0.0
    }

    if (msg.accel_pedal_position !== undefined) {
      resolved.accel_pedal_position = msg.accel_pedal_position;
    }
    else {
      resolved.accel_pedal_position = 0.0
    }

    if (msg.brake_pressure !== undefined) {
      resolved.brake_pressure = msg.brake_pressure;
    }
    else {
      resolved.brake_pressure = 0.0
    }

    if (msg.cruise_main_status !== undefined) {
      resolved.cruise_main_status = msg.cruise_main_status;
    }
    else {
      resolved.cruise_main_status = 0
    }

    if (msg.cruise_switch_status !== undefined) {
      resolved.cruise_switch_status = msg.cruise_switch_status;
    }
    else {
      resolved.cruise_switch_status = 0
    }

    if (msg.gear_status !== undefined) {
      resolved.gear_status = msg.gear_status;
    }
    else {
      resolved.gear_status = 0
    }

    if (msg.auto_status !== undefined) {
      resolved.auto_status = msg.auto_status;
    }
    else {
      resolved.auto_status = 0
    }

    if (msg.steering_override !== undefined) {
      resolved.steering_override = msg.steering_override;
    }
    else {
      resolved.steering_override = 0
    }

    if (msg.acceleration_override !== undefined) {
      resolved.acceleration_override = msg.acceleration_override;
    }
    else {
      resolved.acceleration_override = 0
    }

    if (msg.brake_override !== undefined) {
      resolved.brake_override = msg.brake_override;
    }
    else {
      resolved.brake_override = 0
    }

    if (msg.sw_estop !== undefined) {
      resolved.sw_estop = msg.sw_estop;
    }
    else {
      resolved.sw_estop = 0
    }

    if (msg.mdps_act_error !== undefined) {
      resolved.mdps_act_error = msg.mdps_act_error;
    }
    else {
      resolved.mdps_act_error = 0
    }

    if (msg.epb_status !== undefined) {
      resolved.epb_status = msg.epb_status;
    }
    else {
      resolved.epb_status = 0
    }

    if (msg.gear_display !== undefined) {
      resolved.gear_display = msg.gear_display;
    }
    else {
      resolved.gear_display = 0
    }

    if (msg.left_turn_signal !== undefined) {
      resolved.left_turn_signal = msg.left_turn_signal;
    }
    else {
      resolved.left_turn_signal = 0
    }

    if (msg.right_turn_signal !== undefined) {
      resolved.right_turn_signal = msg.right_turn_signal;
    }
    else {
      resolved.right_turn_signal = 0
    }

    if (msg.hazard_lamp_status !== undefined) {
      resolved.hazard_lamp_status = msg.hazard_lamp_status;
    }
    else {
      resolved.hazard_lamp_status = 0
    }

    if (msg.kecu_cnt !== undefined) {
      resolved.kecu_cnt = msg.kecu_cnt;
    }
    else {
      resolved.kecu_cnt = 0
    }

    if (msg.power_state !== undefined) {
      resolved.power_state = msg.power_state;
    }
    else {
      resolved.power_state = 0
    }

    if (msg.power_MRMdrivingTime !== undefined) {
      resolved.power_MRMdrivingTime = msg.power_MRMdrivingTime;
    }
    else {
      resolved.power_MRMdrivingTime = 0
    }

    if (msg.power_main_current !== undefined) {
      resolved.power_main_current = msg.power_main_current;
    }
    else {
      resolved.power_main_current = 0.0
    }

    if (msg.power_sub_current !== undefined) {
      resolved.power_sub_current = msg.power_sub_current;
    }
    else {
      resolved.power_sub_current = 0.0
    }

    if (msg.power_main_voltage !== undefined) {
      resolved.power_main_voltage = msg.power_main_voltage;
    }
    else {
      resolved.power_main_voltage = 0.0
    }

    if (msg.power_sub_voltage !== undefined) {
      resolved.power_sub_voltage = msg.power_sub_voltage;
    }
    else {
      resolved.power_sub_voltage = 0.0
    }

    if (msg.steering_state !== undefined) {
      resolved.steering_state = msg.steering_state;
    }
    else {
      resolved.steering_state = 0
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

    return resolved;
    }
};

module.exports = VehicleCAN;
