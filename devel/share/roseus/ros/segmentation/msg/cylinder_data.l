;; Auto-generated. Do not edit!


(when (boundp 'segmentation::cylinder_data)
  (if (not (find-package "SEGMENTATION"))
    (make-package "SEGMENTATION"))
  (shadow 'cylinder_data (find-package "SEGMENTATION")))
(unless (find-package "SEGMENTATION::CYLINDER_DATA")
  (make-package "SEGMENTATION::CYLINDER_DATA"))

(in-package "ROS")
;;//! \htmlinclude cylinder_data.msg.html


(defclass segmentation::cylinder_data
  :super ros::object
  :slots (_cylinder_data ))

(defmethod segmentation::cylinder_data
  (:init
   (&key
    ((:cylinder_data __cylinder_data) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _cylinder_data __cylinder_data)
   self)
  (:cylinder_data
   (&optional __cylinder_data)
   (if __cylinder_data (setq _cylinder_data __cylinder_data)) _cylinder_data)
  (:serialization-length
   ()
   (+
    ;; float64[] _cylinder_data
    (* 8    (length _cylinder_data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _cylinder_data
     (write-long (length _cylinder_data) s)
     (dotimes (i (length _cylinder_data))
       (sys::poke (elt _cylinder_data i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _cylinder_data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _cylinder_data (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _cylinder_data i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get segmentation::cylinder_data :md5sum-) "1a4264b959f4524ebd65115710e486ae")
(setf (get segmentation::cylinder_data :datatype-) "segmentation/cylinder_data")
(setf (get segmentation::cylinder_data :definition-)
      "float64[] cylinder_data

")



(provide :segmentation/cylinder_data "1a4264b959f4524ebd65115710e486ae")


