;; Auto-generated. Do not edit!


(when (boundp 'segmentation::sphere_data)
  (if (not (find-package "SEGMENTATION"))
    (make-package "SEGMENTATION"))
  (shadow 'sphere_data (find-package "SEGMENTATION")))
(unless (find-package "SEGMENTATION::SPHERE_DATA")
  (make-package "SEGMENTATION::SPHERE_DATA"))

(in-package "ROS")
;;//! \htmlinclude sphere_data.msg.html


(defclass segmentation::sphere_data
  :super ros::object
  :slots (_sphere_data ))

(defmethod segmentation::sphere_data
  (:init
   (&key
    ((:sphere_data __sphere_data) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _sphere_data __sphere_data)
   self)
  (:sphere_data
   (&optional __sphere_data)
   (if __sphere_data (setq _sphere_data __sphere_data)) _sphere_data)
  (:serialization-length
   ()
   (+
    ;; float64[] _sphere_data
    (* 8    (length _sphere_data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _sphere_data
     (write-long (length _sphere_data) s)
     (dotimes (i (length _sphere_data))
       (sys::poke (elt _sphere_data i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _sphere_data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sphere_data (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _sphere_data i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get segmentation::sphere_data :md5sum-) "a9caba4b187ed22cae60b5d45f11e3f1")
(setf (get segmentation::sphere_data :datatype-) "segmentation/sphere_data")
(setf (get segmentation::sphere_data :definition-)
      "float64[] sphere_data

")



(provide :segmentation/sphere_data "a9caba4b187ed22cae60b5d45f11e3f1")


