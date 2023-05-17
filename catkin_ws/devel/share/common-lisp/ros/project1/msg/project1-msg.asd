
(cl:in-package :asdf)

(defsystem "project1-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "controller" :depends-on ("_package_controller"))
    (:file "_package_controller" :depends-on ("_package"))
    (:file "distance_sensor" :depends-on ("_package_distance_sensor"))
    (:file "_package_distance_sensor" :depends-on ("_package"))
  ))