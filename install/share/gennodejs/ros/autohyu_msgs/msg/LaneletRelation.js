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

class LaneletRelation {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.type = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LaneletRelation
    // Serialize message field [id]
    bufferOffset = _serializer.int64(obj.id, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.uint8(obj.type, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LaneletRelation
    let len;
    let data = new LaneletRelation(null);
    // Deserialize message field [id]
    data.id = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/LaneletRelation';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'af7fa5165485233d64a846f479ababaf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Relation between lanes
    uint8 NONE = 0
    uint8 SUCCESSOR = 1
    uint8 LEFT = 2
    uint8 RIGHT = 3
    uint8 ADJACENT_LEFT = 4
    uint8 ADJACENT_RIGHT = 5
    uint8 CONFLICTING = 6
    uint8 AREA = 7
    
    int64 id
    uint8 type
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LaneletRelation(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    return resolved;
    }
};

// Constants for message
LaneletRelation.Constants = {
  NONE: 0,
  SUCCESSOR: 1,
  LEFT: 2,
  RIGHT: 3,
  ADJACENT_LEFT: 4,
  ADJACENT_RIGHT: 5,
  CONFLICTING: 6,
  AREA: 7,
}

module.exports = LaneletRelation;
