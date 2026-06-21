;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::VehicleCmd)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'VehicleCmd (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::VEHICLECMD")
  (make-package "AUTOHYU_MSGS::VEHICLECMD"))

(in-package "ROS")
;;//! \htmlinclude VehicleCmd.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autohyu_msgs::VehicleCmd
  :super ros::object
  :slots (_header _steering_angle _front_tire_angle _speed _accel _gas _brake _torque ))

(defmethod autohyu_msgs::VehicleCmd
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:steering_angle __steering_angle) 0.0)
    ((:front_tire_angle __front_tire_angle) 0.0)
    ((:speed __speed) 0.0)
    ((:accel __accel) 0.0)
    ((:gas __gas) 0.0)
    ((:brake __brake) 0.0)
    ((:torque __torque) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _steering_angle (float __steering_angle))
   (setq _front_tire_angle (float __front_tire_angle))
   (setq _speed (float __speed))
   (setq _accel (float __accel))
   (setq _gas (float __gas))
   (setq _brake (float __brake))
   (setq _torque (float __torque))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:steering_angle
   (&optional __steering_angle)
   (if __steering_angle (setq _steering_angle __steering_angle)) _steering_angle)
  (:front_tire_angle
   (&optional __front_tire_angle)
   (if __front_tire_angle (setq _front_tire_angle __front_tire_angle)) _front_tire_angle)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:accel
   (&optional __accel)
   (if __accel (setq _accel __accel)) _accel)
  (:gas
   (&optional __gas)
   (if __gas (setq _gas __gas)) _gas)
  (:brake
   (&optional __brake)
   (if __brake (setq _brake __brake)) _brake)
  (:torque
   (&optional __torque)
   (if __torque (setq _torque __torque)) _torque)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _steering_angle
    4
    ;; float32 _front_tire_angle
    4
    ;; float32 _speed
    4
    ;; float32 _accel
    4
    ;; float32 _gas
    4
    ;; float32 _brake
    4
    ;; float32 _torque
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _steering_angle
       (sys::poke _steering_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _front_tire_angle
       (sys::poke _front_tire_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _accel
       (sys::poke _accel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _gas
       (sys::poke _gas (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _brake
       (sys::poke _brake (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _torque
       (sys::poke _torque (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _steering_angle
     (setq _steering_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _front_tire_angle
     (setq _front_tire_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _accel
     (setq _accel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _gas
     (setq _gas (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _brake
     (setq _brake (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _torque
     (setq _torque (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get autohyu_msgs::VehicleCmd :md5sum-) "54a2d1bf50d565fae4179abe8cb59f79")
(setf (get autohyu_msgs::VehicleCmd :datatype-) "autohyu_msgs/VehicleCmd")
(setf (get autohyu_msgs::VehicleCmd :definition-)
      "# std_msgs/Header
std_msgs/Header header


float32 steering_angle
float32 front_tire_angle
float32 speed
float32 accel
float32 gas
float32 brake
float32 torque
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :autohyu_msgs/VehicleCmd "54a2d1bf50d565fae4179abe8cb59f79")


