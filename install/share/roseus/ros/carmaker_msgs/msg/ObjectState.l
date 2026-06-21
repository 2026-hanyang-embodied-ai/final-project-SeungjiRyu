;; Auto-generated. Do not edit!


(when (boundp 'carmaker_msgs::ObjectState)
  (if (not (find-package "CARMAKER_MSGS"))
    (make-package "CARMAKER_MSGS"))
  (shadow 'ObjectState (find-package "CARMAKER_MSGS")))
(unless (find-package "CARMAKER_MSGS::OBJECTSTATE")
  (make-package "CARMAKER_MSGS::OBJECTSTATE"))

(in-package "ROS")
;;//! \htmlinclude ObjectState.msg.html


(defclass carmaker_msgs::ObjectState
  :super ros::object
  :slots (_latitude _longitude _elevation _x _y _z _roll _pitch _yaw _ego_roll _ego_pitch _ego_yaw _roll_rate _pitch_rate _yaw_rate _v_x _v_y _a_x _a_y ))

(defmethod carmaker_msgs::ObjectState
  (:init
   (&key
    ((:latitude __latitude) 0.0)
    ((:longitude __longitude) 0.0)
    ((:elevation __elevation) 0.0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:roll __roll) 0.0)
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    ((:ego_roll __ego_roll) 0.0)
    ((:ego_pitch __ego_pitch) 0.0)
    ((:ego_yaw __ego_yaw) 0.0)
    ((:roll_rate __roll_rate) 0.0)
    ((:pitch_rate __pitch_rate) 0.0)
    ((:yaw_rate __yaw_rate) 0.0)
    ((:v_x __v_x) 0.0)
    ((:v_y __v_y) 0.0)
    ((:a_x __a_x) 0.0)
    ((:a_y __a_y) 0.0)
    )
   (send-super :init)
   (setq _latitude (float __latitude))
   (setq _longitude (float __longitude))
   (setq _elevation (float __elevation))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _roll (float __roll))
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   (setq _ego_roll (float __ego_roll))
   (setq _ego_pitch (float __ego_pitch))
   (setq _ego_yaw (float __ego_yaw))
   (setq _roll_rate (float __roll_rate))
   (setq _pitch_rate (float __pitch_rate))
   (setq _yaw_rate (float __yaw_rate))
   (setq _v_x (float __v_x))
   (setq _v_y (float __v_y))
   (setq _a_x (float __a_x))
   (setq _a_y (float __a_y))
   self)
  (:latitude
   (&optional __latitude)
   (if __latitude (setq _latitude __latitude)) _latitude)
  (:longitude
   (&optional __longitude)
   (if __longitude (setq _longitude __longitude)) _longitude)
  (:elevation
   (&optional __elevation)
   (if __elevation (setq _elevation __elevation)) _elevation)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:ego_roll
   (&optional __ego_roll)
   (if __ego_roll (setq _ego_roll __ego_roll)) _ego_roll)
  (:ego_pitch
   (&optional __ego_pitch)
   (if __ego_pitch (setq _ego_pitch __ego_pitch)) _ego_pitch)
  (:ego_yaw
   (&optional __ego_yaw)
   (if __ego_yaw (setq _ego_yaw __ego_yaw)) _ego_yaw)
  (:roll_rate
   (&optional __roll_rate)
   (if __roll_rate (setq _roll_rate __roll_rate)) _roll_rate)
  (:pitch_rate
   (&optional __pitch_rate)
   (if __pitch_rate (setq _pitch_rate __pitch_rate)) _pitch_rate)
  (:yaw_rate
   (&optional __yaw_rate)
   (if __yaw_rate (setq _yaw_rate __yaw_rate)) _yaw_rate)
  (:v_x
   (&optional __v_x)
   (if __v_x (setq _v_x __v_x)) _v_x)
  (:v_y
   (&optional __v_y)
   (if __v_y (setq _v_y __v_y)) _v_y)
  (:a_x
   (&optional __a_x)
   (if __a_x (setq _a_x __a_x)) _a_x)
  (:a_y
   (&optional __a_y)
   (if __a_y (setq _a_y __a_y)) _a_y)
  (:serialization-length
   ()
   (+
    ;; float64 _latitude
    8
    ;; float64 _longitude
    8
    ;; float64 _elevation
    8
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; float32 _roll
    4
    ;; float32 _pitch
    4
    ;; float32 _yaw
    4
    ;; float32 _ego_roll
    4
    ;; float32 _ego_pitch
    4
    ;; float32 _ego_yaw
    4
    ;; float32 _roll_rate
    4
    ;; float32 _pitch_rate
    4
    ;; float32 _yaw_rate
    4
    ;; float32 _v_x
    4
    ;; float32 _v_y
    4
    ;; float32 _a_x
    4
    ;; float32 _a_y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _latitude
       (sys::poke _latitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _longitude
       (sys::poke _longitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _elevation
       (sys::poke _elevation (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ego_roll
       (sys::poke _ego_roll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ego_pitch
       (sys::poke _ego_pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ego_yaw
       (sys::poke _ego_yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _roll_rate
       (sys::poke _roll_rate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pitch_rate
       (sys::poke _pitch_rate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw_rate
       (sys::poke _yaw_rate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _v_x
       (sys::poke _v_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _v_y
       (sys::poke _v_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _a_x
       (sys::poke _a_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _a_y
       (sys::poke _a_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _latitude
     (setq _latitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _longitude
     (setq _longitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _elevation
     (setq _elevation (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _roll
     (setq _roll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pitch
     (setq _pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ego_roll
     (setq _ego_roll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ego_pitch
     (setq _ego_pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ego_yaw
     (setq _ego_yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _roll_rate
     (setq _roll_rate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pitch_rate
     (setq _pitch_rate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw_rate
     (setq _yaw_rate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _v_x
     (setq _v_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _v_y
     (setq _v_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _a_x
     (setq _a_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _a_y
     (setq _a_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get carmaker_msgs::ObjectState :md5sum-) "6a12156275044859859afbe394466b70")
(setf (get carmaker_msgs::ObjectState :datatype-) "carmaker_msgs/ObjectState")
(setf (get carmaker_msgs::ObjectState :definition-)
      "float64 latitude                  # GCS Coordinates latitude
float64 longitude                 # GCS Coordinates longitude
float64 elevation                 # GCS Coordinates elevation

float64 x
float64 y
float64 z

float32 roll                      # yaw in vehicle coordinates [rad]
float32 pitch                     # yaw in vehicle coordinates [rad]
float32 yaw                       # yaw in vehicle coordinates [rad]
float32 ego_roll                      # yaw in vehicle coordinates [rad]
float32 ego_pitch                     # yaw in vehicle coordinates [rad]
float32 ego_yaw                       # yaw in vehicle coordinates [rad]

float32 roll_rate                      # yaw in vehicle coordinates [rad]
float32 pitch_rate                     # yaw in vehicle coordinates [rad]
float32 yaw_rate                       # yaw in vehicle coordinates [rad]

float32 v_x                       # velocity in vehicle coordinates [m/s]
float32 v_y                       # velocity in vehicle coordinates [m/s]
float32 a_x                       # acceleration in vehicle coordinates [m/s^2]
float32 a_y                       # acceleration in vehicle coordinates [m/s^2]

")



(provide :carmaker_msgs/ObjectState "6a12156275044859859afbe394466b70")


