// Auto-generated. Do not edit!

// (in-package carmaker_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ObjectState = require('./ObjectState.js');

//-----------------------------------------------------------

class Object {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.classification = null;
      this.lane_id = null;
      this.length = null;
      this.width = null;
      this.height = null;
      this.state = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('classification')) {
        this.classification = initObj.classification
      }
      else {
        this.classification = 0;
      }
      if (initObj.hasOwnProperty('lane_id')) {
        this.lane_id = initObj.lane_id
      }
      else {
        this.lane_id = 0;
      }
      if (initObj.hasOwnProperty('length')) {
        this.length = initObj.length
      }
      else {
        this.length = 0.0;
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0.0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0.0;
      }
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = new ObjectState();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Object
    // Serialize message field [id]
    bufferOffset = _serializer.uint8(obj.id, buffer, bufferOffset);
    // Serialize message field [classification]
    bufferOffset = _serializer.uint8(obj.classification, buffer, bufferOffset);
    // Serialize message field [lane_id]
    bufferOffset = _serializer.uint8(obj.lane_id, buffer, bufferOffset);
    // Serialize message field [length]
    bufferOffset = _serializer.float32(obj.length, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.float32(obj.width, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.float32(obj.height, buffer, bufferOffset);
    // Serialize message field [state]
    bufferOffset = ObjectState.serialize(obj.state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Object
    let len;
    let data = new Object(null);
    // Deserialize message field [id]
    data.id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [classification]
    data.classification = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [lane_id]
    data.lane_id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [length]
    data.length = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [state]
    data.state = ObjectState.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 115;
  }

  static datatype() {
    // Returns string type for a message object
    return 'carmaker_msgs/Object';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '111800c1669628270d9a907e3619e0e5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Object information
    uint8 id
    uint8 classification
    uint8 lane_id
    
    float32 length 
    float32 width 
    float32 height 
    
    carmaker_msgs/ObjectState state
    
    ================================================================================
    MSG: carmaker_msgs/ObjectState
    float64 latitude                  # GCS Coordinates latitude
    float64 longitude                 # GCS Coordinates longitude
    float64 elevation                 # GCS Coordinates elevation
    
    float64 x
    float64 y
    float64 z
    
    float32 roll                      # yaw in vehicle coordinates [rad]
    float32 pitch                     # yaw in vehicle coordinates [rad]
    float32 yaw                       # yaw in vehicle coordinates [rad]
    float32 ego_roll                      # yaw in vehicle coordinates [rad]
    float32 ego_pitch                     # yaw in vehicle coordinates [rad]
    float32 ego_yaw                       # yaw in vehicle coordinates [rad]
    
    float32 roll_rate                      # yaw in vehicle coordinates [rad]
    float32 pitch_rate                     # yaw in vehicle coordinates [rad]
    float32 yaw_rate                       # yaw in vehicle coordinates [rad]
    
    float32 v_x                       # velocity in vehicle coordinates [m/s]
    float32 v_y                       # velocity in vehicle coordinates [m/s]
    float32 a_x                       # acceleration in vehicle coordinates [m/s^2]
    float32 a_y                       # acceleration in vehicle coordinates [m/s^2]
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Object(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.classification !== undefined) {
      resolved.classification = msg.classification;
    }
    else {
      resolved.classification = 0
    }

    if (msg.lane_id !== undefined) {
      resolved.lane_id = msg.lane_id;
    }
    else {
      resolved.lane_id = 0
    }

    if (msg.length !== undefined) {
      resolved.length = msg.length;
    }
    else {
      resolved.length = 0.0
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0.0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0.0
    }

    if (msg.state !== undefined) {
      resolved.state = ObjectState.Resolve(msg.state)
    }
    else {
      resolved.state = new ObjectState()
    }

    return resolved;
    }
};

module.exports = Object;
