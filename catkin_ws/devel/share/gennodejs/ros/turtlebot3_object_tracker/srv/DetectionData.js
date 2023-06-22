// Auto-generated. Do not edit!

// (in-package turtlebot3_object_tracker.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class DetectionDataRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.label = null;
    }
    else {
      if (initObj.hasOwnProperty('label')) {
        this.label = initObj.label
      }
      else {
        this.label = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DetectionDataRequest
    // Serialize message field [label]
    bufferOffset = _serializer.string(obj.label, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DetectionDataRequest
    let len;
    let data = new DetectionDataRequest(null);
    // Deserialize message field [label]
    data.label = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.label);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'turtlebot3_object_tracker/DetectionDataRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ea23f97416b04c6151d2b576c0665ac1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string label
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DetectionDataRequest(null);
    if (msg.label !== undefined) {
      resolved.label = msg.label;
    }
    else {
      resolved.label = ''
    }

    return resolved;
    }
};

class DetectionDataResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.bb_cx = null;
      this.bb_cy = null;
      this.bb_width = null;
      this.bb_height = null;
      this.img_width = null;
      this.img_height = null;
      this.flag = null;
    }
    else {
      if (initObj.hasOwnProperty('bb_cx')) {
        this.bb_cx = initObj.bb_cx
      }
      else {
        this.bb_cx = 0.0;
      }
      if (initObj.hasOwnProperty('bb_cy')) {
        this.bb_cy = initObj.bb_cy
      }
      else {
        this.bb_cy = 0.0;
      }
      if (initObj.hasOwnProperty('bb_width')) {
        this.bb_width = initObj.bb_width
      }
      else {
        this.bb_width = 0.0;
      }
      if (initObj.hasOwnProperty('bb_height')) {
        this.bb_height = initObj.bb_height
      }
      else {
        this.bb_height = 0.0;
      }
      if (initObj.hasOwnProperty('img_width')) {
        this.img_width = initObj.img_width
      }
      else {
        this.img_width = 0.0;
      }
      if (initObj.hasOwnProperty('img_height')) {
        this.img_height = initObj.img_height
      }
      else {
        this.img_height = 0.0;
      }
      if (initObj.hasOwnProperty('flag')) {
        this.flag = initObj.flag
      }
      else {
        this.flag = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DetectionDataResponse
    // Serialize message field [bb_cx]
    bufferOffset = _serializer.float64(obj.bb_cx, buffer, bufferOffset);
    // Serialize message field [bb_cy]
    bufferOffset = _serializer.float64(obj.bb_cy, buffer, bufferOffset);
    // Serialize message field [bb_width]
    bufferOffset = _serializer.float64(obj.bb_width, buffer, bufferOffset);
    // Serialize message field [bb_height]
    bufferOffset = _serializer.float64(obj.bb_height, buffer, bufferOffset);
    // Serialize message field [img_width]
    bufferOffset = _serializer.float64(obj.img_width, buffer, bufferOffset);
    // Serialize message field [img_height]
    bufferOffset = _serializer.float64(obj.img_height, buffer, bufferOffset);
    // Serialize message field [flag]
    bufferOffset = _serializer.string(obj.flag, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DetectionDataResponse
    let len;
    let data = new DetectionDataResponse(null);
    // Deserialize message field [bb_cx]
    data.bb_cx = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [bb_cy]
    data.bb_cy = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [bb_width]
    data.bb_width = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [bb_height]
    data.bb_height = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [img_width]
    data.img_width = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [img_height]
    data.img_height = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [flag]
    data.flag = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.flag);
    return length + 52;
  }

  static datatype() {
    // Returns string type for a service object
    return 'turtlebot3_object_tracker/DetectionDataResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '833a774d67a344a240d1abb6209c9f6a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 bb_cx
    float64 bb_cy
    float64 bb_width
    float64 bb_height
    float64 img_width
    float64 img_height
    string flag
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DetectionDataResponse(null);
    if (msg.bb_cx !== undefined) {
      resolved.bb_cx = msg.bb_cx;
    }
    else {
      resolved.bb_cx = 0.0
    }

    if (msg.bb_cy !== undefined) {
      resolved.bb_cy = msg.bb_cy;
    }
    else {
      resolved.bb_cy = 0.0
    }

    if (msg.bb_width !== undefined) {
      resolved.bb_width = msg.bb_width;
    }
    else {
      resolved.bb_width = 0.0
    }

    if (msg.bb_height !== undefined) {
      resolved.bb_height = msg.bb_height;
    }
    else {
      resolved.bb_height = 0.0
    }

    if (msg.img_width !== undefined) {
      resolved.img_width = msg.img_width;
    }
    else {
      resolved.img_width = 0.0
    }

    if (msg.img_height !== undefined) {
      resolved.img_height = msg.img_height;
    }
    else {
      resolved.img_height = 0.0
    }

    if (msg.flag !== undefined) {
      resolved.flag = msg.flag;
    }
    else {
      resolved.flag = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: DetectionDataRequest,
  Response: DetectionDataResponse,
  md5sum() { return '60c458eab0a342a86739c835cfee1fc3'; },
  datatype() { return 'turtlebot3_object_tracker/DetectionData'; }
};
