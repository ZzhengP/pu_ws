;; Auto-generated. Do not edit!


(when (boundp 'segmentation::processed_box_data)
  (if (not (find-package "SEGMENTATION"))
    (make-package "SEGMENTATION"))
  (shadow 'processed_box_data (find-package "SEGMENTATION")))
(unless (find-package "SEGMENTATION::PROCESSED_BOX_DATA")
  (make-package "SEGMENTATION::PROCESSED_BOX_DATA"))

(in-package "ROS")
;;//! \htmlinclude processed_box_data.msg.html


(defclass segmentation::processed_box_data
  :super ros::object
  :slots (_center _length _width _height _angle ))

(defmethod segmentation::processed_box_data
  (:init
   (&key
    ((:center __center) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:length __length) 0.0)
    ((:width __width) 0.0)
    ((:height __height) 0.0)
    ((:angle __angle) 0.0)
    )
   (send-super :init)
   (setq _center __center)
   (setq _length (float __length))
   (setq _width (float __width))
   (setq _height (float __height))
   (setq _angle (float __angle))
   self)
  (:center
   (&optional __center)
   (if __center (setq _center __center)) _center)
  (:length
   (&optional __length)
   (if __length (setq _length __length)) _length)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; float64[] _center
    (* 8    (length _center)) 4
    ;; float64 _length
    8
    ;; float64 _width
    8
    ;; float64 _height
    8
    ;; float64 _angle
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
     ;; float64 _length
       (sys::poke _length (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _width
       (sys::poke _width (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _height
       (sys::poke _height (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
   ;; float64 _length
     (setq _length (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _width
     (setq _width (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _height
     (setq _height (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angle
     (setq _angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get segmentation::processed_box_data :md5sum-) "174b15346284f679bc3e127d60e5ccc7")
(setf (get segmentation::processed_box_data :datatype-) "segmentation/processed_box_data")
(setf (get segmentation::processed_box_data :definition-)
      "float64[] center
float64 length
float64 width
float64 height
float64 angle

")



(provide :segmentation/processed_box_data "174b15346284f679bc3e127d60e5ccc7")


