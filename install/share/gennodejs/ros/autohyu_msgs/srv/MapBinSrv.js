// Auto-generated. Do not edit!

// (in-package autohyu_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class MapBinSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.requester = null;
    }
    else {
      if (initObj.hasOwnProperty('requester')) {
        this.requester = initObj.requester
      }
      else {
        this.requester = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MapBinSrvRequest
    // Serialize message field [requester]
    bufferOffset = _serializer.string(obj.requester, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MapBinSrvRequest
    let len;
    let data = new MapBinSrvRequest(null);
    // Deserialize message field [requester]
    data.requester = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.requester);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'autohyu_msgs/MapBinSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '60013e7f31bca6e521231448cd2bb99b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Request
    string requester
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MapBinSrvRequest(null);
    if (msg.requester !== undefined) {
      resolved.requester = msg.requester;
    }
    else {
      resolved.requester = ''
    }

    return resolved;
    }
};

class MapBinSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.data = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
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
    // Serializes a message object of type MapBinSrvResponse
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [data]
    bufferOffset = _arraySerializer.int8(obj.data, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MapBinSrvResponse
    let len;
    let data = new MapBinSrvResponse(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [data]
    data.data = _arrayDeserializer.int8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.data.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'autohyu_msgs/MapBinSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '76e8caca558be0db7a08d3479289f362';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Response
    std_msgs/Header header
    # binary data of lanelet2 map
    # use int8 because byte is deprecated
    int8[] data
    
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
    const resolved = new MapBinSrvResponse(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
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

module.exports = {
  Request: MapBinSrvRequest,
  Response: MapBinSrvResponse,
  md5sum() { return '40f5991feacf64e4d54a5bf2aa79bf5a'; },
  datatype() { return 'autohyu_msgs/MapBinSrv'; }
};
