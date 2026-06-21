// Auto-generated. Do not edit!

// (in-package autohyu_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ObjectDimension = require('./ObjectDimension.js');
let Object3DState = require('./Object3DState.js');

//-----------------------------------------------------------

class TrackObject {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.classification = null;
      this.dynamic_state = null;
      this.dimension = null;
      this.state = null;
      this.state_covariance = null;
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
      if (initObj.hasOwnProperty('dynamic_state')) {
        this.dynamic_state = initObj.dynamic_state
      }
      else {
        this.dynamic_state = 0;
      }
      if (initObj.hasOwnProperty('dimension')) {
        this.dimension = initObj.dimension
      }
      else {
        this.dimension = new ObjectDimension();
      }
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = new Object3DState();
      }
      if (initObj.hasOwnProperty('state_covariance')) {
        this.state_covariance = initObj.state_covariance
      }
      else {
        this.state_covariance = new Object3DState();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TrackObject
    // Serialize message field [id]
    bufferOffset = _serializer.uint32(obj.id, buffer, bufferOffset);
    // Serialize message field [classification]
    bufferOffset = _serializer.uint8(obj.classification, buffer, bufferOffset);
    // Serialize message field [dynamic_state]
    bufferOffset = _serializer.uint8(obj.dynamic_state, buffer, bufferOffset);
    // Serialize message field [dimension]
    bufferOffset = ObjectDimension.serialize(obj.dimension, buffer, bufferOffset);
    // Serialize message field [state]
    bufferOffset = Object3DState.serialize(obj.state, buffer, bufferOffset);
    // Serialize message field [state_covariance]
    bufferOffset = Object3DState.serialize(obj.state_covariance, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrackObject
    let len;
    let data = new TrackObject(null);
    // Deserialize message field [id]
    data.id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [classification]
    data.classification = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [dynamic_state]
    data.dynamic_state = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [dimension]
    data.dimension = ObjectDimension.deserialize(buffer, bufferOffset);
    // Deserialize message field [state]
    data.state = Object3DState.deserialize(buffer, bufferOffset);
    // Deserialize message field [state_covariance]
    data.state_covariance = Object3DState.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += Object3DState.getMessageSize(object.state);
    length += Object3DState.getMessageSize(object.state_covariance);
    return length + 18;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/TrackObject';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c567d69f4c89cc5d54e7b9f7798bddba';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Object information
    uint32 id
    uint8 classification
    uint8 dynamic_state
    
    autohyu_msgs/ObjectDimension dimension
    autohyu_msgs/Object3DState state
    autohyu_msgs/Object3DState state_covariance
    
    ================================================================================
    MSG: autohyu_msgs/ObjectDimension
    float32 length
    float32 width
    float32 height
    
    ================================================================================
    MSG: autohyu_msgs/Object3DState
    std_msgs/Header header
    
    float32 x
    float32 y
    float32 z
    float32 vx
    float32 vy
    float32 vz
    float32 ax
    float32 ay
    float32 az
    float32 roll
    float32 pitch
    float32 yaw
    float32 roll_rate
    float32 pitch_rate
    float32 yaw_rate
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TrackObject(null);
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

    if (msg.dynamic_state !== undefined) {
      resolved.dynamic_state = msg.dynamic_state;
    }
    else {
      resolved.dynamic_state = 0
    }

    if (msg.dimension !== undefined) {
      resolved.dimension = ObjectDimension.Resolve(msg.dimension)
    }
    else {
      resolved.dimension = new ObjectDimension()
    }

    if (msg.state !== undefined) {
      resolved.state = Object3DState.Resolve(msg.state)
    }
    else {
      resolved.state = new Object3DState()
    }

    if (msg.state_covariance !== undefined) {
      resolved.state_covariance = Object3DState.Resolve(msg.state_covariance)
    }
    else {
      resolved.state_covariance = new Object3DState()
    }

    return resolved;
    }
};

module.exports = TrackObject;
