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

class processed_sphere_data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.center = null;
      this.radius = null;
    }
    else {
      if (initObj.hasOwnProperty('center')) {
        this.center = initObj.center
      }
      else {
        this.center = [];
      }
      if (initObj.hasOwnProperty('radius')) {
        this.radius = initObj.radius
      }
      else {
        this.radius = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type processed_sphere_data
    // Serialize message field [center]
    bufferOffset = _arraySerializer.float64(obj.center, buffer, bufferOffset, null);
    // Serialize message field [radius]
    bufferOffset = _serializer.float64(obj.radius, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type processed_sphere_data
    let len;
    let data = new processed_sphere_data(null);
    // Deserialize message field [center]
    data.center = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [radius]
    data.radius = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.center.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'segmentation/processed_sphere_data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e2cb214aacb9b0a8737c65ce951a95d8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] center
    float64 radius
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new processed_sphere_data(null);
    if (msg.center !== undefined) {
      resolved.center = msg.center;
    }
    else {
      resolved.center = []
    }

    if (msg.radius !== undefined) {
      resolved.radius = msg.radius;
    }
    else {
      resolved.radius = 0.0
    }

    return resolved;
    }
};

module.exports = processed_sphere_data;
