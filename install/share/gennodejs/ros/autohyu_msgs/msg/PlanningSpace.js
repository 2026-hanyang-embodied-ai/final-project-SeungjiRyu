// Auto-generated. Do not edit!

// (in-package autohyu_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let PlanningSpaceEgo = require('./PlanningSpaceEgo.js');
let PlanningSpaceObject = require('./PlanningSpaceObject.js');
let PlanningSpaceVectorMap = require('./PlanningSpaceVectorMap.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class PlanningSpace {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.ego = null;
      this.objects = null;
      this.lanes = null;
      this.routes = null;
      this.crosswalks = null;
      this.goal_routes = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('ego')) {
        this.ego = initObj.ego
      }
      else {
        this.ego = new PlanningSpaceEgo();
      }
      if (initObj.hasOwnProperty('objects')) {
        this.objects = initObj.objects
      }
      else {
        this.objects = [];
      }
      if (initObj.hasOwnProperty('lanes')) {
        this.lanes = initObj.lanes
      }
      else {
        this.lanes = [];
      }
      if (initObj.hasOwnProperty('routes')) {
        this.routes = initObj.routes
      }
      else {
        this.routes = [];
      }
      if (initObj.hasOwnProperty('crosswalks')) {
        this.crosswalks = initObj.crosswalks
      }
      else {
        this.crosswalks = [];
      }
      if (initObj.hasOwnProperty('goal_routes')) {
        this.goal_routes = initObj.goal_routes
      }
      else {
        this.goal_routes = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PlanningSpace
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [ego]
    bufferOffset = PlanningSpaceEgo.serialize(obj.ego, buffer, bufferOffset);
    // Serialize message field [objects]
    // Serialize the length for message field [objects]
    bufferOffset = _serializer.uint32(obj.objects.length, buffer, bufferOffset);
    obj.objects.forEach((val) => {
      bufferOffset = PlanningSpaceObject.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [lanes]
    // Serialize the length for message field [lanes]
    bufferOffset = _serializer.uint32(obj.lanes.length, buffer, bufferOffset);
    obj.lanes.forEach((val) => {
      bufferOffset = PlanningSpaceVectorMap.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [routes]
    // Serialize the length for message field [routes]
    bufferOffset = _serializer.uint32(obj.routes.length, buffer, bufferOffset);
    obj.routes.forEach((val) => {
      bufferOffset = PlanningSpaceVectorMap.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [crosswalks]
    // Serialize the length for message field [crosswalks]
    bufferOffset = _serializer.uint32(obj.crosswalks.length, buffer, bufferOffset);
    obj.crosswalks.forEach((val) => {
      bufferOffset = PlanningSpaceVectorMap.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [goal_routes]
    // Serialize the length for message field [goal_routes]
    bufferOffset = _serializer.uint32(obj.goal_routes.length, buffer, bufferOffset);
    obj.goal_routes.forEach((val) => {
      bufferOffset = PlanningSpaceVectorMap.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PlanningSpace
    let len;
    let data = new PlanningSpace(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [ego]
    data.ego = PlanningSpaceEgo.deserialize(buffer, bufferOffset);
    // Deserialize message field [objects]
    // Deserialize array length for message field [objects]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.objects = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.objects[i] = PlanningSpaceObject.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [lanes]
    // Deserialize array length for message field [lanes]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.lanes = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.lanes[i] = PlanningSpaceVectorMap.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [routes]
    // Deserialize array length for message field [routes]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.routes = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.routes[i] = PlanningSpaceVectorMap.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [crosswalks]
    // Deserialize array length for message field [crosswalks]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.crosswalks = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.crosswalks[i] = PlanningSpaceVectorMap.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [goal_routes]
    // Deserialize array length for message field [goal_routes]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.goal_routes = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.goal_routes[i] = PlanningSpaceVectorMap.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += PlanningSpaceEgo.getMessageSize(object.ego);
    object.objects.forEach((val) => {
      length += PlanningSpaceObject.getMessageSize(val);
    });
    object.lanes.forEach((val) => {
      length += PlanningSpaceVectorMap.getMessageSize(val);
    });
    object.routes.forEach((val) => {
      length += PlanningSpaceVectorMap.getMessageSize(val);
    });
    object.crosswalks.forEach((val) => {
      length += PlanningSpaceVectorMap.getMessageSize(val);
    });
    object.goal_routes.forEach((val) => {
      length += PlanningSpaceVectorMap.getMessageSize(val);
    });
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/PlanningSpace';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '687f829ec6579e0ea7ab55d15b5a120c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    
    # Ego
    autohyu_msgs/PlanningSpaceEgo ego
    
    # Objects
    autohyu_msgs/PlanningSpaceObject[] objects
    
    # Vector Map
    autohyu_msgs/PlanningSpaceVectorMap[] lanes
    autohyu_msgs/PlanningSpaceVectorMap[] routes
    autohyu_msgs/PlanningSpaceVectorMap[] crosswalks
    autohyu_msgs/PlanningSpaceVectorMap[] goal_routes
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
    MSG: autohyu_msgs/PlanningSpaceEgo
    autohyu_msgs/PlanningSpaceState[] state
    
    ================================================================================
    MSG: autohyu_msgs/PlanningSpaceState
    float64 stamp
    float64 x
    float64 y
    float64 heading
    float64 vx
    float64 vy
    float64 ax
    float64 ay
    float64 tire_angle
    ================================================================================
    MSG: autohyu_msgs/PlanningSpaceObject
    uint64  id
    float64 length
    float64 width
    float64 height
    uint16  classification
    
    autohyu_msgs/PlanningSpaceState[] state
    ================================================================================
    MSG: autohyu_msgs/PlanningSpaceVectorMap
    int64 id
    bool is_dividing_lane
    int64 traffic_light_id
    int32 traffic_light_color
    float64 max_speed
    autohyu_msgs/PlanningSpacePoint[] point
    autohyu_msgs/PlanningSpacePoint[] left_boundary
    autohyu_msgs/PlanningSpacePoint[] right_boundary
    ================================================================================
    MSG: autohyu_msgs/PlanningSpacePoint
    float64 x
    float64 y
    float64 heading
    string  traffic_light_id
    uint16  traffic_light_color
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PlanningSpace(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.ego !== undefined) {
      resolved.ego = PlanningSpaceEgo.Resolve(msg.ego)
    }
    else {
      resolved.ego = new PlanningSpaceEgo()
    }

    if (msg.objects !== undefined) {
      resolved.objects = new Array(msg.objects.length);
      for (let i = 0; i < resolved.objects.length; ++i) {
        resolved.objects[i] = PlanningSpaceObject.Resolve(msg.objects[i]);
      }
    }
    else {
      resolved.objects = []
    }

    if (msg.lanes !== undefined) {
      resolved.lanes = new Array(msg.lanes.length);
      for (let i = 0; i < resolved.lanes.length; ++i) {
        resolved.lanes[i] = PlanningSpaceVectorMap.Resolve(msg.lanes[i]);
      }
    }
    else {
      resolved.lanes = []
    }

    if (msg.routes !== undefined) {
      resolved.routes = new Array(msg.routes.length);
      for (let i = 0; i < resolved.routes.length; ++i) {
        resolved.routes[i] = PlanningSpaceVectorMap.Resolve(msg.routes[i]);
      }
    }
    else {
      resolved.routes = []
    }

    if (msg.crosswalks !== undefined) {
      resolved.crosswalks = new Array(msg.crosswalks.length);
      for (let i = 0; i < resolved.crosswalks.length; ++i) {
        resolved.crosswalks[i] = PlanningSpaceVectorMap.Resolve(msg.crosswalks[i]);
      }
    }
    else {
      resolved.crosswalks = []
    }

    if (msg.goal_routes !== undefined) {
      resolved.goal_routes = new Array(msg.goal_routes.length);
      for (let i = 0; i < resolved.goal_routes.length; ++i) {
        resolved.goal_routes[i] = PlanningSpaceVectorMap.Resolve(msg.goal_routes[i]);
      }
    }
    else {
      resolved.goal_routes = []
    }

    return resolved;
    }
};

module.exports = PlanningSpace;
