;; Auto-generated. Do not edit!


(when (boundp 'segmentation::box_data)
  (if (not (find-package "SEGMENTATION"))
    (make-package "SEGMENTATION"))
  (shadow 'box_data (find-package "SEGMENTATION")))
(unless (find-package "SEGMENTATION::BOX_DATA")
  (make-package "SEGMENTATION::BOX_DATA"))

(in-package "ROS")
;;//! \htmlinclude box_data.msg.html


(defclass segmentation::box_data
  :super ros::object
  :slots (_box_data ))

(defmethod segmentation::box_data
  (:init
   (&key
    ((:box_data __box_data) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _box_data __box_data)
   self)
  (:box_data
   (&optional __box_data)
   (if __box_data (setq _box_data __box_data)) _box_data)
  (:serialization-length
   ()
   (+
    ;; float64[] _box_data
    (* 8    (length _box_data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _box_data
     (write-long (length _box_data) s)
     (dotimes (i (length _box_data))
       (sys::poke (elt _box_data i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _box_data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _box_data (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _box_data i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get segmentation::box_data :md5sum-) "b2f69ad0d9506dd9f7955546117df699")
(setf (get segmentation::box_data :datatype-) "segmentation/box_data")
(setf (get segmentation::box_data :definition-)
      "float64[] box_data

")



(provide :segmentation/box_data "b2f69ad0d9506dd9f7955546117df699")


