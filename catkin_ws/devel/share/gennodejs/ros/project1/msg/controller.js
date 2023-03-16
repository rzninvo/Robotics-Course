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

class controller {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.clockwise = null;
      this.theta = null;
    }
    else {
      if (initObj.hasOwnProperty('clockwise')) {
        this.clockwise = initObj.clockwise
      }
      else {
        this.clockwise = 0;
      }
      if (initObj.hasOwnProperty('theta')) {
        this.theta = initObj.theta
      }
      else {
        this.theta = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type controller
    // Serialize message field [clockwise]
    bufferOffset = _serializer.int16(obj.clockwise, buffer, bufferOffset);
    // Serialize message field [theta]
    bufferOffset = _serializer.int16(obj.theta, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type controller
    let len;
    let data = new controller(null);
    // Deserialize message field [clockwise]
    data.clockwise = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [theta]
    data.theta = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'project1/controller';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9453778c8293eaf018f21fc4ef7b8843';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16    clockwise
    int16    theta
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new controller(null);
    if (msg.clockwise !== undefined) {
      resolved.clockwise = msg.clockwise;
    }
    else {
      resolved.clockwise = 0
    }

    if (msg.theta !== undefined) {
      resolved.theta = msg.theta;
    }
    else {
      resolved.theta = 0
    }

    return resolved;
    }
};

module.exports = controller;
