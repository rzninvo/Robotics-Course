; Auto-generated. Do not edit!


(cl:in-package project2_phase2-msg)


;//! \htmlinclude closest_object_pose.msg.html

(cl:defclass <closest_object_pose> (roslisp-msg-protocol:ros-message)
  ((distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0)
   (direction
    :reader direction
    :initarg :direction
    :type cl:float
    :initform 0.0))
)

(cl:defclass closest_object_pose (<closest_object_pose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <closest_object_pose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'closest_object_pose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name project2_phase2-msg:<closest_object_pose> is deprecated: use project2_phase2-msg:closest_object_pose instead.")))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <closest_object_pose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader project2_phase2-msg:distance-val is deprecated.  Use project2_phase2-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <closest_object_pose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader project2_phase2-msg:direction-val is deprecated.  Use project2_phase2-msg:direction instead.")
  (direction m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <closest_object_pose>) ostream)
  "Serializes a message object of type '<closest_object_pose>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'direction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <closest_object_pose>) istream)
  "Deserializes a message object of type '<closest_object_pose>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'direction) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<closest_object_pose>)))
  "Returns string type for a message object of type '<closest_object_pose>"
  "project2_phase2/closest_object_pose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'closest_object_pose)))
  "Returns string type for a message object of type 'closest_object_pose"
  "project2_phase2/closest_object_pose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<closest_object_pose>)))
  "Returns md5sum for a message object of type '<closest_object_pose>"
  "408759c287897be1a1b77ecfff03e04a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'closest_object_pose)))
  "Returns md5sum for a message object of type 'closest_object_pose"
  "408759c287897be1a1b77ecfff03e04a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<closest_object_pose>)))
  "Returns full string definition for message of type '<closest_object_pose>"
  (cl:format cl:nil "float64 distance~%float64 direction~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'closest_object_pose)))
  "Returns full string definition for message of type 'closest_object_pose"
  (cl:format cl:nil "float64 distance~%float64 direction~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <closest_object_pose>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <closest_object_pose>))
  "Converts a ROS message object to a list"
  (cl:list 'closest_object_pose
    (cl:cons ':distance (distance msg))
    (cl:cons ':direction (direction msg))
))
