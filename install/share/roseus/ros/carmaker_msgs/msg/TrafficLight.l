;; Auto-generated. Do not edit!


(when (boundp 'carmaker_msgs::TrafficLight)
  (if (not (find-package "CARMAKER_MSGS"))
    (make-package "CARMAKER_MSGS"))
  (shadow 'TrafficLight (find-package "CARMAKER_MSGS")))
(unless (find-package "CARMAKER_MSGS::TRAFFICLIGHT")
  (make-package "CARMAKER_MSGS::TRAFFICLIGHT"))

(in-package "ROS")
;;//! \htmlinclude TrafficLight.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass carmaker_msgs::TrafficLight
  :super ros::object
  :slots (_header _TrafficLightID _TrafficLightState ))

(defmethod carmaker_msgs::TrafficLight
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:TrafficLightID __TrafficLightID) 0)
    ((:TrafficLightState __TrafficLightState) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _TrafficLightID (round __TrafficLightID))
   (setq _TrafficLightState (round __TrafficLightState))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:TrafficLightID
   (&optional __TrafficLightID)
   (if __TrafficLightID (setq _TrafficLightID __TrafficLightID)) _TrafficLightID)
  (:TrafficLightState
   (&optional __TrafficLightState)
   (if __TrafficLightState (setq _TrafficLightState __TrafficLightState)) _TrafficLightState)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint16 _TrafficLightID
    2
    ;; uint8 _TrafficLightState
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint16 _TrafficLightID
       (write-word _TrafficLightID s)
     ;; uint8 _TrafficLightState
       (write-byte _TrafficLightState s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint16 _TrafficLightID
     (setq _TrafficLightID (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _TrafficLightState
     (setq _TrafficLightState (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get carmaker_msgs::TrafficLight :md5sum-) "df7500dfb83cf8c9771f4d242f622dc5")
(setf (get carmaker_msgs::TrafficLight :datatype-) "carmaker_msgs/TrafficLight")
(setf (get carmaker_msgs::TrafficLight :definition-)
      "# std_msgs/Header
std_msgs/Header header

uint16 TrafficLightID
uint8 TrafficLightState
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



(provide :carmaker_msgs/TrafficLight "df7500dfb83cf8c9771f4d242f622dc5")


