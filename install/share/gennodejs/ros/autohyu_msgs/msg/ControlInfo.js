// Auto-generated. Do not edit!

// (in-package autohyu_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ControlInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cross_track_error = null;
      this.yaw_error = null;
      this.speed_error = null;
      this.target_speed = null;
      this.current_speed = null;
      this.opt_cost = null;
      this.opt_time = null;
      this.solve_time = null;
      this.total_time = null;
      this.sqp_iter = null;
      this.qp_iter = null;
    }
    else {
      if (initObj.hasOwnProperty('cross_track_error')) {
        this.cross_track_error = initObj.cross_track_error
      }
      else {
        this.cross_track_error = 0.0;
      }
      if (initObj.hasOwnProperty('yaw_error')) {
        this.yaw_error = initObj.yaw_error
      }
      else {
        this.yaw_error = 0.0;
      }
      if (initObj.hasOwnProperty('speed_error')) {
        this.speed_error = initObj.speed_error
      }
      else {
        this.speed_error = 0.0;
      }
      if (initObj.hasOwnProperty('target_speed')) {
        this.target_speed = initObj.target_speed
      }
      else {
        this.target_speed = 0.0;
      }
      if (initObj.hasOwnProperty('current_speed')) {
        this.current_speed = initObj.current_speed
      }
      else {
        this.current_speed = 0.0;
      }
      if (initObj.hasOwnProperty('opt_cost')) {
        this.opt_cost = initObj.opt_cost
      }
      else {
        this.opt_cost = 0.0;
      }
      if (initObj.hasOwnProperty('opt_time')) {
        this.opt_time = initObj.opt_time
      }
      else {
        this.opt_time = 0.0;
      }
      if (initObj.hasOwnProperty('solve_time')) {
        this.solve_time = initObj.solve_time
      }
      else {
        this.solve_time = 0.0;
      }
      if (initObj.hasOwnProperty('total_time')) {
        this.total_time = initObj.total_time
      }
      else {
        this.total_time = 0.0;
      }
      if (initObj.hasOwnProperty('sqp_iter')) {
        this.sqp_iter = initObj.sqp_iter
      }
      else {
        this.sqp_iter = 0.0;
      }
      if (initObj.hasOwnProperty('qp_iter')) {
        this.qp_iter = initObj.qp_iter
      }
      else {
        this.qp_iter = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ControlInfo
    // Serialize message field [cross_track_error]
    bufferOffset = _serializer.float64(obj.cross_track_error, buffer, bufferOffset);
    // Serialize message field [yaw_error]
    bufferOffset = _serializer.float64(obj.yaw_error, buffer, bufferOffset);
    // Serialize message field [speed_error]
    bufferOffset = _serializer.float64(obj.speed_error, buffer, bufferOffset);
    // Serialize message field [target_speed]
    bufferOffset = _serializer.float64(obj.target_speed, buffer, bufferOffset);
    // Serialize message field [current_speed]
    bufferOffset = _serializer.float64(obj.current_speed, buffer, bufferOffset);
    // Serialize message field [opt_cost]
    bufferOffset = _serializer.float64(obj.opt_cost, buffer, bufferOffset);
    // Serialize message field [opt_time]
    bufferOffset = _serializer.float64(obj.opt_time, buffer, bufferOffset);
    // Serialize message field [solve_time]
    bufferOffset = _serializer.float64(obj.solve_time, buffer, bufferOffset);
    // Serialize message field [total_time]
    bufferOffset = _serializer.float64(obj.total_time, buffer, bufferOffset);
    // Serialize message field [sqp_iter]
    bufferOffset = _serializer.float64(obj.sqp_iter, buffer, bufferOffset);
    // Serialize message field [qp_iter]
    bufferOffset = _serializer.float64(obj.qp_iter, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ControlInfo
    let len;
    let data = new ControlInfo(null);
    // Deserialize message field [cross_track_error]
    data.cross_track_error = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yaw_error]
    data.yaw_error = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [speed_error]
    data.speed_error = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [target_speed]
    data.target_speed = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [current_speed]
    data.current_speed = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [opt_cost]
    data.opt_cost = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [opt_time]
    data.opt_time = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [solve_time]
    data.solve_time = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [total_time]
    data.total_time = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [sqp_iter]
    data.sqp_iter = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [qp_iter]
    data.qp_iter = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 88;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/ControlInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '30f8ded77960efce2e4f59447134a078';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 cross_track_error
    float64 yaw_error
    float64 speed_error
    float64 target_speed
    float64 current_speed
    float64 opt_cost
    float64 opt_time
    float64 solve_time
    float64 total_time
    float64 sqp_iter
    float64 qp_iter
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ControlInfo(null);
    if (msg.cross_track_error !== undefined) {
      resolved.cross_track_error = msg.cross_track_error;
    }
    else {
      resolved.cross_track_error = 0.0
    }

    if (msg.yaw_error !== undefined) {
      resolved.yaw_error = msg.yaw_error;
    }
    else {
      resolved.yaw_error = 0.0
    }

    if (msg.speed_error !== undefined) {
      resolved.speed_error = msg.speed_error;
    }
    else {
      resolved.speed_error = 0.0
    }

    if (msg.target_speed !== undefined) {
      resolved.target_speed = msg.target_speed;
    }
    else {
      resolved.target_speed = 0.0
    }

    if (msg.current_speed !== undefined) {
      resolved.current_speed = msg.current_speed;
    }
    else {
      resolved.current_speed = 0.0
    }

    if (msg.opt_cost !== undefined) {
      resolved.opt_cost = msg.opt_cost;
    }
    else {
      resolved.opt_cost = 0.0
    }

    if (msg.opt_time !== undefined) {
      resolved.opt_time = msg.opt_time;
    }
    else {
      resolved.opt_time = 0.0
    }

    if (msg.solve_time !== undefined) {
      resolved.solve_time = msg.solve_time;
    }
    else {
      resolved.solve_time = 0.0
    }

    if (msg.total_time !== undefined) {
      resolved.total_time = msg.total_time;
    }
    else {
      resolved.total_time = 0.0
    }

    if (msg.sqp_iter !== undefined) {
      resolved.sqp_iter = msg.sqp_iter;
    }
    else {
      resolved.sqp_iter = 0.0
    }

    if (msg.qp_iter !== undefined) {
      resolved.qp_iter = msg.qp_iter;
    }
    else {
      resolved.qp_iter = 0.0
    }

    return resolved;
    }
};

module.exports = ControlInfo;
