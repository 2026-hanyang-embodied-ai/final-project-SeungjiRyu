// Auto-generated. Do not edit!

// (in-package autohyu_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let VehicleState = require('./VehicleState.js');
let Trajectory = require('./Trajectory.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ControlInputOutput {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.vehicle_state = null;
      this.trajectory = null;
      this.command_steer = null;
      this.command_accel_pedal = null;
      this.command_brake_pedal = null;
      this.command_speed = null;
      this.command_acceleration = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('vehicle_state')) {
        this.vehicle_state = initObj.vehicle_state
      }
      else {
        this.vehicle_state = new VehicleState();
      }
      if (initObj.hasOwnProperty('trajectory')) {
        this.trajectory = initObj.trajectory
      }
      else {
        this.trajectory = new Trajectory();
      }
      if (initObj.hasOwnProperty('command_steer')) {
        this.command_steer = initObj.command_steer
      }
      else {
        this.command_steer = [];
      }
      if (initObj.hasOwnProperty('command_accel_pedal')) {
        this.command_accel_pedal = initObj.command_accel_pedal
      }
      else {
        this.command_accel_pedal = [];
      }
      if (initObj.hasOwnProperty('command_brake_pedal')) {
        this.command_brake_pedal = initObj.command_brake_pedal
      }
      else {
        this.command_brake_pedal = [];
      }
      if (initObj.hasOwnProperty('command_speed')) {
        this.command_speed = initObj.command_speed
      }
      else {
        this.command_speed = [];
      }
      if (initObj.hasOwnProperty('command_acceleration')) {
        this.command_acceleration = initObj.command_acceleration
      }
      else {
        this.command_acceleration = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ControlInputOutput
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [vehicle_state]
    bufferOffset = VehicleState.serialize(obj.vehicle_state, buffer, bufferOffset);
    // Serialize message field [trajectory]
    bufferOffset = Trajectory.serialize(obj.trajectory, buffer, bufferOffset);
    // Serialize message field [command_steer]
    bufferOffset = _arraySerializer.float32(obj.command_steer, buffer, bufferOffset, null);
    // Serialize message field [command_accel_pedal]
    bufferOffset = _arraySerializer.float32(obj.command_accel_pedal, buffer, bufferOffset, null);
    // Serialize message field [command_brake_pedal]
    bufferOffset = _arraySerializer.float32(obj.command_brake_pedal, buffer, bufferOffset, null);
    // Serialize message field [command_speed]
    bufferOffset = _arraySerializer.float32(obj.command_speed, buffer, bufferOffset, null);
    // Serialize message field [command_acceleration]
    bufferOffset = _arraySerializer.float32(obj.command_acceleration, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ControlInputOutput
    let len;
    let data = new ControlInputOutput(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [vehicle_state]
    data.vehicle_state = VehicleState.deserialize(buffer, bufferOffset);
    // Deserialize message field [trajectory]
    data.trajectory = Trajectory.deserialize(buffer, bufferOffset);
    // Deserialize message field [command_steer]
    data.command_steer = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [command_accel_pedal]
    data.command_accel_pedal = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [command_brake_pedal]
    data.command_brake_pedal = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [command_speed]
    data.command_speed = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [command_acceleration]
    data.command_acceleration = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += VehicleState.getMessageSize(object.vehicle_state);
    length += Trajectory.getMessageSize(object.trajectory);
    length += 4 * object.command_steer.length;
    length += 4 * object.command_accel_pedal.length;
    length += 4 * object.command_brake_pedal.length;
    length += 4 * object.command_speed.length;
    length += 4 * object.command_acceleration.length;
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/ControlInputOutput';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3ea3f7b2097ca95368fcfd5f0afbc535';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ControlInputOutput(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.vehicle_state !== undefined) {
      resolved.vehicle_state = VehicleState.Resolve(msg.vehicle_state)
    }
    else {
      resolved.vehicle_state = new VehicleState()
    }

    if (msg.trajectory !== undefined) {
      resolved.trajectory = Trajectory.Resolve(msg.trajectory)
    }
    else {
      resolved.trajectory = new Trajectory()
    }

    if (msg.command_steer !== undefined) {
      resolved.command_steer = msg.command_steer;
    }
    else {
      resolved.command_steer = []
    }

    if (msg.command_accel_pedal !== undefined) {
      resolved.command_accel_pedal = msg.command_accel_pedal;
    }
    else {
      resolved.command_accel_pedal = []
    }

    if (msg.command_brake_pedal !== undefined) {
      resolved.command_brake_pedal = msg.command_brake_pedal;
    }
    else {
      resolved.command_brake_pedal = []
    }

    if (msg.command_speed !== undefined) {
      resolved.command_speed = msg.command_speed;
    }
    else {
      resolved.command_speed = []
    }

    if (msg.command_acceleration !== undefined) {
      resolved.command_acceleration = msg.command_acceleration;
    }
    else {
      resolved.command_acceleration = []
    }

    return resolved;
    }
};

module.exports = ControlInputOutput;
