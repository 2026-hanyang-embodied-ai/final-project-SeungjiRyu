// Auto-generated. Do not edit!

// (in-package autohyu_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let TemporalTrajectoryPoint = require('./TemporalTrajectoryPoint.js');

//-----------------------------------------------------------

class TemporalTrajectory {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.point = null;
    }
    else {
      if (initObj.hasOwnProperty('point')) {
        this.point = initObj.point
      }
      else {
        this.point = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TemporalTrajectory
    // Serialize message field [point]
    // Serialize the length for message field [point]
    bufferOffset = _serializer.uint32(obj.point.length, buffer, bufferOffset);
    obj.point.forEach((val) => {
      bufferOffset = TemporalTrajectoryPoint.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TemporalTrajectory
    let len;
    let data = new TemporalTrajectory(null);
    // Deserialize message field [point]
    // Deserialize array length for message field [point]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.point = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.point[i] = TemporalTrajectoryPoint.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 20 * object.point.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/TemporalTrajectory';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8d4a1cb0de0a51e983f65281b57bfd76';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    autohyu_msgs/TemporalTrajectoryPoint[] point
    ================================================================================
    MSG: autohyu_msgs/TemporalTrajectoryPoint
    float32 time
    float32 distance
    float32 curvature
    float32 speed
    float32 ref_speed
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TemporalTrajectory(null);
    if (msg.point !== undefined) {
      resolved.point = new Array(msg.point.length);
      for (let i = 0; i < resolved.point.length; ++i) {
        resolved.point[i] = TemporalTrajectoryPoint.Resolve(msg.point[i]);
      }
    }
    else {
      resolved.point = []
    }

    return resolved;
    }
};

module.exports = TemporalTrajectory;
