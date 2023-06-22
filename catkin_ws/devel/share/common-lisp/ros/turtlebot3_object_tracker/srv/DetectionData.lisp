; Auto-generated. Do not edit!


(cl:in-package turtlebot3_object_tracker-srv)


;//! \htmlinclude DetectionData-request.msg.html

(cl:defclass <DetectionData-request> (roslisp-msg-protocol:ros-message)
  ((label
    :reader label
    :initarg :label
    :type cl:string
    :initform ""))
)

(cl:defclass DetectionData-request (<DetectionData-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DetectionData-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DetectionData-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtlebot3_object_tracker-srv:<DetectionData-request> is deprecated: use turtlebot3_object_tracker-srv:DetectionData-request instead.")))

(cl:ensure-generic-function 'label-val :lambda-list '(m))
(cl:defmethod label-val ((m <DetectionData-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlebot3_object_tracker-srv:label-val is deprecated.  Use turtlebot3_object_tracker-srv:label instead.")
  (label m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DetectionData-request>) ostream)
  "Serializes a message object of type '<DetectionData-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'label))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'label))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DetectionData-request>) istream)
  "Deserializes a message object of type '<DetectionData-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'label) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'label) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DetectionData-request>)))
  "Returns string type for a service object of type '<DetectionData-request>"
  "turtlebot3_object_tracker/DetectionDataRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DetectionData-request)))
  "Returns string type for a service object of type 'DetectionData-request"
  "turtlebot3_object_tracker/DetectionDataRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DetectionData-request>)))
  "Returns md5sum for a message object of type '<DetectionData-request>"
  "60c458eab0a342a86739c835cfee1fc3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DetectionData-request)))
  "Returns md5sum for a message object of type 'DetectionData-request"
  "60c458eab0a342a86739c835cfee1fc3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DetectionData-request>)))
  "Returns full string definition for message of type '<DetectionData-request>"
  (cl:format cl:nil "string label~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DetectionData-request)))
  "Returns full string definition for message of type 'DetectionData-request"
  (cl:format cl:nil "string label~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DetectionData-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'label))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DetectionData-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DetectionData-request
    (cl:cons ':label (label msg))
))
;//! \htmlinclude DetectionData-response.msg.html

(cl:defclass <DetectionData-response> (roslisp-msg-protocol:ros-message)
  ((bb_cx
    :reader bb_cx
    :initarg :bb_cx
    :type cl:float
    :initform 0.0)
   (bb_cy
    :reader bb_cy
    :initarg :bb_cy
    :type cl:float
    :initform 0.0)
   (bb_width
    :reader bb_width
    :initarg :bb_width
    :type cl:float
    :initform 0.0)
   (bb_height
    :reader bb_height
    :initarg :bb_height
    :type cl:float
    :initform 0.0)
   (img_width
    :reader img_width
    :initarg :img_width
    :type cl:float
    :initform 0.0)
   (img_height
    :reader img_height
    :initarg :img_height
    :type cl:float
    :initform 0.0)
   (flag
    :reader flag
    :initarg :flag
    :type cl:string
    :initform ""))
)

(cl:defclass DetectionData-response (<DetectionData-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DetectionData-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DetectionData-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtlebot3_object_tracker-srv:<DetectionData-response> is deprecated: use turtlebot3_object_tracker-srv:DetectionData-response instead.")))

(cl:ensure-generic-function 'bb_cx-val :lambda-list '(m))
(cl:defmethod bb_cx-val ((m <DetectionData-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlebot3_object_tracker-srv:bb_cx-val is deprecated.  Use turtlebot3_object_tracker-srv:bb_cx instead.")
  (bb_cx m))

(cl:ensure-generic-function 'bb_cy-val :lambda-list '(m))
(cl:defmethod bb_cy-val ((m <DetectionData-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlebot3_object_tracker-srv:bb_cy-val is deprecated.  Use turtlebot3_object_tracker-srv:bb_cy instead.")
  (bb_cy m))

(cl:ensure-generic-function 'bb_width-val :lambda-list '(m))
(cl:defmethod bb_width-val ((m <DetectionData-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlebot3_object_tracker-srv:bb_width-val is deprecated.  Use turtlebot3_object_tracker-srv:bb_width instead.")
  (bb_width m))

(cl:ensure-generic-function 'bb_height-val :lambda-list '(m))
(cl:defmethod bb_height-val ((m <DetectionData-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlebot3_object_tracker-srv:bb_height-val is deprecated.  Use turtlebot3_object_tracker-srv:bb_height instead.")
  (bb_height m))

(cl:ensure-generic-function 'img_width-val :lambda-list '(m))
(cl:defmethod img_width-val ((m <DetectionData-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlebot3_object_tracker-srv:img_width-val is deprecated.  Use turtlebot3_object_tracker-srv:img_width instead.")
  (img_width m))

(cl:ensure-generic-function 'img_height-val :lambda-list '(m))
(cl:defmethod img_height-val ((m <DetectionData-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlebot3_object_tracker-srv:img_height-val is deprecated.  Use turtlebot3_object_tracker-srv:img_height instead.")
  (img_height m))

(cl:ensure-generic-function 'flag-val :lambda-list '(m))
(cl:defmethod flag-val ((m <DetectionData-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlebot3_object_tracker-srv:flag-val is deprecated.  Use turtlebot3_object_tracker-srv:flag instead.")
  (flag m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DetectionData-response>) ostream)
  "Serializes a message object of type '<DetectionData-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'bb_cx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'bb_cy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'bb_width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'bb_height))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'img_width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'img_height))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'flag))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'flag))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DetectionData-response>) istream)
  "Deserializes a message object of type '<DetectionData-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bb_cx) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bb_cy) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bb_width) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bb_height) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'img_width) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'img_height) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'flag) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'flag) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DetectionData-response>)))
  "Returns string type for a service object of type '<DetectionData-response>"
  "turtlebot3_object_tracker/DetectionDataResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DetectionData-response)))
  "Returns string type for a service object of type 'DetectionData-response"
  "turtlebot3_object_tracker/DetectionDataResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DetectionData-response>)))
  "Returns md5sum for a message object of type '<DetectionData-response>"
  "60c458eab0a342a86739c835cfee1fc3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DetectionData-response)))
  "Returns md5sum for a message object of type 'DetectionData-response"
  "60c458eab0a342a86739c835cfee1fc3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DetectionData-response>)))
  "Returns full string definition for message of type '<DetectionData-response>"
  (cl:format cl:nil "float64 bb_cx~%float64 bb_cy~%float64 bb_width~%float64 bb_height~%float64 img_width~%float64 img_height~%string flag~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DetectionData-response)))
  "Returns full string definition for message of type 'DetectionData-response"
  (cl:format cl:nil "float64 bb_cx~%float64 bb_cy~%float64 bb_width~%float64 bb_height~%float64 img_width~%float64 img_height~%string flag~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DetectionData-response>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
     4 (cl:length (cl:slot-value msg 'flag))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DetectionData-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DetectionData-response
    (cl:cons ':bb_cx (bb_cx msg))
    (cl:cons ':bb_cy (bb_cy msg))
    (cl:cons ':bb_width (bb_width msg))
    (cl:cons ':bb_height (bb_height msg))
    (cl:cons ':img_width (img_width msg))
    (cl:cons ':img_height (img_height msg))
    (cl:cons ':flag (flag msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DetectionData)))
  'DetectionData-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DetectionData)))
  'DetectionData-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DetectionData)))
  "Returns string type for a service object of type '<DetectionData>"
  "turtlebot3_object_tracker/DetectionData")