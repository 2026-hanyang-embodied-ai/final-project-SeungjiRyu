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

class SpatialTrajectoryPoint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.z = null;
      this.on_shortest_path = null;
      this.lane_num = null;
    }
    else {
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
      if (initObj.hasOwnProperty('on_shortest_path')) {
        this.on_shortest_path = initObj.on_shortest_path
      }
      else {
        this.on_shortest_path = false;
      }
      if (initObj.hasOwnProperty('lane_num')) {
        this.lane_num = initObj.lane_num
      }
      else {
        this.lane_num = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SpatialTrajectoryPoint
    // Serialize message field [x]
    bufferOffset = _serializer.float32(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float32(obj.y, buffer, bufferOffset);
    // Serialize message field [z]
    bufferOffset = _serializer.float32(obj.z, buffer, bufferOffset);
    // Serialize message field [on_shortest_path]
    bufferOffset = _serializer.bool(obj.on_shortest_path, buffer, bufferOffset);
    // Serialize message field [lane_num]
    bufferOffset = _serializer.int16(obj.lane_num, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SpatialTrajectoryPoint
    let len;
    let data = new SpatialTrajectoryPoint(null);
    // Deserialize message field [x]
    data.x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [z]
    data.z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [on_shortest_path]
    data.on_shortest_path = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [lane_num]
    data.lane_num = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 15;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/SpatialTrajectoryPoint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '49797d301bc91d0456d52eb2d842a6b1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 x
    float32 y
    float32 z
    bool on_shortest_path
    int16 lane_num
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SpatialTrajectoryPoint(null);
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

    if (msg.on_shortest_path !== undefined) {
      resolved.on_shortest_path = msg.on_shortest_path;
    }
    else {
      resolved.on_shortest_path = false
    }

    if (msg.lane_num !== undefined) {
      resolved.lane_num = msg.lane_num;
    }
    else {
      resolved.lane_num = 0
    }

    return resolved;
    }
};

module.exports = SpatialTrajectoryPoint;
