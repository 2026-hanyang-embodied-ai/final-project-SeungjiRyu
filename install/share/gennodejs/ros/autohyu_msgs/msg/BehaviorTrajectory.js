// Auto-generated. Do not edit!

// (in-package autohyu_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let TrajectoryBoundary = require('./TrajectoryBoundary.js');
let SpatialTrajectory = require('./SpatialTrajectory.js');
let TemporalTrajectory = require('./TemporalTrajectory.js');
let BehaviorTrajectoryPoint = require('./BehaviorTrajectoryPoint.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class BehaviorTrajectory {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.id = null;
      this.on_ego = null;
      this.left_boundary = null;
      this.right_boundary = null;
      this.spatial_trajectory = null;
      this.temporal_trajectory = null;
      this.point = null;
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
      if (initObj.hasOwnProperty('on_ego')) {
        this.on_ego = initObj.on_ego
      }
      else {
        this.on_ego = 0;
      }
      if (initObj.hasOwnProperty('left_boundary')) {
        this.left_boundary = initObj.left_boundary
      }
      else {
        this.left_boundary = new TrajectoryBoundary();
      }
      if (initObj.hasOwnProperty('right_boundary')) {
        this.right_boundary = initObj.right_boundary
      }
      else {
        this.right_boundary = new TrajectoryBoundary();
      }
      if (initObj.hasOwnProperty('spatial_trajectory')) {
        this.spatial_trajectory = initObj.spatial_trajectory
      }
      else {
        this.spatial_trajectory = new SpatialTrajectory();
      }
      if (initObj.hasOwnProperty('temporal_trajectory')) {
        this.temporal_trajectory = initObj.temporal_trajectory
      }
      else {
        this.temporal_trajectory = new TemporalTrajectory();
      }
      if (initObj.hasOwnProperty('point')) {
        this.point = initObj.point
      }
      else {
        this.point = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BehaviorTrajectory
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.uint32(obj.id, buffer, bufferOffset);
    // Serialize message field [on_ego]
    bufferOffset = _serializer.uint16(obj.on_ego, buffer, bufferOffset);
    // Serialize message field [left_boundary]
    bufferOffset = TrajectoryBoundary.serialize(obj.left_boundary, buffer, bufferOffset);
    // Serialize message field [right_boundary]
    bufferOffset = TrajectoryBoundary.serialize(obj.right_boundary, buffer, bufferOffset);
    // Serialize message field [spatial_trajectory]
    bufferOffset = SpatialTrajectory.serialize(obj.spatial_trajectory, buffer, bufferOffset);
    // Serialize message field [temporal_trajectory]
    bufferOffset = TemporalTrajectory.serialize(obj.temporal_trajectory, buffer, bufferOffset);
    // Serialize message field [point]
    // Serialize the length for message field [point]
    bufferOffset = _serializer.uint32(obj.point.length, buffer, bufferOffset);
    obj.point.forEach((val) => {
      bufferOffset = BehaviorTrajectoryPoint.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BehaviorTrajectory
    let len;
    let data = new BehaviorTrajectory(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [on_ego]
    data.on_ego = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [left_boundary]
    data.left_boundary = TrajectoryBoundary.deserialize(buffer, bufferOffset);
    // Deserialize message field [right_boundary]
    data.right_boundary = TrajectoryBoundary.deserialize(buffer, bufferOffset);
    // Deserialize message field [spatial_trajectory]
    data.spatial_trajectory = SpatialTrajectory.deserialize(buffer, bufferOffset);
    // Deserialize message field [temporal_trajectory]
    data.temporal_trajectory = TemporalTrajectory.deserialize(buffer, bufferOffset);
    // Deserialize message field [point]
    // Deserialize array length for message field [point]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.point = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.point[i] = BehaviorTrajectoryPoint.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += TrajectoryBoundary.getMessageSize(object.left_boundary);
    length += TrajectoryBoundary.getMessageSize(object.right_boundary);
    length += SpatialTrajectory.getMessageSize(object.spatial_trajectory);
    length += TemporalTrajectory.getMessageSize(object.temporal_trajectory);
    length += 67 * object.point.length;
    return length + 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/BehaviorTrajectory';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '618077a927e8fc3bc8c10db54e2ae18e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header 
    uint32 id
    uint16 on_ego
    
    autohyu_msgs/TrajectoryBoundary left_boundary
    autohyu_msgs/TrajectoryBoundary right_boundary
    autohyu_msgs/SpatialTrajectory spatial_trajectory
    autohyu_msgs/TemporalTrajectory temporal_trajectory
    autohyu_msgs/BehaviorTrajectoryPoint[] point
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
    MSG: autohyu_msgs/TrajectoryBoundary
    autohyu_msgs/TrajectoryBoundaryPoint[] point
    ================================================================================
    MSG: autohyu_msgs/TrajectoryBoundaryPoint
    float32 x
    float32 y
    float32 z
    float32 s
    float32 n
    ================================================================================
    MSG: autohyu_msgs/SpatialTrajectory
    autohyu_msgs/SpatialTrajectoryPoint[] point
    ================================================================================
    MSG: autohyu_msgs/SpatialTrajectoryPoint
    float32 x
    float32 y
    float32 z
    bool on_shortest_path
    int16 lane_num
    ================================================================================
    MSG: autohyu_msgs/TemporalTrajectory
    autohyu_msgs/TemporalTrajectoryPoint[] point
    ================================================================================
    MSG: autohyu_msgs/TemporalTrajectoryPoint
    float32 time
    float32 distance
    float32 curvature
    float32 speed
    float32 ref_speed
    ================================================================================
    MSG: autohyu_msgs/BehaviorTrajectoryPoint
    float64 time
    float64 distance
    float64 x
    float64 y
    float64 z
    float64 curvature
    float64 speed
    float64 max_speed
    bool    on_shortest_path
    int16   lane_num
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BehaviorTrajectory(null);
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

    if (msg.on_ego !== undefined) {
      resolved.on_ego = msg.on_ego;
    }
    else {
      resolved.on_ego = 0
    }

    if (msg.left_boundary !== undefined) {
      resolved.left_boundary = TrajectoryBoundary.Resolve(msg.left_boundary)
    }
    else {
      resolved.left_boundary = new TrajectoryBoundary()
    }

    if (msg.right_boundary !== undefined) {
      resolved.right_boundary = TrajectoryBoundary.Resolve(msg.right_boundary)
    }
    else {
      resolved.right_boundary = new TrajectoryBoundary()
    }

    if (msg.spatial_trajectory !== undefined) {
      resolved.spatial_trajectory = SpatialTrajectory.Resolve(msg.spatial_trajectory)
    }
    else {
      resolved.spatial_trajectory = new SpatialTrajectory()
    }

    if (msg.temporal_trajectory !== undefined) {
      resolved.temporal_trajectory = TemporalTrajectory.Resolve(msg.temporal_trajectory)
    }
    else {
      resolved.temporal_trajectory = new TemporalTrajectory()
    }

    if (msg.point !== undefined) {
      resolved.point = new Array(msg.point.length);
      for (let i = 0; i < resolved.point.length; ++i) {
        resolved.point[i] = BehaviorTrajectoryPoint.Resolve(msg.point[i]);
      }
    }
    else {
      resolved.point = []
    }

    return resolved;
    }
};

module.exports = BehaviorTrajectory;
