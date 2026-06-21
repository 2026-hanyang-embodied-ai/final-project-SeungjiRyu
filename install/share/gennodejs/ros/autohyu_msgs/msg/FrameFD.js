// Auto-generated. Do not edit!

// (in-package autohyu_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class FrameFD {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.id = null;
      this.is_rtr = null;
      this.is_extended = null;
      this.is_error = null;
      this.is_canfd = null;
      this.dlc = null;
      this.data = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('is_rtr')) {
        this.is_rtr = initObj.is_rtr
      }
      else {
        this.is_rtr = false;
      }
      if (initObj.hasOwnProperty('is_extended')) {
        this.is_extended = initObj.is_extended
      }
      else {
        this.is_extended = false;
      }
      if (initObj.hasOwnProperty('is_error')) {
        this.is_error = initObj.is_error
      }
      else {
        this.is_error = false;
      }
      if (initObj.hasOwnProperty('is_canfd')) {
        this.is_canfd = initObj.is_canfd
      }
      else {
        this.is_canfd = false;
      }
      if (initObj.hasOwnProperty('dlc')) {
        this.dlc = initObj.dlc
      }
      else {
        this.dlc = 0;
      }
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FrameFD
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.uint32(obj.id, buffer, bufferOffset);
    // Serialize message field [is_rtr]
    bufferOffset = _serializer.bool(obj.is_rtr, buffer, bufferOffset);
    // Serialize message field [is_extended]
    bufferOffset = _serializer.bool(obj.is_extended, buffer, bufferOffset);
    // Serialize message field [is_error]
    bufferOffset = _serializer.bool(obj.is_error, buffer, bufferOffset);
    // Serialize message field [is_canfd]
    bufferOffset = _serializer.bool(obj.is_canfd, buffer, bufferOffset);
    // Serialize message field [dlc]
    bufferOffset = _serializer.uint8(obj.dlc, buffer, bufferOffset);
    // Serialize message field [data]
    bufferOffset = _arraySerializer.uint8(obj.data, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FrameFD
    let len;
    let data = new FrameFD(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [is_rtr]
    data.is_rtr = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [is_extended]
    data.is_extended = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [is_error]
    data.is_error = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [is_canfd]
    data.is_canfd = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [dlc]
    data.dlc = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [data]
    data.data = _arrayDeserializer.uint8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.data.length;
    return length + 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/FrameFD';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8ee15b5cff9352181d411c469f2fab02';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
      
    uint32 id
    bool is_rtr
    bool is_extended
    bool is_error
    bool is_canfd
    uint8 dlc
    uint8[] data
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
    const resolved = new FrameFD(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.is_rtr !== undefined) {
      resolved.is_rtr = msg.is_rtr;
    }
    else {
      resolved.is_rtr = false
    }

    if (msg.is_extended !== undefined) {
      resolved.is_extended = msg.is_extended;
    }
    else {
      resolved.is_extended = false
    }

    if (msg.is_error !== undefined) {
      resolved.is_error = msg.is_error;
    }
    else {
      resolved.is_error = false
    }

    if (msg.is_canfd !== undefined) {
      resolved.is_canfd = msg.is_canfd;
    }
    else {
      resolved.is_canfd = false
    }

    if (msg.dlc !== undefined) {
      resolved.dlc = msg.dlc;
    }
    else {
      resolved.dlc = 0
    }

    if (msg.data !== undefined) {
      resolved.data = msg.data;
    }
    else {
      resolved.data = []
    }

    return resolved;
    }
};

module.exports = FrameFD;
