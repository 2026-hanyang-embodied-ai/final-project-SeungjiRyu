// Auto-generated. Do not edit!

// (in-package autohyu_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class GoalPoints {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.goal_points = null;
    }
    else {
      if (initObj.hasOwnProperty('goal_points')) {
        this.goal_points = initObj.goal_points
      }
      else {
        this.goal_points = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GoalPoints
    // Serialize message field [goal_points]
    // Serialize the length for message field [goal_points]
    bufferOffset = _serializer.uint32(obj.goal_points.length, buffer, bufferOffset);
    obj.goal_points.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GoalPoints
    let len;
    let data = new GoalPoints(null);
    // Deserialize message field [goal_points]
    // Deserialize array length for message field [goal_points]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.goal_points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.goal_points[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 24 * object.goal_points.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/GoalPoints';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd9c0f6fe1383e1e35c12b2c5901041a7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point[] goal_points
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GoalPoints(null);
    if (msg.goal_points !== undefined) {
      resolved.goal_points = new Array(msg.goal_points.length);
      for (let i = 0; i < resolved.goal_points.length; ++i) {
        resolved.goal_points[i] = geometry_msgs.msg.Point.Resolve(msg.goal_points[i]);
      }
    }
    else {
      resolved.goal_points = []
    }

    return resolved;
    }
};

module.exports = GoalPoints;
