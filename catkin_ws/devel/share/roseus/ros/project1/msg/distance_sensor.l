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
    ;; int8 _front
    1
    ;; int8 _back
    1
    ;; int8 _right
    1
    ;; int8 _left
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _front
       (write-byte _front s)
     ;; int8 _back
       (write-byte _back s)
     ;; int8 _right
       (write-byte _right s)
     ;; int8 _left
       (write-byte _left s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _front
     (setq _front (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _front 127) (setq _front (- _front 256)))
   ;; int8 _back
     (setq _back (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _back 127) (setq _back (- _back 256)))
   ;; int8 _right
     (setq _right (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _right 127) (setq _right (- _right 256)))
   ;; int8 _left
     (setq _left (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _left 127) (setq _left (- _left 256)))
   ;;
   self)
  )

(setf (get project1::distance_sensor :md5sum-) "ed4e666c5e7c96f4232b8795fa5cafaa")
(setf (get project1::distance_sensor :datatype-) "project1/distance_sensor")
(setf (get project1::distance_sensor :definition-)
      "int8    front
int8    back
int8    right
int8    left
")



(provide :project1/distance_sensor "ed4e666c5e7c96f4232b8795fa5cafaa")


