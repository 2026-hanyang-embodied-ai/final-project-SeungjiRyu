// Auto-generated. Do not edit!

// (in-package autohyu_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class LaneletPath {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.ll_id_path = null;
      this.ll_id_ego = null;
      this.goal_point = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('ll_id_path')) {
        this.ll_id_path = initObj.ll_id_path
      }
      else {
        this.ll_id_path = [];
      }
      if (initObj.hasOwnProperty('ll_id_ego')) {
        this.ll_id_ego = initObj.ll_id_ego
      }
      else {
        this.ll_id_ego = 0;
      }
      if (initObj.hasOwnProperty('goal_point')) {
        this.goal_point = initObj.goal_point
      }
      else {
        this.goal_point = new geometry_msgs.msg.Point();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LaneletPath
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [ll_id_path]
    bufferOffset = _arraySerializer.int64(obj.ll_id_path, buffer, bufferOffset, null);
    // Serialize message field [ll_id_ego]
    bufferOffset = _serializer.int64(obj.ll_id_ego, buffer, bufferOffset);
    // Serialize message field [goal_point]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.goal_point, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LaneletPath
    let len;
    let data = new LaneletPath(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [ll_id_path]
    data.ll_id_path = _arrayDeserializer.int64(buffer, bufferOffset, null)
    // Deserialize message field [ll_id_ego]
    data.ll_id_ego = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [goal_point]
    data.goal_point = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 8 * object.ll_id_path.length;
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/LaneletPath';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c7ff983bae1712fb37868ddd2fe37071';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    
    int64[] ll_id_path
    int64 ll_id_ego
    geometry_msgs/Point goal_point
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
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LaneletPath(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.ll_id_path !== undefined) {
      resolved.ll_id_path = msg.ll_id_path;
    }
    else {
      resolved.ll_id_path = []
    }

    if (msg.ll_id_ego !== undefined) {
      resolved.ll_id_ego = msg.ll_id_ego;
    }
    else {
      resolved.ll_id_ego = 0
    }

    if (msg.goal_point !== undefined) {
      resolved.goal_point = geometry_msgs.msg.Point.Resolve(msg.goal_point)
    }
    else {
      resolved.goal_point = new geometry_msgs.msg.Point()
    }

    return resolved;
    }
};

module.exports = LaneletPath;
