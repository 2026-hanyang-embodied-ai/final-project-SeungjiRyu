; Auto-generated. Do not edit!


(cl:in-package autohyu_msgs-msg)


;//! \htmlinclude Trajectories.msg.html

(cl:defclass <Trajectories> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (decision_behavior
    :reader decision_behavior
    :initarg :decision_behavior
    :type cl:fixnum
    :initform 0)
   (trajectory
    :reader trajectory
    :initarg :trajectory
    :type (cl:vector autohyu_msgs-msg:Trajectory)
   :initform (cl:make-array 0 :element-type 'autohyu_msgs-msg:Trajectory :initial-element (cl:make-instance 'autohyu_msgs-msg:Trajectory))))
)

(cl:defclass Trajectories (<Trajectories>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Trajectories>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Trajectories)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autohyu_msgs-msg:<Trajectories> is deprecated: use autohyu_msgs-msg:Trajectories instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Trajectories>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:header-val is deprecated.  Use autohyu_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'decision_behavior-val :lambda-list '(m))
(cl:defmethod decision_behavior-val ((m <Trajectories>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:decision_behavior-val is deprecated.  Use autohyu_msgs-msg:decision_behavior instead.")
  (decision_behavior m))

(cl:ensure-generic-function 'trajectory-val :lambda-list '(m))
(cl:defmethod trajectory-val ((m <Trajectories>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autohyu_msgs-msg:trajectory-val is deprecated.  Use autohyu_msgs-msg:trajectory instead.")
  (trajectory m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Trajectories>) ostream)
  "Serializes a message object of type '<Trajectories>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'decision_behavior)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'trajectory))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'trajectory))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Trajectories>) istream)
  "Deserializes a message object of type '<Trajectories>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'decision_behavior)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'trajectory) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'trajectory)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autohyu_msgs-msg:Trajectory))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Trajectories>)))
  "Returns string type for a message object of type '<Trajectories>"
  "autohyu_msgs/Trajectories")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Trajectories)))
  "Returns string type for a message object of type 'Trajectories"
  "autohyu_msgs/Trajectories")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Trajectories>)))
  "Returns md5sum for a message object of type '<Trajectories>"
  "27fa321e14fffefaedd9b3a6ef222cab")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Trajectories)))
  "Returns md5sum for a message object of type 'Trajectories"
  "27fa321e14fffefaedd9b3a6ef222cab")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Trajectories>)))
  "Returns full string definition for message of type '<Trajectories>"
  (cl:format cl:nil "std_msgs/Header header ~%~%uint8 decision_behavior~%autohyu_msgs/Trajectory[] trajectory~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: autohyu_msgs/Trajectory~%# std_msgs/Header~%std_msgs/Header header~%~%uint16 id~%autohyu_msgs/TrajectoryPoint[] point~%================================================================================~%MSG: autohyu_msgs/TrajectoryPoint~%float32 time~%float32 distance~%uint16  direction~%float32 x~%float32 y~%float32 z~%float32 yaw~%float32 curvature~%float32 speed~%float32 acceleration~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Trajectories)))
  "Returns full string definition for message of type 'Trajectories"
  (cl:format cl:nil "std_msgs/Header header ~%~%uint8 decision_behavior~%autohyu_msgs/Trajectory[] trajectory~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: autohyu_msgs/Trajectory~%# std_msgs/Header~%std_msgs/Header header~%~%uint16 id~%autohyu_msgs/TrajectoryPoint[] point~%================================================================================~%MSG: autohyu_msgs/TrajectoryPoint~%float32 time~%float32 distance~%uint16  direction~%float32 x~%float32 y~%float32 z~%float32 yaw~%float32 curvature~%float32 speed~%float32 acceleration~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Trajectories>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'trajectory) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Trajectories>))
  "Converts a ROS message object to a list"
  (cl:list 'Trajectories
    (cl:cons ':header (header msg))
    (cl:cons ':decision_behavior (decision_behavior msg))
    (cl:cons ':trajectory (trajectory msg))
))
