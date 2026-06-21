// Auto-generated. Do not edit!

// (in-package autohyu_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let PlanningSpace = require('./PlanningSpace.js');
let Trajectory = require('./Trajectory.js');

//-----------------------------------------------------------

class PlanningInputOutput {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.planning_space = null;
      this.trajectory = null;
    }
    else {
      if (initObj.hasOwnProperty('planning_space')) {
        this.planning_space = initObj.planning_space
      }
      else {
        this.planning_space = new PlanningSpace();
      }
      if (initObj.hasOwnProperty('trajectory')) {
        this.trajectory = initObj.trajectory
      }
      else {
        this.trajectory = new Trajectory();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PlanningInputOutput
    // Serialize message field [planning_space]
    bufferOffset = PlanningSpace.serialize(obj.planning_space, buffer, bufferOffset);
    // Serialize message field [trajectory]
    bufferOffset = Trajectory.serialize(obj.trajectory, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PlanningInputOutput
    let len;
    let data = new PlanningInputOutput(null);
    // Deserialize message field [planning_space]
    data.planning_space = PlanningSpace.deserialize(buffer, bufferOffset);
    // Deserialize message field [trajectory]
    data.trajectory = Trajectory.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += PlanningSpace.getMessageSize(object.planning_space);
    length += Trajectory.getMessageSize(object.trajectory);
    return length;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autohyu_msgs/PlanningInputOutput';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e3bbd898c147fd581aa2270138357337';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    autohyu_msgs/PlanningSpace planning_space
    autohyu_msgs/Trajectory    trajectory
    
    ================================================================================
    MSG: autohyu_msgs/PlanningSpace
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
    ================================================================================
    MSG: autohyu_msgs/Trajectory
    # std_msgs/Header
    std_msgs/Header header
    
    uint16 id
    autohyu_msgs/TrajectoryPoint[] point
    ================================================================================
    MSG: autohyu_msgs/TrajectoryPoint
    float32 time
    float32 distance
    uint16  direction
    float32 x
    float32 y
    float32 z
    float32 yaw
    float32 curvature
    float32 speed
    float32 acceleration
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PlanningInputOutput(null);
    if (msg.planning_space !== undefined) {
      resolved.planning_space = PlanningSpace.Resolve(msg.planning_space)
    }
    else {
      resolved.planning_space = new PlanningSpace()
    }

    if (msg.trajectory !== undefined) {
      resolved.trajectory = Trajectory.Resolve(msg.trajectory)
    }
    else {
      resolved.trajectory = new Trajectory()
    }

    return resolved;
    }
};

module.exports = PlanningInputOutput;
