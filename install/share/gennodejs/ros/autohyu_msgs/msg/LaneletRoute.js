// Auto-generated. Do not edit!

// (in-package autohyu_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Lanelet = require('./Lanelet.js');
let LaneletLine = require('./LaneletLine.js');
let LaneletLane = require('./LaneletLane.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class LaneletRoute {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.lanelet = null;
      this.boundary_line = null;
      this.center_lane = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('lanelet')) {
        this.lanelet = initObj.lanelet
      }
      else {
        this.lanelet = [];
      }
      if (initObj.hasOwnProperty('boundary_line')) {
        this.boundary_line = initObj.boundary_line
      }
      else {
        this.boundary_line = [];
      }
      if (initObj.hasOwnProperty('center_lane')) {
        this.center_lane = initObj.center_lane
      }
      else {
        this.center_lane = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LaneletRoute
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [lanelet]
    // Serialize the length for message field [lanelet]
    bufferOffset = _serializer.uint32(obj.lanelet.length, buffer, bufferOffset);
    obj.lanelet.forEach((val) => {
      bufferOffset = Lanelet.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [boundary_line]
    // Serialize the length for message field [boundary_line]
    bufferOffset = _serializer.uint32(obj.boundary_line.length, buffer, bufferOffset);
    obj.boundary_line.forEach((val) => {
      bufferOffset = LaneletLine.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [center_lane]
    // Serialize the length for message field [center_lane]
    bufferOffset = _serializer.uint32(obj.center_lane.length, buffer, bufferOffset);
    obj.center_lane.forEach((val) => {
      bufferOffset = LaneletLane.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LaneletRoute
    let len;
    let data = new LaneletRoute(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [lanelet]
    // Deserialize array length for message field [lanelet]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.lanelet = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.lanelet[i] = Lanelet.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [boundary_line]
    // Deserialize array length for message field [boundary_line]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.boundary_line = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.boundary_line[i] = LaneletLine.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [center_lane]
    // Deserialize array length for message field [center_lane]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.center_lane = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.center_lane[i] = LaneletLane.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.lanelet.forEach((val) => {
      length += Lanelet.getMessageSize(val);
    });
    object.boundary_line.forEach((val) => {
      length += LaneletLine.getMessageSize(val);
    });
    object.center_lane.forEach((val) => {
      length += LaneletLane.getMessageSize(val);
    });
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/LaneletRoute';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cd094afb7c96ccd6501ac3bbfa0c72d6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    
    autohyu_msgs/Lanelet[] lanelet
    autohyu_msgs/LaneletLine[] boundary_line
    autohyu_msgs/LaneletLane[] center_lane
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
    MSG: autohyu_msgs/Lanelet
    int64 id
    bool is_ego
    bool is_goal
    bool is_shortest_path
    int64 left_boundary_line_id
    int64 right_boundary_line_id
    autohyu_msgs/LaneletRelation[] relation
    autohyu_msgs/LaneletTrafficSign[] traffic_sign
    autohyu_msgs/LaneletTrafficSign[] turn_signal
    autohyu_msgs/LaneletTrafficLight[] traffic_light
    ================================================================================
    MSG: autohyu_msgs/LaneletRelation
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
    ================================================================================
    MSG: autohyu_msgs/LaneletTrafficSign
    int64 id
    string element_type
    geometry_msgs/Point[] point
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: autohyu_msgs/LaneletTrafficLight
    int64 sign_id
    int64 intersection_id
    string light_type
    geometry_msgs/Point[] stop_point
    ================================================================================
    MSG: autohyu_msgs/LaneletLine
    int64 id
    string line_type
    string line_color
    geometry_msgs/Point[] point
    ================================================================================
    MSG: autohyu_msgs/LaneletLane
    int64 id
    int64 lane_num
    float64 max_speed
    geometry_msgs/Point[] point
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LaneletRoute(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.lanelet !== undefined) {
      resolved.lanelet = new Array(msg.lanelet.length);
      for (let i = 0; i < resolved.lanelet.length; ++i) {
        resolved.lanelet[i] = Lanelet.Resolve(msg.lanelet[i]);
      }
    }
    else {
      resolved.lanelet = []
    }

    if (msg.boundary_line !== undefined) {
      resolved.boundary_line = new Array(msg.boundary_line.length);
      for (let i = 0; i < resolved.boundary_line.length; ++i) {
        resolved.boundary_line[i] = LaneletLine.Resolve(msg.boundary_line[i]);
      }
    }
    else {
      resolved.boundary_line = []
    }

    if (msg.center_lane !== undefined) {
      resolved.center_lane = new Array(msg.center_lane.length);
      for (let i = 0; i < resolved.center_lane.length; ++i) {
        resolved.center_lane[i] = LaneletLane.Resolve(msg.center_lane[i]);
      }
    }
    else {
      resolved.center_lane = []
    }

    return resolved;
    }
};

module.exports = LaneletRoute;
