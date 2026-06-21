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
let PredictObjectMultimodal = require('./PredictObjectMultimodal.js');
let Object3DState = require('./Object3DState.js');

//-----------------------------------------------------------

class PredictObject {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.classification = null;
      this.dynamic_state = null;
      this.dimension = null;
      this.state_multi = null;
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
      if (initObj.hasOwnProperty('state_multi')) {
        this.state_multi = initObj.state_multi
      }
      else {
        this.state_multi = [];
      }
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PredictObject
    // Serialize message field [id]
    bufferOffset = _serializer.uint32(obj.id, buffer, bufferOffset);
    // Serialize message field [classification]
    bufferOffset = _serializer.uint8(obj.classification, buffer, bufferOffset);
    // Serialize message field [dynamic_state]
    bufferOffset = _serializer.uint8(obj.dynamic_state, buffer, bufferOffset);
    // Serialize message field [dimension]
    bufferOffset = ObjectDimension.serialize(obj.dimension, buffer, bufferOffset);
    // Serialize message field [state_multi]
    // Serialize the length for message field [state_multi]
    bufferOffset = _serializer.uint32(obj.state_multi.length, buffer, bufferOffset);
    obj.state_multi.forEach((val) => {
      bufferOffset = PredictObjectMultimodal.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [state]
    // Serialize the length for message field [state]
    bufferOffset = _serializer.uint32(obj.state.length, buffer, bufferOffset);
    obj.state.forEach((val) => {
      bufferOffset = Object3DState.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PredictObject
    let len;
    let data = new PredictObject(null);
    // Deserialize message field [id]
    data.id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [classification]
    data.classification = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [dynamic_state]
    data.dynamic_state = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [dimension]
    data.dimension = ObjectDimension.deserialize(buffer, bufferOffset);
    // Deserialize message field [state_multi]
    // Deserialize array length for message field [state_multi]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.state_multi = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.state_multi[i] = PredictObjectMultimodal.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [state]
    // Deserialize array length for message field [state]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.state = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.state[i] = Object3DState.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.state_multi.forEach((val) => {
      length += PredictObjectMultimodal.getMessageSize(val);
    });
    object.state.forEach((val) => {
      length += Object3DState.getMessageSize(val);
    });
    return length + 26;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/PredictObject';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd31c4c1b4494f87ffdc5cd468578ad3a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Object information
    uint32 id
    uint8 classification
    uint8 dynamic_state
    
    autohyu_msgs/ObjectDimension dimension
    autohyu_msgs/PredictObjectMultimodal[] state_multi
    autohyu_msgs/Object3DState[] state
    
    ================================================================================
    MSG: autohyu_msgs/ObjectDimension
    float32 length
    float32 width
    float32 height
    
    ================================================================================
    MSG: autohyu_msgs/PredictObjectMultimodal
    float64 probability
    autohyu_msgs/Object3DState[] state
    
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
    const resolved = new PredictObject(null);
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

    if (msg.state_multi !== undefined) {
      resolved.state_multi = new Array(msg.state_multi.length);
      for (let i = 0; i < resolved.state_multi.length; ++i) {
        resolved.state_multi[i] = PredictObjectMultimodal.Resolve(msg.state_multi[i]);
      }
    }
    else {
      resolved.state_multi = []
    }

    if (msg.state !== undefined) {
      resolved.state = new Array(msg.state.length);
      for (let i = 0; i < resolved.state.length; ++i) {
        resolved.state[i] = Object3DState.Resolve(msg.state[i]);
      }
    }
    else {
      resolved.state = []
    }

    return resolved;
    }
};

module.exports = PredictObject;
