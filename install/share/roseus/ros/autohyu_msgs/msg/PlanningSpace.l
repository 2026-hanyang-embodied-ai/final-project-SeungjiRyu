;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::PlanningSpace)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'PlanningSpace (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::PLANNINGSPACE")
  (make-package "AUTOHYU_MSGS::PLANNINGSPACE"))

(in-package "ROS")
;;//! \htmlinclude PlanningSpace.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autohyu_msgs::PlanningSpace
  :super ros::object
  :slots (_header _ego _objects _lanes _routes _crosswalks _goal_routes ))

(defmethod autohyu_msgs::PlanningSpace
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:ego __ego) (instance autohyu_msgs::PlanningSpaceEgo :init))
    ((:objects __objects) ())
    ((:lanes __lanes) ())
    ((:routes __routes) ())
    ((:crosswalks __crosswalks) ())
    ((:goal_routes __goal_routes) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _ego __ego)
   (setq _objects __objects)
   (setq _lanes __lanes)
   (setq _routes __routes)
   (setq _crosswalks __crosswalks)
   (setq _goal_routes __goal_routes)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:ego
   (&rest __ego)
   (if (keywordp (car __ego))
       (send* _ego __ego)
     (progn
       (if __ego (setq _ego (car __ego)))
       _ego)))
  (:objects
   (&rest __objects)
   (if (keywordp (car __objects))
       (send* _objects __objects)
     (progn
       (if __objects (setq _objects (car __objects)))
       _objects)))
  (:lanes
   (&rest __lanes)
   (if (keywordp (car __lanes))
       (send* _lanes __lanes)
     (progn
       (if __lanes (setq _lanes (car __lanes)))
       _lanes)))
  (:routes
   (&rest __routes)
   (if (keywordp (car __routes))
       (send* _routes __routes)
     (progn
       (if __routes (setq _routes (car __routes)))
       _routes)))
  (:crosswalks
   (&rest __crosswalks)
   (if (keywordp (car __crosswalks))
       (send* _crosswalks __crosswalks)
     (progn
       (if __crosswalks (setq _crosswalks (car __crosswalks)))
       _crosswalks)))
  (:goal_routes
   (&rest __goal_routes)
   (if (keywordp (car __goal_routes))
       (send* _goal_routes __goal_routes)
     (progn
       (if __goal_routes (setq _goal_routes (car __goal_routes)))
       _goal_routes)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; autohyu_msgs/PlanningSpaceEgo _ego
    (send _ego :serialization-length)
    ;; autohyu_msgs/PlanningSpaceObject[] _objects
    (apply #'+ (send-all _objects :serialization-length)) 4
    ;; autohyu_msgs/PlanningSpaceVectorMap[] _lanes
    (apply #'+ (send-all _lanes :serialization-length)) 4
    ;; autohyu_msgs/PlanningSpaceVectorMap[] _routes
    (apply #'+ (send-all _routes :serialization-length)) 4
    ;; autohyu_msgs/PlanningSpaceVectorMap[] _crosswalks
    (apply #'+ (send-all _crosswalks :serialization-length)) 4
    ;; autohyu_msgs/PlanningSpaceVectorMap[] _goal_routes
    (apply #'+ (send-all _goal_routes :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; autohyu_msgs/PlanningSpaceEgo _ego
       (send _ego :serialize s)
     ;; autohyu_msgs/PlanningSpaceObject[] _objects
     (write-long (length _objects) s)
     (dolist (elem _objects)
       (send elem :serialize s)
       )
     ;; autohyu_msgs/PlanningSpaceVectorMap[] _lanes
     (write-long (length _lanes) s)
     (dolist (elem _lanes)
       (send elem :serialize s)
       )
     ;; autohyu_msgs/PlanningSpaceVectorMap[] _routes
     (write-long (length _routes) s)
     (dolist (elem _routes)
       (send elem :serialize s)
       )
     ;; autohyu_msgs/PlanningSpaceVectorMap[] _crosswalks
     (write-long (length _crosswalks) s)
     (dolist (elem _crosswalks)
       (send elem :serialize s)
       )
     ;; autohyu_msgs/PlanningSpaceVectorMap[] _goal_routes
     (write-long (length _goal_routes) s)
     (dolist (elem _goal_routes)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; autohyu_msgs/PlanningSpaceEgo _ego
     (send _ego :deserialize buf ptr-) (incf ptr- (send _ego :serialization-length))
   ;; autohyu_msgs/PlanningSpaceObject[] _objects
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _objects (let (r) (dotimes (i n) (push (instance autohyu_msgs::PlanningSpaceObject :init) r)) r))
     (dolist (elem- _objects)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; autohyu_msgs/PlanningSpaceVectorMap[] _lanes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _lanes (let (r) (dotimes (i n) (push (instance autohyu_msgs::PlanningSpaceVectorMap :init) r)) r))
     (dolist (elem- _lanes)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; autohyu_msgs/PlanningSpaceVectorMap[] _routes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _routes (let (r) (dotimes (i n) (push (instance autohyu_msgs::PlanningSpaceVectorMap :init) r)) r))
     (dolist (elem- _routes)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; autohyu_msgs/PlanningSpaceVectorMap[] _crosswalks
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _crosswalks (let (r) (dotimes (i n) (push (instance autohyu_msgs::PlanningSpaceVectorMap :init) r)) r))
     (dolist (elem- _crosswalks)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; autohyu_msgs/PlanningSpaceVectorMap[] _goal_routes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _goal_routes (let (r) (dotimes (i n) (push (instance autohyu_msgs::PlanningSpaceVectorMap :init) r)) r))
     (dolist (elem- _goal_routes)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get autohyu_msgs::PlanningSpace :md5sum-) "687f829ec6579e0ea7ab55d15b5a120c")
(setf (get autohyu_msgs::PlanningSpace :datatype-) "autohyu_msgs/PlanningSpace")
(setf (get autohyu_msgs::PlanningSpace :definition-)
      "std_msgs/Header header

# Ego
autohyu_msgs/PlanningSpaceEgo ego

# Objects
autohyu_msgs/PlanningSpaceObject[] objects

# Vector Map
autohyu_msgs/PlanningSpaceVectorMap[] lanes
autohyu_msgs/PlanningSpaceVectorMap[] routes
autohyu_msgs/PlanningSpaceVectorMap[] crosswalks
autohyu_msgs/PlanningSpaceVectorMap[] goal_routes
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

================================================================================
MSG: autohyu_msgs/PlanningSpaceEgo
autohyu_msgs/PlanningSpaceState[] state

================================================================================
MSG: autohyu_msgs/PlanningSpaceState
float64 stamp
float64 x
float64 y
float64 heading
float64 vx
float64 vy
float64 ax
float64 ay
float64 tire_angle
================================================================================
MSG: autohyu_msgs/PlanningSpaceObject
uint64  id
float64 length
float64 width
float64 height
uint16  classification

autohyu_msgs/PlanningSpaceState[] state
================================================================================
MSG: autohyu_msgs/PlanningSpaceVectorMap
int64 id
bool is_dividing_lane
int64 traffic_light_id
int32 traffic_light_color
float64 max_speed
autohyu_msgs/PlanningSpacePoint[] point
autohyu_msgs/PlanningSpacePoint[] left_boundary
autohyu_msgs/PlanningSpacePoint[] right_boundary
================================================================================
MSG: autohyu_msgs/PlanningSpacePoint
float64 x
float64 y
float64 heading
string  traffic_light_id
uint16  traffic_light_color
")



(provide :autohyu_msgs/PlanningSpace "687f829ec6579e0ea7ab55d15b5a120c")


