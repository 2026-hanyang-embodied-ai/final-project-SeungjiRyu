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

class LaneletTrafficLight {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sign_id = null;
      this.intersection_id = null;
      this.light_type = null;
      this.stop_point = null;
    }
    else {
      if (initObj.hasOwnProperty('sign_id')) {
        this.sign_id = initObj.sign_id
      }
      else {
        this.sign_id = 0;
      }
      if (initObj.hasOwnProperty('intersection_id')) {
        this.intersection_id = initObj.intersection_id
      }
      else {
        this.intersection_id = 0;
      }
      if (initObj.hasOwnProperty('light_type')) {
        this.light_type = initObj.light_type
      }
      else {
        this.light_type = '';
      }
      if (initObj.hasOwnProperty('stop_point')) {
        this.stop_point = initObj.stop_point
      }
      else {
        this.stop_point = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LaneletTrafficLight
    // Serialize message field [sign_id]
    bufferOffset = _serializer.int64(obj.sign_id, buffer, bufferOffset);
    // Serialize message field [intersection_id]
    bufferOffset = _serializer.int64(obj.intersection_id, buffer, bufferOffset);
    // Serialize message field [light_type]
    bufferOffset = _serializer.string(obj.light_type, buffer, bufferOffset);
    // Serialize message field [stop_point]
    // Serialize the length for message field [stop_point]
    bufferOffset = _serializer.uint32(obj.stop_point.length, buffer, bufferOffset);
    obj.stop_point.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LaneletTrafficLight
    let len;
    let data = new LaneletTrafficLight(null);
    // Deserialize message field [sign_id]
    data.sign_id = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [intersection_id]
    data.intersection_id = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [light_type]
    data.light_type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [stop_point]
    // Deserialize array length for message field [stop_point]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.stop_point = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.stop_point[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.light_type);
    length += 24 * object.stop_point.length;
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/LaneletTrafficLight';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2ee52a1dcd096e64bfcc591f681c7089';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 sign_id
    int64 intersection_id
    string light_type
    geometry_msgs/Point[] stop_point
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
    const resolved = new LaneletTrafficLight(null);
    if (msg.sign_id !== undefined) {
      resolved.sign_id = msg.sign_id;
    }
    else {
      resolved.sign_id = 0
    }

    if (msg.intersection_id !== undefined) {
      resolved.intersection_id = msg.intersection_id;
    }
    else {
      resolved.intersection_id = 0
    }

    if (msg.light_type !== undefined) {
      resolved.light_type = msg.light_type;
    }
    else {
      resolved.light_type = ''
    }

    if (msg.stop_point !== undefined) {
      resolved.stop_point = new Array(msg.stop_point.length);
      for (let i = 0; i < resolved.stop_point.length; ++i) {
        resolved.stop_point[i] = geometry_msgs.msg.Point.Resolve(msg.stop_point[i]);
      }
    }
    else {
      resolved.stop_point = []
    }

    return resolved;
    }
};

module.exports = LaneletTrafficLight;
