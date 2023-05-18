
(cl:in-package :asdf)

(defsystem "Project2_Phase1-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GetNextDestination" :depends-on ("_package_GetNextDestination"))
    (:file "_package_GetNextDestination" :depends-on ("_package"))
  ))