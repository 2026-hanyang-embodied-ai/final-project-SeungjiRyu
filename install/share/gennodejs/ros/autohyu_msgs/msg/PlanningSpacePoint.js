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

class PlanningSpacePoint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.heading = null;
      this.traffic_light_id = null;
      this.traffic_light_color = null;
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
      if (initObj.hasOwnProperty('heading')) {
        this.heading = initObj.heading
      }
      else {
        this.heading = 0.0;
      }
      if (initObj.hasOwnProperty('traffic_light_id')) {
        this.traffic_light_id = initObj.traffic_light_id
      }
      else {
        this.traffic_light_id = '';
      }
      if (initObj.hasOwnProperty('traffic_light_color')) {
        this.traffic_light_color = initObj.traffic_light_color
      }
      else {
        this.traffic_light_color = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PlanningSpacePoint
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [heading]
    bufferOffset = _serializer.float64(obj.heading, buffer, bufferOffset);
    // Serialize message field [traffic_light_id]
    bufferOffset = _serializer.string(obj.traffic_light_id, buffer, bufferOffset);
    // Serialize message field [traffic_light_color]
    bufferOffset = _serializer.uint16(obj.traffic_light_color, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PlanningSpacePoint
    let len;
    let data = new PlanningSpacePoint(null);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [heading]
    data.heading = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [traffic_light_id]
    data.traffic_light_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [traffic_light_color]
    data.traffic_light_color = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.traffic_light_id);
    return length + 30;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/PlanningSpacePoint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'aa200d3801db544dc5c0cfd6666243ad';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 x
    float64 y
    float64 heading
    string  traffic_light_id
    uint16  traffic_light_color
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PlanningSpacePoint(null);
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

    if (msg.heading !== undefined) {
      resolved.heading = msg.heading;
    }
    else {
      resolved.heading = 0.0
    }

    if (msg.traffic_light_id !== undefined) {
      resolved.traffic_light_id = msg.traffic_light_id;
    }
    else {
      resolved.traffic_light_id = ''
    }

    if (msg.traffic_light_color !== undefined) {
      resolved.traffic_light_color = msg.traffic_light_color;
    }
    else {
      resolved.traffic_light_color = 0
    }

    return resolved;
    }
};

module.exports = PlanningSpacePoint;
