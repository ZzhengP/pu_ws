;; Auto-generated. Do not edit!


(when (boundp 'segmentation::processed_cylinder_data)
  (if (not (find-package "SEGMENTATION"))
    (make-package "SEGMENTATION"))
  (shadow 'processed_cylinder_data (find-package "SEGMENTATION")))
(unless (find-package "SEGMENTATION::PROCESSED_CYLINDER_DATA")
  (make-package "SEGMENTATION::PROCESSED_CYLINDER_DATA"))

(in-package "ROS")
;;//! \htmlinclude processed_cylinder_data.msg.html


(defclass segmentation::processed_cylinder_data
  :super ros::object
  :slots (_center _central_axis _radius ))

(defmethod segmentation::processed_cylinder_data
  (:init
   (&key
    ((:center __center) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:central_axis __central_axis) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:radius __radius) 0.0)
    )
   (send-super :init)
   (setq _center __center)
   (setq _central_axis __central_axis)
   (setq _radius (float __radius))
   self)
  (:center
   (&optional __center)
   (if __center (setq _center __center)) _center)
  (:central_axis
   (&optional __central_axis)
   (if __central_axis (setq _central_axis __central_axis)) _central_axis)
  (:radius
   (&optional __radius)
   (if __radius (setq _radius __radius)) _radius)
  (:serialization-length
   ()
   (+
    ;; float64[] _center
    (* 8    (length _center)) 4
    ;; float64[] _central_axis
    (* 8    (length _central_axis)) 4
    ;; float64 _radius
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _center
     (write-long (length _center) s)
     (dotimes (i (length _center))
       (sys::poke (elt _center i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _central_axis
     (write-long (length _central_axis) s)
     (dotimes (i (length _central_axis))
       (sys::poke (elt _central_axis i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _radius
       (sys::poke _radius (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _center
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _center (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _center i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _central_axis
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _central_axis (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _central_axis i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64 _radius
     (setq _radius (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get segmentation::processed_cylinder_data :md5sum-) "af9d26870351f883860103b94fc08d9c")
(setf (get segmentation::processed_cylinder_data :datatype-) "segmentation/processed_cylinder_data")
(setf (get segmentation::processed_cylinder_data :definition-)
      "float64[] center
float64[] central_axis
float64 radius

")



(provide :segmentation/processed_cylinder_data "af9d26870351f883860103b94fc08d9c")


