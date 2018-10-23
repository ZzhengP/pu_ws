;; Auto-generated. Do not edit!


(when (boundp 'segmentation::processed_sphere_data)
  (if (not (find-package "SEGMENTATION"))
    (make-package "SEGMENTATION"))
  (shadow 'processed_sphere_data (find-package "SEGMENTATION")))
(unless (find-package "SEGMENTATION::PROCESSED_SPHERE_DATA")
  (make-package "SEGMENTATION::PROCESSED_SPHERE_DATA"))

(in-package "ROS")
;;//! \htmlinclude processed_sphere_data.msg.html


(defclass segmentation::processed_sphere_data
  :super ros::object
  :slots (_center _radius ))

(defmethod segmentation::processed_sphere_data
  (:init
   (&key
    ((:center __center) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:radius __radius) 0.0)
    )
   (send-super :init)
   (setq _center __center)
   (setq _radius (float __radius))
   self)
  (:center
   (&optional __center)
   (if __center (setq _center __center)) _center)
  (:radius
   (&optional __radius)
   (if __radius (setq _radius __radius)) _radius)
  (:serialization-length
   ()
   (+
    ;; float64[] _center
    (* 8    (length _center)) 4
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
   ;; float64 _radius
     (setq _radius (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get segmentation::processed_sphere_data :md5sum-) "e2cb214aacb9b0a8737c65ce951a95d8")
(setf (get segmentation::processed_sphere_data :datatype-) "segmentation/processed_sphere_data")
(setf (get segmentation::processed_sphere_data :definition-)
      "float64[] center
float64 radius

")



(provide :segmentation/processed_sphere_data "e2cb214aacb9b0a8737c65ce951a95d8")


