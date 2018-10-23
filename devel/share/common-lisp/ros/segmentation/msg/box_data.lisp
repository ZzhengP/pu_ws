; Auto-generated. Do not edit!


(cl:in-package segmentation-msg)


;//! \htmlinclude box_data.msg.html

(cl:defclass <box_data> (roslisp-msg-protocol:ros-message)
  ((box_data
    :reader box_data
    :initarg :box_data
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass box_data (<box_data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <box_data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'box_data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name segmentation-msg:<box_data> is deprecated: use segmentation-msg:box_data instead.")))

(cl:ensure-generic-function 'box_data-val :lambda-list '(m))
(cl:defmethod box_data-val ((m <box_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segmentation-msg:box_data-val is deprecated.  Use segmentation-msg:box_data instead.")
  (box_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <box_data>) ostream)
  "Serializes a message object of type '<box_data>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'box_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'box_data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <box_data>) istream)
  "Deserializes a message object of type '<box_data>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'box_data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'box_data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<box_data>)))
  "Returns string type for a message object of type '<box_data>"
  "segmentation/box_data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'box_data)))
  "Returns string type for a message object of type 'box_data"
  "segmentation/box_data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<box_data>)))
  "Returns md5sum for a message object of type '<box_data>"
  "b2f69ad0d9506dd9f7955546117df699")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'box_data)))
  "Returns md5sum for a message object of type 'box_data"
  "b2f69ad0d9506dd9f7955546117df699")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<box_data>)))
  "Returns full string definition for message of type '<box_data>"
  (cl:format cl:nil "float64[] box_data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'box_data)))
  "Returns full string definition for message of type 'box_data"
  (cl:format cl:nil "float64[] box_data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <box_data>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'box_data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <box_data>))
  "Converts a ROS message object to a list"
  (cl:list 'box_data
    (cl:cons ':box_data (box_data msg))
))
