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

class cylinder_data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cylinder_data = null;
    }
    else {
      if (initObj.hasOwnProperty('cylinder_data')) {
        this.cylinder_data = initObj.cylinder_data
      }
      else {
        this.cylinder_data = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type cylinder_data
    // Serialize message field [cylinder_data]
    bufferOffset = _arraySerializer.float64(obj.cylinder_data, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type cylinder_data
    let len;
    let data = new cylinder_data(null);
    // Deserialize message field [cylinder_data]
    data.cylinder_data = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.cylinder_data.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'segmentation/cylinder_data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1a4264b959f4524ebd65115710e486ae';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] cylinder_data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new cylinder_data(null);
    if (msg.cylinder_data !== undefined) {
      resolved.cylinder_data = msg.cylinder_data;
    }
    else {
      resolved.cylinder_data = []
    }

    return resolved;
    }
};

module.exports = cylinder_data;
