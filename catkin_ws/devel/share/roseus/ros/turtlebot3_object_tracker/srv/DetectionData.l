;; Auto-generated. Do not edit!


(when (boundp 'turtlebot3_object_tracker::DetectionData)
  (if (not (find-package "TURTLEBOT3_OBJECT_TRACKER"))
    (make-package "TURTLEBOT3_OBJECT_TRACKER"))
  (shadow 'DetectionData (find-package "TURTLEBOT3_OBJECT_TRACKER")))
(unless (find-package "TURTLEBOT3_OBJECT_TRACKER::DETECTIONDATA")
  (make-package "TURTLEBOT3_OBJECT_TRACKER::DETECTIONDATA"))
(unless (find-package "TURTLEBOT3_OBJECT_TRACKER::DETECTIONDATAREQUEST")
  (make-package "TURTLEBOT3_OBJECT_TRACKER::DETECTIONDATAREQUEST"))
(unless (find-package "TURTLEBOT3_OBJECT_TRACKER::DETECTIONDATARESPONSE")
  (make-package "TURTLEBOT3_OBJECT_TRACKER::DETECTIONDATARESPONSE"))

(in-package "ROS")





(defclass turtlebot3_object_tracker::DetectionDataRequest
  :super ros::object
  :slots (_label ))

(defmethod turtlebot3_object_tracker::DetectionDataRequest
  (:init
   (&key
    ((:label __label) "")
    )
   (send-super :init)
   (setq _label (string __label))
   self)
  (:label
   (&optional __label)
   (if __label (setq _label __label)) _label)
  (:serialization-length
   ()
   (+
    ;; string _label
    4 (length _label)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _label
       (write-long (length _label) s) (princ _label s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _label
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _label (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass turtlebot3_object_tracker::DetectionDataResponse
  :super ros::object
  :slots (_bb_cx _bb_cy _bb_width _bb_height _img_width _img_height _flag ))

(defmethod turtlebot3_object_tracker::DetectionDataResponse
  (:init
   (&key
    ((:bb_cx __bb_cx) 0.0)
    ((:bb_cy __bb_cy) 0.0)
    ((:bb_width __bb_width) 0.0)
    ((:bb_height __bb_height) 0.0)
    ((:img_width __img_width) 0.0)
    ((:img_height __img_height) 0.0)
    ((:flag __flag) "")
    )
   (send-super :init)
   (setq _bb_cx (float __bb_cx))
   (setq _bb_cy (float __bb_cy))
   (setq _bb_width (float __bb_width))
   (setq _bb_height (float __bb_height))
   (setq _img_width (float __img_width))
   (setq _img_height (float __img_height))
   (setq _flag (string __flag))
   self)
  (:bb_cx
   (&optional __bb_cx)
   (if __bb_cx (setq _bb_cx __bb_cx)) _bb_cx)
  (:bb_cy
   (&optional __bb_cy)
   (if __bb_cy (setq _bb_cy __bb_cy)) _bb_cy)
  (:bb_width
   (&optional __bb_width)
   (if __bb_width (setq _bb_width __bb_width)) _bb_width)
  (:bb_height
   (&optional __bb_height)
   (if __bb_height (setq _bb_height __bb_height)) _bb_height)
  (:img_width
   (&optional __img_width)
   (if __img_width (setq _img_width __img_width)) _img_width)
  (:img_height
   (&optional __img_height)
   (if __img_height (setq _img_height __img_height)) _img_height)
  (:flag
   (&optional __flag)
   (if __flag (setq _flag __flag)) _flag)
  (:serialization-length
   ()
   (+
    ;; float64 _bb_cx
    8
    ;; float64 _bb_cy
    8
    ;; float64 _bb_width
    8
    ;; float64 _bb_height
    8
    ;; float64 _img_width
    8
    ;; float64 _img_height
    8
    ;; string _flag
    4 (length _flag)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _bb_cx
       (sys::poke _bb_cx (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _bb_cy
       (sys::poke _bb_cy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _bb_width
       (sys::poke _bb_width (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _bb_height
       (sys::poke _bb_height (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _img_width
       (sys::poke _img_width (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _img_height
       (sys::poke _img_height (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _flag
       (write-long (length _flag) s) (princ _flag s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _bb_cx
     (setq _bb_cx (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _bb_cy
     (setq _bb_cy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _bb_width
     (setq _bb_width (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _bb_height
     (setq _bb_height (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _img_width
     (setq _img_width (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _img_height
     (setq _img_height (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _flag
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _flag (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass turtlebot3_object_tracker::DetectionData
  :super ros::object
  :slots ())

(setf (get turtlebot3_object_tracker::DetectionData :md5sum-) "60c458eab0a342a86739c835cfee1fc3")
(setf (get turtlebot3_object_tracker::DetectionData :datatype-) "turtlebot3_object_tracker/DetectionData")
(setf (get turtlebot3_object_tracker::DetectionData :request) turtlebot3_object_tracker::DetectionDataRequest)
(setf (get turtlebot3_object_tracker::DetectionData :response) turtlebot3_object_tracker::DetectionDataResponse)

(defmethod turtlebot3_object_tracker::DetectionDataRequest
  (:response () (instance turtlebot3_object_tracker::DetectionDataResponse :init)))

(setf (get turtlebot3_object_tracker::DetectionDataRequest :md5sum-) "60c458eab0a342a86739c835cfee1fc3")
(setf (get turtlebot3_object_tracker::DetectionDataRequest :datatype-) "turtlebot3_object_tracker/DetectionDataRequest")
(setf (get turtlebot3_object_tracker::DetectionDataRequest :definition-)
      "string label
---
float64 bb_cx
float64 bb_cy
float64 bb_width
float64 bb_height
float64 img_width
float64 img_height
string flag
")

(setf (get turtlebot3_object_tracker::DetectionDataResponse :md5sum-) "60c458eab0a342a86739c835cfee1fc3")
(setf (get turtlebot3_object_tracker::DetectionDataResponse :datatype-) "turtlebot3_object_tracker/DetectionDataResponse")
(setf (get turtlebot3_object_tracker::DetectionDataResponse :definition-)
      "string label
---
float64 bb_cx
float64 bb_cy
float64 bb_width
float64 bb_height
float64 img_width
float64 img_height
string flag
")



(provide :turtlebot3_object_tracker/DetectionData "60c458eab0a342a86739c835cfee1fc3")


