;; Auto-generated. Do not edit!


(when (boundp 'carmaker_msgs::Object)
  (if (not (find-package "CARMAKER_MSGS"))
    (make-package "CARMAKER_MSGS"))
  (shadow 'Object (find-package "CARMAKER_MSGS")))
(unless (find-package "CARMAKER_MSGS::OBJECT")
  (make-package "CARMAKER_MSGS::OBJECT"))

(in-package "ROS")
;;//! \htmlinclude Object.msg.html


(defclass carmaker_msgs::Object
  :super ros::object
  :slots (_id _classification _lane_id _length _width _height _state ))

(defmethod carmaker_msgs::Object
  (:init
   (&key
    ((:id __id) 0)
    ((:classification __classification) 0)
    ((:lane_id __lane_id) 0)
    ((:length __length) 0.0)
    ((:width __width) 0.0)
    ((:height __height) 0.0)
    ((:state __state) (instance carmaker_msgs::ObjectState :init))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _classification (round __classification))
   (setq _lane_id (round __lane_id))
   (setq _length (float __length))
   (setq _width (float __width))
   (setq _height (float __height))
   (setq _state __state)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:classification
   (&optional __classification)
   (if __classification (setq _classification __classification)) _classification)
  (:lane_id
   (&optional __lane_id)
   (if __lane_id (setq _lane_id __lane_id)) _lane_id)
  (:length
   (&optional __length)
   (if __length (setq _length __length)) _length)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:state
   (&rest __state)
   (if (keywordp (car __state))
       (send* _state __state)
     (progn
       (if __state (setq _state (car __state)))
       _state)))
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ;; uint8 _classification
    1
    ;; uint8 _lane_id
    1
    ;; float32 _length
    4
    ;; float32 _width
    4
    ;; float32 _height
    4
    ;; carmaker_msgs/ObjectState _state
    (send _state :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _id
       (write-byte _id s)
     ;; uint8 _classification
       (write-byte _classification s)
     ;; uint8 _lane_id
       (write-byte _lane_id s)
     ;; float32 _length
       (sys::poke _length (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _width
       (sys::poke _width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _height
       (sys::poke _height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; carmaker_msgs/ObjectState _state
       (send _state :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _classification
     (setq _classification (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _lane_id
     (setq _lane_id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _length
     (setq _length (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _width
     (setq _width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _height
     (setq _height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; carmaker_msgs/ObjectState _state
     (send _state :deserialize buf ptr-) (incf ptr- (send _state :serialization-length))
   ;;
   self)
  )

(setf (get carmaker_msgs::Object :md5sum-) "111800c1669628270d9a907e3619e0e5")
(setf (get carmaker_msgs::Object :datatype-) "carmaker_msgs/Object")
(setf (get carmaker_msgs::Object :definition-)
      "# Object information
uint8 id
uint8 classification
uint8 lane_id

float32 length 
float32 width 
float32 height 

carmaker_msgs/ObjectState state

================================================================================
MSG: carmaker_msgs/ObjectState
float64 latitude                  # GCS Coordinates latitude
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



(provide :carmaker_msgs/Object "111800c1669628270d9a907e3619e0e5")


