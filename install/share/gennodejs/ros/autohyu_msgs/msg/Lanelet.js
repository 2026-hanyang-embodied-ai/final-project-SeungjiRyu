// Auto-generated. Do not edit!

// (in-package autohyu_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let LaneletRelation = require('./LaneletRelation.js');
let LaneletTrafficSign = require('./LaneletTrafficSign.js');
let LaneletTrafficLight = require('./LaneletTrafficLight.js');

//-----------------------------------------------------------

class Lanelet {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.is_ego = null;
      this.is_goal = null;
      this.is_shortest_path = null;
      this.left_boundary_line_id = null;
      this.right_boundary_line_id = null;
      this.relation = null;
      this.traffic_sign = null;
      this.turn_signal = null;
      this.traffic_light = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('is_ego')) {
        this.is_ego = initObj.is_ego
      }
      else {
        this.is_ego = false;
      }
      if (initObj.hasOwnProperty('is_goal')) {
        this.is_goal = initObj.is_goal
      }
      else {
        this.is_goal = false;
      }
      if (initObj.hasOwnProperty('is_shortest_path')) {
        this.is_shortest_path = initObj.is_shortest_path
      }
      else {
        this.is_shortest_path = false;
      }
      if (initObj.hasOwnProperty('left_boundary_line_id')) {
        this.left_boundary_line_id = initObj.left_boundary_line_id
      }
      else {
        this.left_boundary_line_id = 0;
      }
      if (initObj.hasOwnProperty('right_boundary_line_id')) {
        this.right_boundary_line_id = initObj.right_boundary_line_id
      }
      else {
        this.right_boundary_line_id = 0;
      }
      if (initObj.hasOwnProperty('relation')) {
        this.relation = initObj.relation
      }
      else {
        this.relation = [];
      }
      if (initObj.hasOwnProperty('traffic_sign')) {
        this.traffic_sign = initObj.traffic_sign
      }
      else {
        this.traffic_sign = [];
      }
      if (initObj.hasOwnProperty('turn_signal')) {
        this.turn_signal = initObj.turn_signal
      }
      else {
        this.turn_signal = [];
      }
      if (initObj.hasOwnProperty('traffic_light')) {
        this.traffic_light = initObj.traffic_light
      }
      else {
        this.traffic_light = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Lanelet
    // Serialize message field [id]
    bufferOffset = _serializer.int64(obj.id, buffer, bufferOffset);
    // Serialize message field [is_ego]
    bufferOffset = _serializer.bool(obj.is_ego, buffer, bufferOffset);
    // Serialize message field [is_goal]
    bufferOffset = _serializer.bool(obj.is_goal, buffer, bufferOffset);
    // Serialize message field [is_shortest_path]
    bufferOffset = _serializer.bool(obj.is_shortest_path, buffer, bufferOffset);
    // Serialize message field [left_boundary_line_id]
    bufferOffset = _serializer.int64(obj.left_boundary_line_id, buffer, bufferOffset);
    // Serialize message field [right_boundary_line_id]
    bufferOffset = _serializer.int64(obj.right_boundary_line_id, buffer, bufferOffset);
    // Serialize message field [relation]
    // Serialize the length for message field [relation]
    bufferOffset = _serializer.uint32(obj.relation.length, buffer, bufferOffset);
    obj.relation.forEach((val) => {
      bufferOffset = LaneletRelation.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [traffic_sign]
    // Serialize the length for message field [traffic_sign]
    bufferOffset = _serializer.uint32(obj.traffic_sign.length, buffer, bufferOffset);
    obj.traffic_sign.forEach((val) => {
      bufferOffset = LaneletTrafficSign.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [turn_signal]
    // Serialize the length for message field [turn_signal]
    bufferOffset = _serializer.uint32(obj.turn_signal.length, buffer, bufferOffset);
    obj.turn_signal.forEach((val) => {
      bufferOffset = LaneletTrafficSign.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [traffic_light]
    // Serialize the length for message field [traffic_light]
    bufferOffset = _serializer.uint32(obj.traffic_light.length, buffer, bufferOffset);
    obj.traffic_light.forEach((val) => {
      bufferOffset = LaneletTrafficLight.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Lanelet
    let len;
    let data = new Lanelet(null);
    // Deserialize message field [id]
    data.id = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [is_ego]
    data.is_ego = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [is_goal]
    data.is_goal = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [is_shortest_path]
    data.is_shortest_path = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [left_boundary_line_id]
    data.left_boundary_line_id = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [right_boundary_line_id]
    data.right_boundary_line_id = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [relation]
    // Deserialize array length for message field [relation]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.relation = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.relation[i] = LaneletRelation.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [traffic_sign]
    // Deserialize array length for message field [traffic_sign]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.traffic_sign = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.traffic_sign[i] = LaneletTrafficSign.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [turn_signal]
    // Deserialize array length for message field [turn_signal]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.turn_signal = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.turn_signal[i] = LaneletTrafficSign.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [traffic_light]
    // Deserialize array length for message field [traffic_light]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.traffic_light = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.traffic_light[i] = LaneletTrafficLight.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 9 * object.relation.length;
    object.traffic_sign.forEach((val) => {
      length += LaneletTrafficSign.getMessageSize(val);
    });
    object.turn_signal.forEach((val) => {
      length += LaneletTrafficSign.getMessageSize(val);
    });
    object.traffic_light.forEach((val) => {
      length += LaneletTrafficLight.getMessageSize(val);
    });
    return length + 43;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/Lanelet';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '70053e1f1419d63eb5b6723712e051a8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Lanelet(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.is_ego !== undefined) {
      resolved.is_ego = msg.is_ego;
    }
    else {
      resolved.is_ego = false
    }

    if (msg.is_goal !== undefined) {
      resolved.is_goal = msg.is_goal;
    }
    else {
      resolved.is_goal = false
    }

    if (msg.is_shortest_path !== undefined) {
      resolved.is_shortest_path = msg.is_shortest_path;
    }
    else {
      resolved.is_shortest_path = false
    }

    if (msg.left_boundary_line_id !== undefined) {
      resolved.left_boundary_line_id = msg.left_boundary_line_id;
    }
    else {
      resolved.left_boundary_line_id = 0
    }

    if (msg.right_boundary_line_id !== undefined) {
      resolved.right_boundary_line_id = msg.right_boundary_line_id;
    }
    else {
      resolved.right_boundary_line_id = 0
    }

    if (msg.relation !== undefined) {
      resolved.relation = new Array(msg.relation.length);
      for (let i = 0; i < resolved.relation.length; ++i) {
        resolved.relation[i] = LaneletRelation.Resolve(msg.relation[i]);
      }
    }
    else {
      resolved.relation = []
    }

    if (msg.traffic_sign !== undefined) {
      resolved.traffic_sign = new Array(msg.traffic_sign.length);
      for (let i = 0; i < resolved.traffic_sign.length; ++i) {
        resolved.traffic_sign[i] = LaneletTrafficSign.Resolve(msg.traffic_sign[i]);
      }
    }
    else {
      resolved.traffic_sign = []
    }

    if (msg.turn_signal !== undefined) {
      resolved.turn_signal = new Array(msg.turn_signal.length);
      for (let i = 0; i < resolved.turn_signal.length; ++i) {
        resolved.turn_signal[i] = LaneletTrafficSign.Resolve(msg.turn_signal[i]);
      }
    }
    else {
      resolved.turn_signal = []
    }

    if (msg.traffic_light !== undefined) {
      resolved.traffic_light = new Array(msg.traffic_light.length);
      for (let i = 0; i < resolved.traffic_light.length; ++i) {
        resolved.traffic_light[i] = LaneletTrafficLight.Resolve(msg.traffic_light[i]);
      }
    }
    else {
      resolved.traffic_light = []
    }

    return resolved;
    }
};

module.exports = Lanelet;
