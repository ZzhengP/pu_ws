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

class processed_cylinder_data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.center = null;
      this.central_axis = null;
      this.radius = null;
    }
    else {
      if (initObj.hasOwnProperty('center')) {
        this.center = initObj.center
      }
      else {
        this.center = [];
      }
      if (initObj.hasOwnProperty('central_axis')) {
        this.central_axis = initObj.central_axis
      }
      else {
        this.central_axis = [];
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
    // Serializes a message object of type processed_cylinder_data
    // Serialize message field [center]
    bufferOffset = _arraySerializer.float64(obj.center, buffer, bufferOffset, null);
    // Serialize message field [central_axis]
    bufferOffset = _arraySerializer.float64(obj.central_axis, buffer, bufferOffset, null);
    // Serialize message field [radius]
    bufferOffset = _serializer.float64(obj.radius, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type processed_cylinder_data
    let len;
    let data = new processed_cylinder_data(null);
    // Deserialize message field [center]
    data.center = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [central_axis]
    data.central_axis = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [radius]
    data.radius = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.center.length;
    length += 8 * object.central_axis.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'segmentation/processed_cylinder_data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'af9d26870351f883860103b94fc08d9c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] center
    float64[] central_axis
    float64 radius
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new processed_cylinder_data(null);
    if (msg.center !== undefined) {
      resolved.center = msg.center;
    }
    else {
      resolved.center = []
    }

    if (msg.central_axis !== undefined) {
      resolved.central_axis = msg.central_axis;
    }
    else {
      resolved.central_axis = []
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

module.exports = processed_cylinder_data;
