;; Auto-generated. Do not edit!


(when (boundp 'project1::controller)
  (if (not (find-package "PROJECT1"))
    (make-package "PROJECT1"))
  (shadow 'controller (find-package "PROJECT1")))
(unless (find-package "PROJECT1::CONTROLLER")
  (make-package "PROJECT1::CONTROLLER"))

(in-package "ROS")
;;//! \htmlinclude controller.msg.html


(defclass project1::controller
  :super ros::object
  :slots (_clockwise _theta ))

(defmethod project1::controller
  (:init
   (&key
    ((:clockwise __clockwise) 0)
    ((:theta __theta) 0)
    )
   (send-super :init)
   (setq _clockwise (round __clockwise))
   (setq _theta (round __theta))
   self)
  (:clockwise
   (&optional __clockwise)
   (if __clockwise (setq _clockwise __clockwise)) _clockwise)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:serialization-length
   ()
   (+
    ;; int16 _clockwise
    2
    ;; int16 _theta
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _clockwise
       (write-word _clockwise s)
     ;; int16 _theta
       (write-word _theta s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _clockwise
     (setq _clockwise (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _theta
     (setq _theta (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get project1::controller :md5sum-) "9453778c8293eaf018f21fc4ef7b8843")
(setf (get project1::controller :datatype-) "project1/controller")
(setf (get project1::controller :definition-)
      "int16    clockwise
int16    theta
")



(provide :project1/controller "9453778c8293eaf018f21fc4ef7b8843")


