; Auto-generated. Do not edit!


(cl:in-package project1-msg)


;//! \htmlinclude controller.msg.html

(cl:defclass <controller> (roslisp-msg-protocol:ros-message)
  ((clockwise
    :reader clockwise
    :initarg :clockwise
    :type cl:fixnum
    :initform 0)
   (theta
    :reader theta
    :initarg :theta
    :type cl:fixnum
    :initform 0))
)

(cl:defclass controller (<controller>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <controller>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'controller)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name project1-msg:<controller> is deprecated: use project1-msg:controller instead.")))

(cl:ensure-generic-function 'clockwise-val :lambda-list '(m))
(cl:defmethod clockwise-val ((m <controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader project1-msg:clockwise-val is deprecated.  Use project1-msg:clockwise instead.")
  (clockwise m))

(cl:ensure-generic-function 'theta-val :lambda-list '(m))
(cl:defmethod theta-val ((m <controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader project1-msg:theta-val is deprecated.  Use project1-msg:theta instead.")
  (theta m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <controller>) ostream)
  "Serializes a message object of type '<controller>"
  (cl:let* ((signed (cl:slot-value msg 'clockwise)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'theta)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <controller>) istream)
  "Deserializes a message object of type '<controller>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'clockwise) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'theta) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<controller>)))
  "Returns string type for a message object of type '<controller>"
  "project1/controller")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'controller)))
  "Returns string type for a message object of type 'controller"
  "project1/controller")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<controller>)))
  "Returns md5sum for a message object of type '<controller>"
  "9453778c8293eaf018f21fc4ef7b8843")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'controller)))
  "Returns md5sum for a message object of type 'controller"
  "9453778c8293eaf018f21fc4ef7b8843")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<controller>)))
  "Returns full string definition for message of type '<controller>"
  (cl:format cl:nil "int16    clockwise~%int16    theta~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'controller)))
  "Returns full string definition for message of type 'controller"
  (cl:format cl:nil "int16    clockwise~%int16    theta~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <controller>))
  (cl:+ 0
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <controller>))
  "Converts a ROS message object to a list"
  (cl:list 'controller
    (cl:cons ':clockwise (clockwise msg))
    (cl:cons ':theta (theta msg))
))
