// Auto-generated. Do not edit!

// (in-package autohyu_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let WGS84 = require('./WGS84.js');
let VehicleCAN = require('./VehicleCAN.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class VehicleState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.gnss = null;
      this.x = null;
      this.y = null;
      this.z = null;
      this.vx = null;
      this.vy = null;
      this.vz = null;
      this.ax = null;
      this.ay = null;
      this.az = null;
      this.roll = null;
      this.pitch = null;
      this.yaw = null;
      this.roll_vel = null;
      this.pitch_vel = null;
      this.yaw_vel = null;
      this.vehicle_can = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('gnss')) {
        this.gnss = initObj.gnss
      }
      else {
        this.gnss = new WGS84();
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = 0.0;
      }
      if (initObj.hasOwnProperty('vx')) {
        this.vx = initObj.vx
      }
      else {
        this.vx = 0.0;
      }
      if (initObj.hasOwnProperty('vy')) {
        this.vy = initObj.vy
      }
      else {
        this.vy = 0.0;
      }
      if (initObj.hasOwnProperty('vz')) {
        this.vz = initObj.vz
      }
      else {
        this.vz = 0.0;
      }
      if (initObj.hasOwnProperty('ax')) {
        this.ax = initObj.ax
      }
      else {
        this.ax = 0.0;
      }
      if (initObj.hasOwnProperty('ay')) {
        this.ay = initObj.ay
      }
      else {
        this.ay = 0.0;
      }
      if (initObj.hasOwnProperty('az')) {
        this.az = initObj.az
      }
      else {
        this.az = 0.0;
      }
      if (initObj.hasOwnProperty('roll')) {
        this.roll = initObj.roll
      }
      else {
        this.roll = 0.0;
      }
      if (initObj.hasOwnProperty('pitch')) {
        this.pitch = initObj.pitch
      }
      else {
        this.pitch = 0.0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
      if (initObj.hasOwnProperty('roll_vel')) {
        this.roll_vel = initObj.roll_vel
      }
      else {
        this.roll_vel = 0.0;
      }
      if (initObj.hasOwnProperty('pitch_vel')) {
        this.pitch_vel = initObj.pitch_vel
      }
      else {
        this.pitch_vel = 0.0;
      }
      if (initObj.hasOwnProperty('yaw_vel')) {
        this.yaw_vel = initObj.yaw_vel
      }
      else {
        this.yaw_vel = 0.0;
      }
      if (initObj.hasOwnProperty('vehicle_can')) {
        this.vehicle_can = initObj.vehicle_can
      }
      else {
        this.vehicle_can = new VehicleCAN();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VehicleState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [gnss]
    bufferOffset = WGS84.serialize(obj.gnss, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [z]
    bufferOffset = _serializer.float64(obj.z, buffer, bufferOffset);
    // Serialize message field [vx]
    bufferOffset = _serializer.float64(obj.vx, buffer, bufferOffset);
    // Serialize message field [vy]
    bufferOffset = _serializer.float64(obj.vy, buffer, bufferOffset);
    // Serialize message field [vz]
    bufferOffset = _serializer.float64(obj.vz, buffer, bufferOffset);
    // Serialize message field [ax]
    bufferOffset = _serializer.float64(obj.ax, buffer, bufferOffset);
    // Serialize message field [ay]
    bufferOffset = _serializer.float64(obj.ay, buffer, bufferOffset);
    // Serialize message field [az]
    bufferOffset = _serializer.float64(obj.az, buffer, bufferOffset);
    // Serialize message field [roll]
    bufferOffset = _serializer.float64(obj.roll, buffer, bufferOffset);
    // Serialize message field [pitch]
    bufferOffset = _serializer.float64(obj.pitch, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float64(obj.yaw, buffer, bufferOffset);
    // Serialize message field [roll_vel]
    bufferOffset = _serializer.float64(obj.roll_vel, buffer, bufferOffset);
    // Serialize message field [pitch_vel]
    bufferOffset = _serializer.float64(obj.pitch_vel, buffer, bufferOffset);
    // Serialize message field [yaw_vel]
    bufferOffset = _serializer.float64(obj.yaw_vel, buffer, bufferOffset);
    // Serialize message field [vehicle_can]
    bufferOffset = VehicleCAN.serialize(obj.vehicle_can, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VehicleState
    let len;
    let data = new VehicleState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [gnss]
    data.gnss = WGS84.deserialize(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [z]
    data.z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vx]
    data.vx = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vy]
    data.vy = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vz]
    data.vz = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ax]
    data.ax = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ay]
    data.ay = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [az]
    data.az = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [roll]
    data.roll = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pitch]
    data.pitch = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [roll_vel]
    data.roll_vel = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pitch_vel]
    data.pitch_vel = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yaw_vel]
    data.yaw_vel = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vehicle_can]
    data.vehicle_can = VehicleCAN.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += VehicleCAN.getMessageSize(object.vehicle_can);
    return length + 144;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/VehicleState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '82ceef6f5a703e2f0d1a7958db0b5bce';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VehicleState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.gnss !== undefined) {
      resolved.gnss = WGS84.Resolve(msg.gnss)
    }
    else {
      resolved.gnss = new WGS84()
    }

    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.z !== undefined) {
      resolved.z = msg.z;
    }
    else {
      resolved.z = 0.0
    }

    if (msg.vx !== undefined) {
      resolved.vx = msg.vx;
    }
    else {
      resolved.vx = 0.0
    }

    if (msg.vy !== undefined) {
      resolved.vy = msg.vy;
    }
    else {
      resolved.vy = 0.0
    }

    if (msg.vz !== undefined) {
      resolved.vz = msg.vz;
    }
    else {
      resolved.vz = 0.0
    }

    if (msg.ax !== undefined) {
      resolved.ax = msg.ax;
    }
    else {
      resolved.ax = 0.0
    }

    if (msg.ay !== undefined) {
      resolved.ay = msg.ay;
    }
    else {
      resolved.ay = 0.0
    }

    if (msg.az !== undefined) {
      resolved.az = msg.az;
    }
    else {
      resolved.az = 0.0
    }

    if (msg.roll !== undefined) {
      resolved.roll = msg.roll;
    }
    else {
      resolved.roll = 0.0
    }

    if (msg.pitch !== undefined) {
      resolved.pitch = msg.pitch;
    }
    else {
      resolved.pitch = 0.0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    if (msg.roll_vel !== undefined) {
      resolved.roll_vel = msg.roll_vel;
    }
    else {
      resolved.roll_vel = 0.0
    }

    if (msg.pitch_vel !== undefined) {
      resolved.pitch_vel = msg.pitch_vel;
    }
    else {
      resolved.pitch_vel = 0.0
    }

    if (msg.yaw_vel !== undefined) {
      resolved.yaw_vel = msg.yaw_vel;
    }
    else {
      resolved.yaw_vel = 0.0
    }

    if (msg.vehicle_can !== undefined) {
      resolved.vehicle_can = VehicleCAN.Resolve(msg.vehicle_can)
    }
    else {
      resolved.vehicle_can = new VehicleCAN()
    }

    return resolved;
    }
};

module.exports = VehicleState;
