; Auto-generated. Do not edit!


(cl:in-package project1-msg)


;//! \htmlinclude distance_sensor.msg.html

(cl:defclass <distance_sensor> (roslisp-msg-protocol:ros-message)
  ((front
    :reader front
    :initarg :front
    :type cl:fixnum
    :initform 0)
   (back
    :reader back
    :initarg :back
    :type cl:fixnum
    :initform 0)
   (right
    :reader right
    :initarg :right
    :type cl:fixnum
    :initform 0)
   (left
    :reader left
    :initarg :left
    :type cl:fixnum
    :initform 0))
)

(cl:defclass distance_sensor (<distance_sensor>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <distance_sensor>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'distance_sensor)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name project1-msg:<distance_sensor> is deprecated: use project1-msg:distance_sensor instead.")))

(cl:ensure-generic-function 'front-val :lambda-list '(m))
(cl:defmethod front-val ((m <distance_sensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader project1-msg:front-val is deprecated.  Use project1-msg:front instead.")
  (front m))

(cl:ensure-generic-function 'back-val :lambda-list '(m))
(cl:defmethod back-val ((m <distance_sensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader project1-msg:back-val is deprecated.  Use project1-msg:back instead.")
  (back m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <distance_sensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader project1-msg:right-val is deprecated.  Use project1-msg:right instead.")
  (right m))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <distance_sensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader project1-msg:left-val is deprecated.  Use project1-msg:left instead.")
  (left m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <distance_sensor>) ostream)
  "Serializes a message object of type '<distance_sensor>"
  (cl:let* ((signed (cl:slot-value msg 'front)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'back)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'right)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'left)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <distance_sensor>) istream)
  "Deserializes a message object of type '<distance_sensor>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'front) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'back) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<distance_sensor>)))
  "Returns string type for a message object of type '<distance_sensor>"
  "project1/distance_sensor")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'distance_sensor)))
  "Returns string type for a message object of type 'distance_sensor"
  "project1/distance_sensor")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<distance_sensor>)))
  "Returns md5sum for a message object of type '<distance_sensor>"
  "ed4e666c5e7c96f4232b8795fa5cafaa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'distance_sensor)))
  "Returns md5sum for a message object of type 'distance_sensor"
  "ed4e666c5e7c96f4232b8795fa5cafaa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<distance_sensor>)))
  "Returns full string definition for message of type '<distance_sensor>"
  (cl:format cl:nil "int8    front~%int8    back~%int8    right~%int8    left~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'distance_sensor)))
  "Returns full string definition for message of type 'distance_sensor"
  (cl:format cl:nil "int8    front~%int8    back~%int8    right~%int8    left~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <distance_sensor>))
  (cl:+ 0
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <distance_sensor>))
  "Converts a ROS message object to a list"
  (cl:list 'distance_sensor
    (cl:cons ':front (front msg))
    (cl:cons ':back (back msg))
    (cl:cons ':right (right msg))
    (cl:cons ':left (left msg))
))
