// Auto-generated. Do not edit!

// (in-package project2_phase2.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class closest_object_pose {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.distance = null;
      this.direction = null;
    }
    else {
      if (initObj.hasOwnProperty('distance')) {
        this.distance = initObj.distance
      }
      else {
        this.distance = 0.0;
      }
      if (initObj.hasOwnProperty('direction')) {
        this.direction = initObj.direction
      }
      else {
        this.direction = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type closest_object_pose
    // Serialize message field [distance]
    bufferOffset = _serializer.float64(obj.distance, buffer, bufferOffset);
    // Serialize message field [direction]
    bufferOffset = _serializer.float64(obj.direction, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type closest_object_pose
    let len;
    let data = new closest_object_pose(null);
    // Deserialize message field [distance]
    data.distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [direction]
    data.direction = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'project2_phase2/closest_object_pose';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '408759c287897be1a1b77ecfff03e04a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 distance
    float64 direction
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new closest_object_pose(null);
    if (msg.distance !== undefined) {
      resolved.distance = msg.distance;
    }
    else {
      resolved.distance = 0.0
    }

    if (msg.direction !== undefined) {
      resolved.direction = msg.direction;
    }
    else {
      resolved.direction = 0.0
    }

    return resolved;
    }
};

module.exports = closest_object_pose;
