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

//-----------------------------------------------------------

class Reference {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.projection = null;
      this.wgs84 = null;
    }
    else {
      if (initObj.hasOwnProperty('projection')) {
        this.projection = initObj.projection
      }
      else {
        this.projection = '';
      }
      if (initObj.hasOwnProperty('wgs84')) {
        this.wgs84 = initObj.wgs84
      }
      else {
        this.wgs84 = new WGS84();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Reference
    // Serialize message field [projection]
    bufferOffset = _serializer.string(obj.projection, buffer, bufferOffset);
    // Serialize message field [wgs84]
    bufferOffset = WGS84.serialize(obj.wgs84, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Reference
    let len;
    let data = new Reference(null);
    // Deserialize message field [projection]
    data.projection = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [wgs84]
    data.wgs84 = WGS84.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.projection);
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/Reference';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4d603e2ddd7205e463437d38cbec7ed4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string  projection
    autohyu_msgs/WGS84 wgs84
    ================================================================================
    MSG: autohyu_msgs/WGS84
    float64 latitude
    float64 longitude
    float64 altitude
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Reference(null);
    if (msg.projection !== undefined) {
      resolved.projection = msg.projection;
    }
    else {
      resolved.projection = ''
    }

    if (msg.wgs84 !== undefined) {
      resolved.wgs84 = WGS84.Resolve(msg.wgs84)
    }
    else {
      resolved.wgs84 = new WGS84()
    }

    return resolved;
    }
};

module.exports = Reference;
