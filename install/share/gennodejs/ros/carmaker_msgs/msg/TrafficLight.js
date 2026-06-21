// Auto-generated. Do not edit!

// (in-package carmaker_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class TrafficLight {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.TrafficLightID = null;
      this.TrafficLightState = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('TrafficLightID')) {
        this.TrafficLightID = initObj.TrafficLightID
      }
      else {
        this.TrafficLightID = 0;
      }
      if (initObj.hasOwnProperty('TrafficLightState')) {
        this.TrafficLightState = initObj.TrafficLightState
      }
      else {
        this.TrafficLightState = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TrafficLight
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [TrafficLightID]
    bufferOffset = _serializer.uint16(obj.TrafficLightID, buffer, bufferOffset);
    // Serialize message field [TrafficLightState]
    bufferOffset = _serializer.uint8(obj.TrafficLightState, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrafficLight
    let len;
    let data = new TrafficLight(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [TrafficLightID]
    data.TrafficLightID = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [TrafficLightState]
    data.TrafficLightState = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 3;
  }

  static datatype() {
    // Returns string type for a message object
    return 'carmaker_msgs/TrafficLight';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'df7500dfb83cf8c9771f4d242f622dc5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # std_msgs/Header
    std_msgs/Header header
    
    uint16 TrafficLightID
    uint8 TrafficLightState
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
    const resolved = new TrafficLight(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.TrafficLightID !== undefined) {
      resolved.TrafficLightID = msg.TrafficLightID;
    }
    else {
      resolved.TrafficLightID = 0
    }

    if (msg.TrafficLightState !== undefined) {
      resolved.TrafficLightState = msg.TrafficLightState;
    }
    else {
      resolved.TrafficLightState = 0
    }

    return resolved;
    }
};

module.exports = TrafficLight;
