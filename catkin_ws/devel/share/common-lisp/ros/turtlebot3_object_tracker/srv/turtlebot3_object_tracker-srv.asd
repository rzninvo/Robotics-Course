
(cl:in-package :asdf)

(defsystem "turtlebot3_object_tracker-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "DetectionData" :depends-on ("_package_DetectionData"))
    (:file "_package_DetectionData" :depends-on ("_package"))
  ))