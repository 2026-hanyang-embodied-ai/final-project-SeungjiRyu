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

class LaneletLine {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.line_type = null;
      this.line_color = null;
      this.point = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('line_type')) {
        this.line_type = initObj.line_type
      }
      else {
        this.line_type = '';
      }
      if (initObj.hasOwnProperty('line_color')) {
        this.line_color = initObj.line_color
      }
      else {
        this.line_color = '';
      }
      if (initObj.hasOwnProperty('point')) {
        this.point = initObj.point
      }
      else {
        this.point = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LaneletLine
    // Serialize message field [id]
    bufferOffset = _serializer.int64(obj.id, buffer, bufferOffset);
    // Serialize message field [line_type]
    bufferOffset = _serializer.string(obj.line_type, buffer, bufferOffset);
    // Serialize message field [line_color]
    bufferOffset = _serializer.string(obj.line_color, buffer, bufferOffset);
    // Serialize message field [point]
    // Serialize the length for message field [point]
    bufferOffset = _serializer.uint32(obj.point.length, buffer, bufferOffset);
    obj.point.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LaneletLine
    let len;
    let data = new LaneletLine(null);
    // Deserialize message field [id]
    data.id = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [line_type]
    data.line_type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [line_color]
    data.line_color = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [point]
    // Deserialize array length for message field [point]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.point = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.point[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.line_type);
    length += _getByteLength(object.line_color);
    length += 24 * object.point.length;
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/LaneletLine';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9c57b13f124b0bb158b6d8860251cbb8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 id
    string line_type
    string line_color
    geometry_msgs/Point[] point
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
    const resolved = new LaneletLine(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.line_type !== undefined) {
      resolved.line_type = msg.line_type;
    }
    else {
      resolved.line_type = ''
    }

    if (msg.line_color !== undefined) {
      resolved.line_color = msg.line_color;
    }
    else {
      resolved.line_color = ''
    }

    if (msg.point !== undefined) {
      resolved.point = new Array(msg.point.length);
      for (let i = 0; i < resolved.point.length; ++i) {
        resolved.point[i] = geometry_msgs.msg.Point.Resolve(msg.point[i]);
      }
    }
    else {
      resolved.point = []
    }

    return resolved;
    }
};

module.exports = LaneletLine;
