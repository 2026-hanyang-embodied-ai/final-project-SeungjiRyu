// Auto-generated. Do not edit!

// (in-package autohyu_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let PlanningSpacePoint = require('./PlanningSpacePoint.js');

//-----------------------------------------------------------

class PlanningSpaceVectorMap {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.is_dividing_lane = null;
      this.traffic_light_id = null;
      this.traffic_light_color = null;
      this.max_speed = null;
      this.point = null;
      this.left_boundary = null;
      this.right_boundary = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('is_dividing_lane')) {
        this.is_dividing_lane = initObj.is_dividing_lane
      }
      else {
        this.is_dividing_lane = false;
      }
      if (initObj.hasOwnProperty('traffic_light_id')) {
        this.traffic_light_id = initObj.traffic_light_id
      }
      else {
        this.traffic_light_id = 0;
      }
      if (initObj.hasOwnProperty('traffic_light_color')) {
        this.traffic_light_color = initObj.traffic_light_color
      }
      else {
        this.traffic_light_color = 0;
      }
      if (initObj.hasOwnProperty('max_speed')) {
        this.max_speed = initObj.max_speed
      }
      else {
        this.max_speed = 0.0;
      }
      if (initObj.hasOwnProperty('point')) {
        this.point = initObj.point
      }
      else {
        this.point = [];
      }
      if (initObj.hasOwnProperty('left_boundary')) {
        this.left_boundary = initObj.left_boundary
      }
      else {
        this.left_boundary = [];
      }
      if (initObj.hasOwnProperty('right_boundary')) {
        this.right_boundary = initObj.right_boundary
      }
      else {
        this.right_boundary = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PlanningSpaceVectorMap
    // Serialize message field [id]
    bufferOffset = _serializer.int64(obj.id, buffer, bufferOffset);
    // Serialize message field [is_dividing_lane]
    bufferOffset = _serializer.bool(obj.is_dividing_lane, buffer, bufferOffset);
    // Serialize message field [traffic_light_id]
    bufferOffset = _serializer.int64(obj.traffic_light_id, buffer, bufferOffset);
    // Serialize message field [traffic_light_color]
    bufferOffset = _serializer.int32(obj.traffic_light_color, buffer, bufferOffset);
    // Serialize message field [max_speed]
    bufferOffset = _serializer.float64(obj.max_speed, buffer, bufferOffset);
    // Serialize message field [point]
    // Serialize the length for message field [point]
    bufferOffset = _serializer.uint32(obj.point.length, buffer, bufferOffset);
    obj.point.forEach((val) => {
      bufferOffset = PlanningSpacePoint.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [left_boundary]
    // Serialize the length for message field [left_boundary]
    bufferOffset = _serializer.uint32(obj.left_boundary.length, buffer, bufferOffset);
    obj.left_boundary.forEach((val) => {
      bufferOffset = PlanningSpacePoint.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [right_boundary]
    // Serialize the length for message field [right_boundary]
    bufferOffset = _serializer.uint32(obj.right_boundary.length, buffer, bufferOffset);
    obj.right_boundary.forEach((val) => {
      bufferOffset = PlanningSpacePoint.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PlanningSpaceVectorMap
    let len;
    let data = new PlanningSpaceVectorMap(null);
    // Deserialize message field [id]
    data.id = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [is_dividing_lane]
    data.is_dividing_lane = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [traffic_light_id]
    data.traffic_light_id = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [traffic_light_color]
    data.traffic_light_color = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [max_speed]
    data.max_speed = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [point]
    // Deserialize array length for message field [point]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.point = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.point[i] = PlanningSpacePoint.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [left_boundary]
    // Deserialize array length for message field [left_boundary]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.left_boundary = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.left_boundary[i] = PlanningSpacePoint.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [right_boundary]
    // Deserialize array length for message field [right_boundary]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.right_boundary = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.right_boundary[i] = PlanningSpacePoint.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.point.forEach((val) => {
      length += PlanningSpacePoint.getMessageSize(val);
    });
    object.left_boundary.forEach((val) => {
      length += PlanningSpacePoint.getMessageSize(val);
    });
    object.right_boundary.forEach((val) => {
      length += PlanningSpacePoint.getMessageSize(val);
    });
    return length + 41;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/PlanningSpaceVectorMap';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cfb901b2beee878505834aab53d39190';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new PlanningSpaceVectorMap(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.is_dividing_lane !== undefined) {
      resolved.is_dividing_lane = msg.is_dividing_lane;
    }
    else {
      resolved.is_dividing_lane = false
    }

    if (msg.traffic_light_id !== undefined) {
      resolved.traffic_light_id = msg.traffic_light_id;
    }
    else {
      resolved.traffic_light_id = 0
    }

    if (msg.traffic_light_color !== undefined) {
      resolved.traffic_light_color = msg.traffic_light_color;
    }
    else {
      resolved.traffic_light_color = 0
    }

    if (msg.max_speed !== undefined) {
      resolved.max_speed = msg.max_speed;
    }
    else {
      resolved.max_speed = 0.0
    }

    if (msg.point !== undefined) {
      resolved.point = new Array(msg.point.length);
      for (let i = 0; i < resolved.point.length; ++i) {
        resolved.point[i] = PlanningSpacePoint.Resolve(msg.point[i]);
      }
    }
    else {
      resolved.point = []
    }

    if (msg.left_boundary !== undefined) {
      resolved.left_boundary = new Array(msg.left_boundary.length);
      for (let i = 0; i < resolved.left_boundary.length; ++i) {
        resolved.left_boundary[i] = PlanningSpacePoint.Resolve(msg.left_boundary[i]);
      }
    }
    else {
      resolved.left_boundary = []
    }

    if (msg.right_boundary !== undefined) {
      resolved.right_boundary = new Array(msg.right_boundary.length);
      for (let i = 0; i < resolved.right_boundary.length; ++i) {
        resolved.right_boundary[i] = PlanningSpacePoint.Resolve(msg.right_boundary[i]);
      }
    }
    else {
      resolved.right_boundary = []
    }

    return resolved;
    }
};

module.exports = PlanningSpaceVectorMap;
