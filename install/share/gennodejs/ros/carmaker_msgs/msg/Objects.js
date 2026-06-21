// Auto-generated. Do not edit!

// (in-package carmaker_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Object = require('./Object.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Objects {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.number_of_objects = null;
      this.object = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('number_of_objects')) {
        this.number_of_objects = initObj.number_of_objects
      }
      else {
        this.number_of_objects = 0;
      }
      if (initObj.hasOwnProperty('object')) {
        this.object = initObj.object
      }
      else {
        this.object = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Objects
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [number_of_objects]
    bufferOffset = _serializer.uint16(obj.number_of_objects, buffer, bufferOffset);
    // Serialize message field [object]
    // Serialize the length for message field [object]
    bufferOffset = _serializer.uint32(obj.object.length, buffer, bufferOffset);
    obj.object.forEach((val) => {
      bufferOffset = Object.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Objects
    let len;
    let data = new Objects(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [number_of_objects]
    data.number_of_objects = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [object]
    // Deserialize array length for message field [object]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.object = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.object[i] = Object.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 115 * object.object.length;
    return length + 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'carmaker_msgs/Objects';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'aa0a3829c7ec278c7f0d3560362836b3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # std_msgs/Header
    std_msgs/Header header
    
    # object information
    uint16 number_of_objects
    carmaker_msgs/Object[] object
    
    
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
    
    ================================================================================
    MSG: carmaker_msgs/Object
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
    const resolved = new Objects(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.number_of_objects !== undefined) {
      resolved.number_of_objects = msg.number_of_objects;
    }
    else {
      resolved.number_of_objects = 0
    }

    if (msg.object !== undefined) {
      resolved.object = new Array(msg.object.length);
      for (let i = 0; i < resolved.object.length; ++i) {
        resolved.object[i] = Object.Resolve(msg.object[i]);
      }
    }
    else {
      resolved.object = []
    }

    return resolved;
    }
};

module.exports = Objects;
