// Auto-generated. Do not edit!

// (in-package autohyu_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let TrajectoryBoundaryPoint = require('./TrajectoryBoundaryPoint.js');

//-----------------------------------------------------------

class TrajectoryBoundary {
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
    // Serializes a message object of type TrajectoryBoundary
    // Serialize message field [point]
    // Serialize the length for message field [point]
    bufferOffset = _serializer.uint32(obj.point.length, buffer, bufferOffset);
    obj.point.forEach((val) => {
      bufferOffset = TrajectoryBoundaryPoint.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrajectoryBoundary
    let len;
    let data = new TrajectoryBoundary(null);
    // Deserialize message field [point]
    // Deserialize array length for message field [point]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.point = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.point[i] = TrajectoryBoundaryPoint.deserialize(buffer, bufferOffset)
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
    return 'autohyu_msgs/TrajectoryBoundary';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '855c97146bb19f8639cd6503bd7dae24';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    autohyu_msgs/TrajectoryBoundaryPoint[] point
    ================================================================================
    MSG: autohyu_msgs/TrajectoryBoundaryPoint
    float32 x
    float32 y
    float32 z
    float32 s
    float32 n
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TrajectoryBoundary(null);
    if (msg.point !== undefined) {
      resolved.point = new Array(msg.point.length);
      for (let i = 0; i < resolved.point.length; ++i) {
        resolved.point[i] = TrajectoryBoundaryPoint.Resolve(msg.point[i]);
      }
    }
    else {
      resolved.point = []
    }

    return resolved;
    }
};

module.exports = TrajectoryBoundary;
