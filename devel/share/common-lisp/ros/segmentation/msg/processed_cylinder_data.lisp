; Auto-generated. Do not edit!


(cl:in-package segmentation-msg)


;//! \htmlinclude processed_cylinder_data.msg.html

(cl:defclass <processed_cylinder_data> (roslisp-msg-protocol:ros-message)
  ((center
    :reader center
    :initarg :center
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (central_axis
    :reader central_axis
    :initarg :central_axis
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (radius
    :reader radius
    :initarg :radius
    :type cl:float
    :initform 0.0))
)

(cl:defclass processed_cylinder_data (<processed_cylinder_data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <processed_cylinder_data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'processed_cylinder_data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name segmentation-msg:<processed_cylinder_data> is deprecated: use segmentation-msg:processed_cylinder_data instead.")))

(cl:ensure-generic-function 'center-val :lambda-list '(m))
(cl:defmethod center-val ((m <processed_cylinder_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segmentation-msg:center-val is deprecated.  Use segmentation-msg:center instead.")
  (center m))

(cl:ensure-generic-function 'central_axis-val :lambda-list '(m))
(cl:defmethod central_axis-val ((m <processed_cylinder_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segmentation-msg:central_axis-val is deprecated.  Use segmentation-msg:central_axis instead.")
  (central_axis m))

(cl:ensure-generic-function 'radius-val :lambda-list '(m))
(cl:defmethod radius-val ((m <processed_cylinder_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segmentation-msg:radius-val is deprecated.  Use segmentation-msg:radius instead.")
  (radius m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <processed_cylinder_data>) ostream)
  "Serializes a message object of type '<processed_cylinder_data>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'center))))
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
   (cl:slot-value msg 'center))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'central_axis))))
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
   (cl:slot-value msg 'central_axis))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'radius))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <processed_cylinder_data>) istream)
  "Deserializes a message object of type '<processed_cylinder_data>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'center) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'center)))
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
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'central_axis) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'central_axis)))
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'radius) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<processed_cylinder_data>)))
  "Returns string type for a message object of type '<processed_cylinder_data>"
  "segmentation/processed_cylinder_data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'processed_cylinder_data)))
  "Returns string type for a message object of type 'processed_cylinder_data"
  "segmentation/processed_cylinder_data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<processed_cylinder_data>)))
  "Returns md5sum for a message object of type '<processed_cylinder_data>"
  "af9d26870351f883860103b94fc08d9c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'processed_cylinder_data)))
  "Returns md5sum for a message object of type 'processed_cylinder_data"
  "af9d26870351f883860103b94fc08d9c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<processed_cylinder_data>)))
  "Returns full string definition for message of type '<processed_cylinder_data>"
  (cl:format cl:nil "float64[] center~%float64[] central_axis~%float64 radius~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'processed_cylinder_data)))
  "Returns full string definition for message of type 'processed_cylinder_data"
  (cl:format cl:nil "float64[] center~%float64[] central_axis~%float64 radius~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <processed_cylinder_data>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'center) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'central_axis) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <processed_cylinder_data>))
  "Converts a ROS message object to a list"
  (cl:list 'processed_cylinder_data
    (cl:cons ':center (center msg))
    (cl:cons ':central_axis (central_axis msg))
    (cl:cons ':radius (radius msg))
))
