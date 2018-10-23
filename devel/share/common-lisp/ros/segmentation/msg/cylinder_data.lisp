; Auto-generated. Do not edit!


(cl:in-package segmentation-msg)


;//! \htmlinclude cylinder_data.msg.html

(cl:defclass <cylinder_data> (roslisp-msg-protocol:ros-message)
  ((cylinder_data
    :reader cylinder_data
    :initarg :cylinder_data
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass cylinder_data (<cylinder_data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cylinder_data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cylinder_data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name segmentation-msg:<cylinder_data> is deprecated: use segmentation-msg:cylinder_data instead.")))

(cl:ensure-generic-function 'cylinder_data-val :lambda-list '(m))
(cl:defmethod cylinder_data-val ((m <cylinder_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segmentation-msg:cylinder_data-val is deprecated.  Use segmentation-msg:cylinder_data instead.")
  (cylinder_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cylinder_data>) ostream)
  "Serializes a message object of type '<cylinder_data>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'cylinder_data))))
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
   (cl:slot-value msg 'cylinder_data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cylinder_data>) istream)
  "Deserializes a message object of type '<cylinder_data>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'cylinder_data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'cylinder_data)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cylinder_data>)))
  "Returns string type for a message object of type '<cylinder_data>"
  "segmentation/cylinder_data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cylinder_data)))
  "Returns string type for a message object of type 'cylinder_data"
  "segmentation/cylinder_data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cylinder_data>)))
  "Returns md5sum for a message object of type '<cylinder_data>"
  "1a4264b959f4524ebd65115710e486ae")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cylinder_data)))
  "Returns md5sum for a message object of type 'cylinder_data"
  "1a4264b959f4524ebd65115710e486ae")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cylinder_data>)))
  "Returns full string definition for message of type '<cylinder_data>"
  (cl:format cl:nil "float64[] cylinder_data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cylinder_data)))
  "Returns full string definition for message of type 'cylinder_data"
  (cl:format cl:nil "float64[] cylinder_data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cylinder_data>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'cylinder_data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cylinder_data>))
  "Converts a ROS message object to a list"
  (cl:list 'cylinder_data
    (cl:cons ':cylinder_data (cylinder_data msg))
))
