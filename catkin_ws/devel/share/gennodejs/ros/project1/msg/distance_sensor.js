// Auto-generated. Do not edit!

// (in-package project1.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class distance_sensor {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.front = null;
      this.back = null;
      this.right = null;
      this.left = null;
    }
    else {
      if (initObj.hasOwnProperty('front')) {
        this.front = initObj.front
      }
      else {
        this.front = 0;
      }
      if (initObj.hasOwnProperty('back')) {
        this.back = initObj.back
      }
      else {
        this.back = 0;
      }
      if (initObj.hasOwnProperty('right')) {
        this.right = initObj.right
      }
      else {
        this.right = 0;
      }
      if (initObj.hasOwnProperty('left')) {
        this.left = initObj.left
      }
      else {
        this.left = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type distance_sensor
    // Serialize message field [front]
    bufferOffset = _serializer.int8(obj.front, buffer, bufferOffset);
    // Serialize message field [back]
    bufferOffset = _serializer.int8(obj.back, buffer, bufferOffset);
    // Serialize message field [right]
    bufferOffset = _serializer.int8(obj.right, buffer, bufferOffset);
    // Serialize message field [left]
    bufferOffset = _serializer.int8(obj.left, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type distance_sensor
    let len;
    let data = new distance_sensor(null);
    // Deserialize message field [front]
    data.front = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [back]
    data.back = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [right]
    data.right = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [left]
    data.left = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'project1/distance_sensor';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ed4e666c5e7c96f4232b8795fa5cafaa';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8    front
    int8    back
    int8    right
    int8    left
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new distance_sensor(null);
    if (msg.front !== undefined) {
      resolved.front = msg.front;
    }
    else {
      resolved.front = 0
    }

    if (msg.back !== undefined) {
      resolved.back = msg.back;
    }
    else {
      resolved.back = 0
    }

    if (msg.right !== undefined) {
      resolved.right = msg.right;
    }
    else {
      resolved.right = 0
    }

    if (msg.left !== undefined) {
      resolved.left = msg.left;
    }
    else {
      resolved.left = 0
    }

    return resolved;
    }
};

module.exports = distance_sensor;
