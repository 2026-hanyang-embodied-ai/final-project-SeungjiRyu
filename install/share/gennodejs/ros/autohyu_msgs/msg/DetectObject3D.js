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

class DetectObject3D {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.confidence_score = null;
      this.classification = null;
      this.dimension = null;
      this.state = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('confidence_score')) {
        this.confidence_score = initObj.confidence_score
      }
      else {
        this.confidence_score = 0.0;
      }
      if (initObj.hasOwnProperty('classification')) {
        this.classification = initObj.classification
      }
      else {
        this.classification = 0;
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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DetectObject3D
    // Serialize message field [id]
    bufferOffset = _serializer.uint32(obj.id, buffer, bufferOffset);
    // Serialize message field [confidence_score]
    bufferOffset = _serializer.float32(obj.confidence_score, buffer, bufferOffset);
    // Serialize message field [classification]
    bufferOffset = _serializer.uint8(obj.classification, buffer, bufferOffset);
    // Serialize message field [dimension]
    bufferOffset = ObjectDimension.serialize(obj.dimension, buffer, bufferOffset);
    // Serialize message field [state]
    bufferOffset = Object3DState.serialize(obj.state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DetectObject3D
    let len;
    let data = new DetectObject3D(null);
    // Deserialize message field [id]
    data.id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [confidence_score]
    data.confidence_score = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [classification]
    data.classification = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [dimension]
    data.dimension = ObjectDimension.deserialize(buffer, bufferOffset);
    // Deserialize message field [state]
    data.state = Object3DState.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += Object3DState.getMessageSize(object.state);
    return length + 21;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/DetectObject3D';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b926515bdab412f7168a089d08258b77';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Object information
    uint32 id
    float32 confidence_score
    uint8 classification
    
    autohyu_msgs/ObjectDimension dimension
    autohyu_msgs/Object3DState   state
    
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
    const resolved = new DetectObject3D(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.confidence_score !== undefined) {
      resolved.confidence_score = msg.confidence_score;
    }
    else {
      resolved.confidence_score = 0.0
    }

    if (msg.classification !== undefined) {
      resolved.classification = msg.classification;
    }
    else {
      resolved.classification = 0
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

    return resolved;
    }
};

module.exports = DetectObject3D;
