
(cl:in-package :asdf)

(defsystem "project2_phase2-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "closest_object_pose" :depends-on ("_package_closest_object_pose"))
    (:file "_package_closest_object_pose" :depends-on ("_package"))
  ))