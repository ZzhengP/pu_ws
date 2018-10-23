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

class sphere_data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sphere_data = null;
    }
    else {
      if (initObj.hasOwnProperty('sphere_data')) {
        this.sphere_data = initObj.sphere_data
      }
      else {
        this.sphere_data = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type sphere_data
    // Serialize message field [sphere_data]
    bufferOffset = _arraySerializer.float64(obj.sphere_data, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type sphere_data
    let len;
    let data = new sphere_data(null);
    // Deserialize message field [sphere_data]
    data.sphere_data = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.sphere_data.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'segmentation/sphere_data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a9caba4b187ed22cae60b5d45f11e3f1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] sphere_data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new sphere_data(null);
    if (msg.sphere_data !== undefined) {
      resolved.sphere_data = msg.sphere_data;
    }
    else {
      resolved.sphere_data = []
    }

    return resolved;
    }
};

module.exports = sphere_data;
