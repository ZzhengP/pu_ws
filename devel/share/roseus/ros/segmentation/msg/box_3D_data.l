;; Auto-generated. Do not edit!


(when (boundp 'segmentation::box_3D_data)
  (if (not (find-package "SEGMENTATION"))
    (make-package "SEGMENTATION"))
  (shadow 'box_3D_data (find-package "SEGMENTATION")))
(unless (find-package "SEGMENTATION::BOX_3D_DATA")
  (make-package "SEGMENTATION::BOX_3D_DATA"))

(in-package "ROS")
;;//! \htmlinclude box_3D_data.msg.html


(defclass segmentation::box_3D_data
  :super ros::object
  :slots (_center _longestEdgeLen _medianEdgeLen _shortestEdgeLen _longestEdgeDir _medianEdgeDir _shortestEdgeDir ))

(defmethod segmentation::box_3D_data
  (:init
   (&key
    ((:center __center) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:longestEdgeLen __longestEdgeLen) 0.0)
    ((:medianEdgeLen __medianEdgeLen) 0.0)
    ((:shortestEdgeLen __shortestEdgeLen) 0.0)
    ((:longestEdgeDir __longestEdgeDir) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:medianEdgeDir __medianEdgeDir) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:shortestEdgeDir __shortestEdgeDir) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _center __center)
   (setq _longestEdgeLen (float __longestEdgeLen))
   (setq _medianEdgeLen (float __medianEdgeLen))
   (setq _shortestEdgeLen (float __shortestEdgeLen))
   (setq _longestEdgeDir __longestEdgeDir)
   (setq _medianEdgeDir __medianEdgeDir)
   (setq _shortestEdgeDir __shortestEdgeDir)
   self)
  (:center
   (&optional __center)
   (if __center (setq _center __center)) _center)
  (:longestEdgeLen
   (&optional __longestEdgeLen)
   (if __longestEdgeLen (setq _longestEdgeLen __longestEdgeLen)) _longestEdgeLen)
  (:medianEdgeLen
   (&optional __medianEdgeLen)
   (if __medianEdgeLen (setq _medianEdgeLen __medianEdgeLen)) _medianEdgeLen)
  (:shortestEdgeLen
   (&optional __shortestEdgeLen)
   (if __shortestEdgeLen (setq _shortestEdgeLen __shortestEdgeLen)) _shortestEdgeLen)
  (:longestEdgeDir
   (&optional __longestEdgeDir)
   (if __longestEdgeDir (setq _longestEdgeDir __longestEdgeDir)) _longestEdgeDir)
  (:medianEdgeDir
   (&optional __medianEdgeDir)
   (if __medianEdgeDir (setq _medianEdgeDir __medianEdgeDir)) _medianEdgeDir)
  (:shortestEdgeDir
   (&optional __shortestEdgeDir)
   (if __shortestEdgeDir (setq _shortestEdgeDir __shortestEdgeDir)) _shortestEdgeDir)
  (:serialization-length
   ()
   (+
    ;; float64[] _center
    (* 8    (length _center)) 4
    ;; float64 _longestEdgeLen
    8
    ;; float64 _medianEdgeLen
    8
    ;; float64 _shortestEdgeLen
    8
    ;; float64[] _longestEdgeDir
    (* 8    (length _longestEdgeDir)) 4
    ;; float64[] _medianEdgeDir
    (* 8    (length _medianEdgeDir)) 4
    ;; float64[] _shortestEdgeDir
    (* 8    (length _shortestEdgeDir)) 4
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
     ;; float64 _longestEdgeLen
       (sys::poke _longestEdgeLen (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _medianEdgeLen
       (sys::poke _medianEdgeLen (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _shortestEdgeLen
       (sys::poke _shortestEdgeLen (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64[] _longestEdgeDir
     (write-long (length _longestEdgeDir) s)
     (dotimes (i (length _longestEdgeDir))
       (sys::poke (elt _longestEdgeDir i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _medianEdgeDir
     (write-long (length _medianEdgeDir) s)
     (dotimes (i (length _medianEdgeDir))
       (sys::poke (elt _medianEdgeDir i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _shortestEdgeDir
     (write-long (length _shortestEdgeDir) s)
     (dotimes (i (length _shortestEdgeDir))
       (sys::poke (elt _shortestEdgeDir i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
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
   ;; float64 _longestEdgeLen
     (setq _longestEdgeLen (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _medianEdgeLen
     (setq _medianEdgeLen (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _shortestEdgeLen
     (setq _shortestEdgeLen (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64[] _longestEdgeDir
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _longestEdgeDir (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _longestEdgeDir i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _medianEdgeDir
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _medianEdgeDir (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _medianEdgeDir i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _shortestEdgeDir
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _shortestEdgeDir (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _shortestEdgeDir i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get segmentation::box_3D_data :md5sum-) "4ef979cbe8c870ca365c89208698d6f7")
(setf (get segmentation::box_3D_data :datatype-) "segmentation/box_3D_data")
(setf (get segmentation::box_3D_data :definition-)
      "float64[] center
float64 longestEdgeLen
float64 medianEdgeLen
float64 shortestEdgeLen
float64[] longestEdgeDir
float64[] medianEdgeDir
float64[] shortestEdgeDir

")



(provide :segmentation/box_3D_data "4ef979cbe8c870ca365c89208698d6f7")


