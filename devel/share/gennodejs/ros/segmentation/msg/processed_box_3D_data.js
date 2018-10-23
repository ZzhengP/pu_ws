// Auto-generated. Do not edit!

// (in-package segmentation.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class processed_box_3D_data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.center = null;
      this.longestEdgeLen = null;
      this.medianEdgeLen = null;
      this.shortestEdgeLen = null;
      this.longestEdgeDir = null;
      this.medianEdgeDir = null;
      this.shortestEdgeDir = null;
    }
    else {
      if (initObj.hasOwnProperty('center')) {
        this.center = initObj.center
      }
      else {
        this.center = [];
      }
      if (initObj.hasOwnProperty('longestEdgeLen')) {
        this.longestEdgeLen = initObj.longestEdgeLen
      }
      else {
        this.longestEdgeLen = 0.0;
      }
      if (initObj.hasOwnProperty('medianEdgeLen')) {
        this.medianEdgeLen = initObj.medianEdgeLen
      }
      else {
        this.medianEdgeLen = 0.0;
      }
      if (initObj.hasOwnProperty('shortestEdgeLen')) {
        this.shortestEdgeLen = initObj.shortestEdgeLen
      }
      else {
        this.shortestEdgeLen = 0.0;
      }
      if (initObj.hasOwnProperty('longestEdgeDir')) {
        this.longestEdgeDir = initObj.longestEdgeDir
      }
      else {
        this.longestEdgeDir = [];
      }
      if (initObj.hasOwnProperty('medianEdgeDir')) {
        this.medianEdgeDir = initObj.medianEdgeDir
      }
      else {
        this.medianEdgeDir = [];
      }
      if (initObj.hasOwnProperty('shortestEdgeDir')) {
        this.shortestEdgeDir = initObj.shortestEdgeDir
      }
      else {
        this.shortestEdgeDir = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type processed_box_3D_data
    // Serialize message field [center]
    bufferOffset = _arraySerializer.float64(obj.center, buffer, bufferOffset, null);
    // Serialize message field [longestEdgeLen]
    bufferOffset = _serializer.float64(obj.longestEdgeLen, buffer, bufferOffset);
    // Serialize message field [medianEdgeLen]
    bufferOffset = _serializer.float64(obj.medianEdgeLen, buffer, bufferOffset);
    // Serialize message field [shortestEdgeLen]
    bufferOffset = _serializer.float64(obj.shortestEdgeLen, buffer, bufferOffset);
    // Serialize message field [longestEdgeDir]
    bufferOffset = _arraySerializer.float64(obj.longestEdgeDir, buffer, bufferOffset, null);
    // Serialize message field [medianEdgeDir]
    bufferOffset = _arraySerializer.float64(obj.medianEdgeDir, buffer, bufferOffset, null);
    // Serialize message field [shortestEdgeDir]
    bufferOffset = _arraySerializer.float64(obj.shortestEdgeDir, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type processed_box_3D_data
    let len;
    let data = new processed_box_3D_data(null);
    // Deserialize message field [center]
    data.center = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [longestEdgeLen]
    data.longestEdgeLen = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [medianEdgeLen]
    data.medianEdgeLen = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [shortestEdgeLen]
    data.shortestEdgeLen = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [longestEdgeDir]
    data.longestEdgeDir = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [medianEdgeDir]
    data.medianEdgeDir = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [shortestEdgeDir]
    data.shortestEdgeDir = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.center.length;
    length += 8 * object.longestEdgeDir.length;
    length += 8 * object.medianEdgeDir.length;
    length += 8 * object.shortestEdgeDir.length;
    return length + 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'segmentation/processed_box_3D_data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4ef979cbe8c870ca365c89208698d6f7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] center
    float64 longestEdgeLen
    float64 medianEdgeLen
    float64 shortestEdgeLen
    float64[] longestEdgeDir
    float64[] medianEdgeDir
    float64[] shortestEdgeDir
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new processed_box_3D_data(null);
    if (msg.center !== undefined) {
      resolved.center = msg.center;
    }
    else {
      resolved.center = []
    }

    if (msg.longestEdgeLen !== undefined) {
      resolved.longestEdgeLen = msg.longestEdgeLen;
    }
    else {
      resolved.longestEdgeLen = 0.0
    }

    if (msg.medianEdgeLen !== undefined) {
      resolved.medianEdgeLen = msg.medianEdgeLen;
    }
    else {
      resolved.medianEdgeLen = 0.0
    }

    if (msg.shortestEdgeLen !== undefined) {
      resolved.shortestEdgeLen = msg.shortestEdgeLen;
    }
    else {
      resolved.shortestEdgeLen = 0.0
    }

    if (msg.longestEdgeDir !== undefined) {
      resolved.longestEdgeDir = msg.longestEdgeDir;
    }
    else {
      resolved.longestEdgeDir = []
    }

    if (msg.medianEdgeDir !== undefined) {
      resolved.medianEdgeDir = msg.medianEdgeDir;
    }
    else {
      resolved.medianEdgeDir = []
    }

    if (msg.shortestEdgeDir !== undefined) {
      resolved.shortestEdgeDir = msg.shortestEdgeDir;
    }
    else {
      resolved.shortestEdgeDir = []
    }

    return resolved;
    }
};

module.exports = processed_box_3D_data;
