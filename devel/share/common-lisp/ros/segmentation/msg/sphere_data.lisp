; Auto-generated. Do not edit!


(cl:in-package segmentation-msg)


;//! \htmlinclude sphere_data.msg.html

(cl:defclass <sphere_data> (roslisp-msg-protocol:ros-message)
  ((sphere_data
    :reader sphere_data
    :initarg :sphere_data
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass sphere_data (<sphere_data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sphere_data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sphere_data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name segmentation-msg:<sphere_data> is deprecated: use segmentation-msg:sphere_data instead.")))

(cl:ensure-generic-function 'sphere_data-val :lambda-list '(m))
(cl:defmethod sphere_data-val ((m <sphere_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segmentation-msg:sphere_data-val is deprecated.  Use segmentation-msg:sphere_data instead.")
  (sphere_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sphere_data>) ostream)
  "Serializes a message object of type '<sphere_data>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sphere_data))))
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
   (cl:slot-value msg 'sphere_data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sphere_data>) istream)
  "Deserializes a message object of type '<sphere_data>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'sphere_data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sphere_data)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sphere_data>)))
  "Returns string type for a message object of type '<sphere_data>"
  "segmentation/sphere_data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sphere_data)))
  "Returns string type for a message object of type 'sphere_data"
  "segmentation/sphere_data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sphere_data>)))
  "Returns md5sum for a message object of type '<sphere_data>"
  "a9caba4b187ed22cae60b5d45f11e3f1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sphere_data)))
  "Returns md5sum for a message object of type 'sphere_data"
  "a9caba4b187ed22cae60b5d45f11e3f1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sphere_data>)))
  "Returns full string definition for message of type '<sphere_data>"
  (cl:format cl:nil "float64[] sphere_data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sphere_data)))
  "Returns full string definition for message of type 'sphere_data"
  (cl:format cl:nil "float64[] sphere_data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sphere_data>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sphere_data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sphere_data>))
  "Converts a ROS message object to a list"
  (cl:list 'sphere_data
    (cl:cons ':sphere_data (sphere_data msg))
))
