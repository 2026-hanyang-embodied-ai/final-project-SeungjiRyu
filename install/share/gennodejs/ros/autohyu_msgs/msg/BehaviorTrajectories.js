// Auto-generated. Do not edit!

// (in-package autohyu_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let BehaviorTrajectory = require('./BehaviorTrajectory.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class BehaviorTrajectories {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.lk_trajectory = null;
      this.llc_trajectory = null;
      this.rlc_trajectory = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('lk_trajectory')) {
        this.lk_trajectory = initObj.lk_trajectory
      }
      else {
        this.lk_trajectory = new BehaviorTrajectory();
      }
      if (initObj.hasOwnProperty('llc_trajectory')) {
        this.llc_trajectory = initObj.llc_trajectory
      }
      else {
        this.llc_trajectory = new BehaviorTrajectory();
      }
      if (initObj.hasOwnProperty('rlc_trajectory')) {
        this.rlc_trajectory = initObj.rlc_trajectory
      }
      else {
        this.rlc_trajectory = new BehaviorTrajectory();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BehaviorTrajectories
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [lk_trajectory]
    bufferOffset = BehaviorTrajectory.serialize(obj.lk_trajectory, buffer, bufferOffset);
    // Serialize message field [llc_trajectory]
    bufferOffset = BehaviorTrajectory.serialize(obj.llc_trajectory, buffer, bufferOffset);
    // Serialize message field [rlc_trajectory]
    bufferOffset = BehaviorTrajectory.serialize(obj.rlc_trajectory, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BehaviorTrajectories
    let len;
    let data = new BehaviorTrajectories(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [lk_trajectory]
    data.lk_trajectory = BehaviorTrajectory.deserialize(buffer, bufferOffset);
    // Deserialize message field [llc_trajectory]
    data.llc_trajectory = BehaviorTrajectory.deserialize(buffer, bufferOffset);
    // Deserialize message field [rlc_trajectory]
    data.rlc_trajectory = BehaviorTrajectory.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += BehaviorTrajectory.getMessageSize(object.lk_trajectory);
    length += BehaviorTrajectory.getMessageSize(object.llc_trajectory);
    length += BehaviorTrajectory.getMessageSize(object.rlc_trajectory);
    return length;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/BehaviorTrajectories';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '52400c4f5560d8aa896438806fcd541e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header 
    
    autohyu_msgs/BehaviorTrajectory lk_trajectory
    autohyu_msgs/BehaviorTrajectory llc_trajectory
    autohyu_msgs/BehaviorTrajectory rlc_trajectory
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
    MSG: autohyu_msgs/BehaviorTrajectory
    std_msgs/Header header 
    uint32 id
    uint16 on_ego
    
    autohyu_msgs/TrajectoryBoundary left_boundary
    autohyu_msgs/TrajectoryBoundary right_boundary
    autohyu_msgs/SpatialTrajectory spatial_trajectory
    autohyu_msgs/TemporalTrajectory temporal_trajectory
    autohyu_msgs/BehaviorTrajectoryPoint[] point
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
    const resolved = new BehaviorTrajectories(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.lk_trajectory !== undefined) {
      resolved.lk_trajectory = BehaviorTrajectory.Resolve(msg.lk_trajectory)
    }
    else {
      resolved.lk_trajectory = new BehaviorTrajectory()
    }

    if (msg.llc_trajectory !== undefined) {
      resolved.llc_trajectory = BehaviorTrajectory.Resolve(msg.llc_trajectory)
    }
    else {
      resolved.llc_trajectory = new BehaviorTrajectory()
    }

    if (msg.rlc_trajectory !== undefined) {
      resolved.rlc_trajectory = BehaviorTrajectory.Resolve(msg.rlc_trajectory)
    }
    else {
      resolved.rlc_trajectory = new BehaviorTrajectory()
    }

    return resolved;
    }
};

module.exports = BehaviorTrajectories;
