// Auto-generated. Do not edit!

// (in-package carmaker_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ObjectState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.latitude = null;
      this.longitude = null;
      this.elevation = null;
      this.x = null;
      this.y = null;
      this.z = null;
      this.roll = null;
      this.pitch = null;
      this.yaw = null;
      this.ego_roll = null;
      this.ego_pitch = null;
      this.ego_yaw = null;
      this.roll_rate = null;
      this.pitch_rate = null;
      this.yaw_rate = null;
      this.v_x = null;
      this.v_y = null;
      this.a_x = null;
      this.a_y = null;
    }
    else {
      if (initObj.hasOwnProperty('latitude')) {
        this.latitude = initObj.latitude
      }
      else {
        this.latitude = 0.0;
      }
      if (initObj.hasOwnProperty('longitude')) {
        this.longitude = initObj.longitude
      }
      else {
        this.longitude = 0.0;
      }
      if (initObj.hasOwnProperty('elevation')) {
        this.elevation = initObj.elevation
      }
      else {
        this.elevation = 0.0;
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = 0.0;
      }
      if (initObj.hasOwnProperty('roll')) {
        this.roll = initObj.roll
      }
      else {
        this.roll = 0.0;
      }
      if (initObj.hasOwnProperty('pitch')) {
        this.pitch = initObj.pitch
      }
      else {
        this.pitch = 0.0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
      if (initObj.hasOwnProperty('ego_roll')) {
        this.ego_roll = initObj.ego_roll
      }
      else {
        this.ego_roll = 0.0;
      }
      if (initObj.hasOwnProperty('ego_pitch')) {
        this.ego_pitch = initObj.ego_pitch
      }
      else {
        this.ego_pitch = 0.0;
      }
      if (initObj.hasOwnProperty('ego_yaw')) {
        this.ego_yaw = initObj.ego_yaw
      }
      else {
        this.ego_yaw = 0.0;
      }
      if (initObj.hasOwnProperty('roll_rate')) {
        this.roll_rate = initObj.roll_rate
      }
      else {
        this.roll_rate = 0.0;
      }
      if (initObj.hasOwnProperty('pitch_rate')) {
        this.pitch_rate = initObj.pitch_rate
      }
      else {
        this.pitch_rate = 0.0;
      }
      if (initObj.hasOwnProperty('yaw_rate')) {
        this.yaw_rate = initObj.yaw_rate
      }
      else {
        this.yaw_rate = 0.0;
      }
      if (initObj.hasOwnProperty('v_x')) {
        this.v_x = initObj.v_x
      }
      else {
        this.v_x = 0.0;
      }
      if (initObj.hasOwnProperty('v_y')) {
        this.v_y = initObj.v_y
      }
      else {
        this.v_y = 0.0;
      }
      if (initObj.hasOwnProperty('a_x')) {
        this.a_x = initObj.a_x
      }
      else {
        this.a_x = 0.0;
      }
      if (initObj.hasOwnProperty('a_y')) {
        this.a_y = initObj.a_y
      }
      else {
        this.a_y = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ObjectState
    // Serialize message field [latitude]
    bufferOffset = _serializer.float64(obj.latitude, buffer, bufferOffset);
    // Serialize message field [longitude]
    bufferOffset = _serializer.float64(obj.longitude, buffer, bufferOffset);
    // Serialize message field [elevation]
    bufferOffset = _serializer.float64(obj.elevation, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [z]
    bufferOffset = _serializer.float64(obj.z, buffer, bufferOffset);
    // Serialize message field [roll]
    bufferOffset = _serializer.float32(obj.roll, buffer, bufferOffset);
    // Serialize message field [pitch]
    bufferOffset = _serializer.float32(obj.pitch, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float32(obj.yaw, buffer, bufferOffset);
    // Serialize message field [ego_roll]
    bufferOffset = _serializer.float32(obj.ego_roll, buffer, bufferOffset);
    // Serialize message field [ego_pitch]
    bufferOffset = _serializer.float32(obj.ego_pitch, buffer, bufferOffset);
    // Serialize message field [ego_yaw]
    bufferOffset = _serializer.float32(obj.ego_yaw, buffer, bufferOffset);
    // Serialize message field [roll_rate]
    bufferOffset = _serializer.float32(obj.roll_rate, buffer, bufferOffset);
    // Serialize message field [pitch_rate]
    bufferOffset = _serializer.float32(obj.pitch_rate, buffer, bufferOffset);
    // Serialize message field [yaw_rate]
    bufferOffset = _serializer.float32(obj.yaw_rate, buffer, bufferOffset);
    // Serialize message field [v_x]
    bufferOffset = _serializer.float32(obj.v_x, buffer, bufferOffset);
    // Serialize message field [v_y]
    bufferOffset = _serializer.float32(obj.v_y, buffer, bufferOffset);
    // Serialize message field [a_x]
    bufferOffset = _serializer.float32(obj.a_x, buffer, bufferOffset);
    // Serialize message field [a_y]
    bufferOffset = _serializer.float32(obj.a_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ObjectState
    let len;
    let data = new ObjectState(null);
    // Deserialize message field [latitude]
    data.latitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [longitude]
    data.longitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [elevation]
    data.elevation = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [z]
    data.z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [roll]
    data.roll = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pitch]
    data.pitch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ego_roll]
    data.ego_roll = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ego_pitch]
    data.ego_pitch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ego_yaw]
    data.ego_yaw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [roll_rate]
    data.roll_rate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pitch_rate]
    data.pitch_rate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw_rate]
    data.yaw_rate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [v_x]
    data.v_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [v_y]
    data.v_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [a_x]
    data.a_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [a_y]
    data.a_y = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 100;
  }

  static datatype() {
    // Returns string type for a message object
    return 'carmaker_msgs/ObjectState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6a12156275044859859afbe394466b70';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 latitude                  # GCS Coordinates latitude
    float64 longitude                 # GCS Coordinates longitude
    float64 elevation                 # GCS Coordinates elevation
    
    float64 x
    float64 y
    float64 z
    
    float32 roll                      # yaw in vehicle coordinates [rad]
    float32 pitch                     # yaw in vehicle coordinates [rad]
    float32 yaw                       # yaw in vehicle coordinates [rad]
    float32 ego_roll                      # yaw in vehicle coordinates [rad]
    float32 ego_pitch                     # yaw in vehicle coordinates [rad]
    float32 ego_yaw                       # yaw in vehicle coordinates [rad]
    
    float32 roll_rate                      # yaw in vehicle coordinates [rad]
    float32 pitch_rate                     # yaw in vehicle coordinates [rad]
    float32 yaw_rate                       # yaw in vehicle coordinates [rad]
    
    float32 v_x                       # velocity in vehicle coordinates [m/s]
    float32 v_y                       # velocity in vehicle coordinates [m/s]
    float32 a_x                       # acceleration in vehicle coordinates [m/s^2]
    float32 a_y                       # acceleration in vehicle coordinates [m/s^2]
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ObjectState(null);
    if (msg.latitude !== undefined) {
      resolved.latitude = msg.latitude;
    }
    else {
      resolved.latitude = 0.0
    }

    if (msg.longitude !== undefined) {
      resolved.longitude = msg.longitude;
    }
    else {
      resolved.longitude = 0.0
    }

    if (msg.elevation !== undefined) {
      resolved.elevation = msg.elevation;
    }
    else {
      resolved.elevation = 0.0
    }

    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.z !== undefined) {
      resolved.z = msg.z;
    }
    else {
      resolved.z = 0.0
    }

    if (msg.roll !== undefined) {
      resolved.roll = msg.roll;
    }
    else {
      resolved.roll = 0.0
    }

    if (msg.pitch !== undefined) {
      resolved.pitch = msg.pitch;
    }
    else {
      resolved.pitch = 0.0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    if (msg.ego_roll !== undefined) {
      resolved.ego_roll = msg.ego_roll;
    }
    else {
      resolved.ego_roll = 0.0
    }

    if (msg.ego_pitch !== undefined) {
      resolved.ego_pitch = msg.ego_pitch;
    }
    else {
      resolved.ego_pitch = 0.0
    }

    if (msg.ego_yaw !== undefined) {
      resolved.ego_yaw = msg.ego_yaw;
    }
    else {
      resolved.ego_yaw = 0.0
    }

    if (msg.roll_rate !== undefined) {
      resolved.roll_rate = msg.roll_rate;
    }
    else {
      resolved.roll_rate = 0.0
    }

    if (msg.pitch_rate !== undefined) {
      resolved.pitch_rate = msg.pitch_rate;
    }
    else {
      resolved.pitch_rate = 0.0
    }

    if (msg.yaw_rate !== undefined) {
      resolved.yaw_rate = msg.yaw_rate;
    }
    else {
      resolved.yaw_rate = 0.0
    }

    if (msg.v_x !== undefined) {
      resolved.v_x = msg.v_x;
    }
    else {
      resolved.v_x = 0.0
    }

    if (msg.v_y !== undefined) {
      resolved.v_y = msg.v_y;
    }
    else {
      resolved.v_y = 0.0
    }

    if (msg.a_x !== undefined) {
      resolved.a_x = msg.a_x;
    }
    else {
      resolved.a_x = 0.0
    }

    if (msg.a_y !== undefined) {
      resolved.a_y = msg.a_y;
    }
    else {
      resolved.a_y = 0.0
    }

    return resolved;
    }
};

module.exports = ObjectState;
