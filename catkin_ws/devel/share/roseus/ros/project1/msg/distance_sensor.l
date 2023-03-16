;; Auto-generated. Do not edit!


(when (boundp 'project1::distance_sensor)
  (if (not (find-package "PROJECT1"))
    (make-package "PROJECT1"))
  (shadow 'distance_sensor (find-package "PROJECT1")))
(unless (find-package "PROJECT1::DISTANCE_SENSOR")
  (make-package "PROJECT1::DISTANCE_SENSOR"))

(in-package "ROS")
;;//! \htmlinclude distance_sensor.msg.html


(defclass project1::distance_sensor
  :super ros::object
  :slots (_front _back _right _left ))

(defmethod project1::distance_sensor
  (:init
   (&key
    ((:front __front) 0)
    ((:back __back) 0)
    ((:right __right) 0)
    ((:left __left) 0)
    )
   (send-super :init)
   (setq _front (round __front))
   (setq _back (round __back))
   (setq _right (round __right))
   (setq _left (round __left))
   self)
  (:front
   (&optional __front)
   (if __front (setq _front __front)) _front)
  (:back
   (&optional __back)
   (if __back (setq _back __back)) _back)
  (:right
   (&optional __right)
   (if __right (setq _right __right)) _right)
  (:left
   (&optional __left)
   (if __left (setq _left __left)) _left)
  (:serialization-length
   ()
   (+
    ;; int16 _front
    2
    ;; int16 _back
    2
    ;; int16 _right
    2
    ;; int16 _left
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _front
       (write-word _front s)
     ;; int16 _back
       (write-word _back s)
     ;; int16 _right
       (write-word _right s)
     ;; int16 _left
       (write-word _left s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _front
     (setq _front (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _back
     (setq _back (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _right
     (setq _right (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _left
     (setq _left (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get project1::distance_sensor :md5sum-) "2969a9d54c2e9d0595d756c5915a9c3c")
(setf (get project1::distance_sensor :datatype-) "project1/distance_sensor")
(setf (get project1::distance_sensor :definition-)
      "int16    front
int16    back
int16   right
int16    left
")



(provide :project1/distance_sensor "2969a9d54c2e9d0595d756c5915a9c3c")


