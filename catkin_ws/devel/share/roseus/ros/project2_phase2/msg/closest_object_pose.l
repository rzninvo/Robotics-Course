;; Auto-generated. Do not edit!


(when (boundp 'project2_phase2::closest_object_pose)
  (if (not (find-package "PROJECT2_PHASE2"))
    (make-package "PROJECT2_PHASE2"))
  (shadow 'closest_object_pose (find-package "PROJECT2_PHASE2")))
(unless (find-package "PROJECT2_PHASE2::CLOSEST_OBJECT_POSE")
  (make-package "PROJECT2_PHASE2::CLOSEST_OBJECT_POSE"))

(in-package "ROS")
;;//! \htmlinclude closest_object_pose.msg.html


(defclass project2_phase2::closest_object_pose
  :super ros::object
  :slots (_distance _direction ))

(defmethod project2_phase2::closest_object_pose
  (:init
   (&key
    ((:distance __distance) 0.0)
    ((:direction __direction) 0.0)
    )
   (send-super :init)
   (setq _distance (float __distance))
   (setq _direction (float __direction))
   self)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:serialization-length
   ()
   (+
    ;; float64 _distance
    8
    ;; float64 _direction
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _direction
       (sys::poke _direction (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _distance
     (setq _distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _direction
     (setq _direction (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get project2_phase2::closest_object_pose :md5sum-) "408759c287897be1a1b77ecfff03e04a")
(setf (get project2_phase2::closest_object_pose :datatype-) "project2_phase2/closest_object_pose")
(setf (get project2_phase2::closest_object_pose :definition-)
      "float64 distance
float64 direction
")



(provide :project2_phase2/closest_object_pose "408759c287897be1a1b77ecfff03e04a")


