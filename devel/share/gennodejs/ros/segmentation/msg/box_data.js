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

class box_data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.box_data = null;
    }
    else {
      if (initObj.hasOwnProperty('box_data')) {
        this.box_data = initObj.box_data
      }
      else {
        this.box_data = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type box_data
    // Serialize message field [box_data]
    bufferOffset = _arraySerializer.float64(obj.box_data, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type box_data
    let len;
    let data = new box_data(null);
    // Deserialize message field [box_data]
    data.box_data = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.box_data.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'segmentation/box_data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b2f69ad0d9506dd9f7955546117df699';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] box_data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new box_data(null);
    if (msg.box_data !== undefined) {
      resolved.box_data = msg.box_data;
    }
    else {
      resolved.box_data = []
    }

    return resolved;
    }
};

module.exports = box_data;
