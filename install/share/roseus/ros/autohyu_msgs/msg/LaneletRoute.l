;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::LaneletRoute)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'LaneletRoute (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::LANELETROUTE")
  (make-package "AUTOHYU_MSGS::LANELETROUTE"))

(in-package "ROS")
;;//! \htmlinclude LaneletRoute.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autohyu_msgs::LaneletRoute
  :super ros::object
  :slots (_header _lanelet _boundary_line _center_lane ))

(defmethod autohyu_msgs::LaneletRoute
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:lanelet __lanelet) ())
    ((:boundary_line __boundary_line) ())
    ((:center_lane __center_lane) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _lanelet __lanelet)
   (setq _boundary_line __boundary_line)
   (setq _center_lane __center_lane)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:lanelet
   (&rest __lanelet)
   (if (keywordp (car __lanelet))
       (send* _lanelet __lanelet)
     (progn
       (if __lanelet (setq _lanelet (car __lanelet)))
       _lanelet)))
  (:boundary_line
   (&rest __boundary_line)
   (if (keywordp (car __boundary_line))
       (send* _boundary_line __boundary_line)
     (progn
       (if __boundary_line (setq _boundary_line (car __boundary_line)))
       _boundary_line)))
  (:center_lane
   (&rest __center_lane)
   (if (keywordp (car __center_lane))
       (send* _center_lane __center_lane)
     (progn
       (if __center_lane (setq _center_lane (car __center_lane)))
       _center_lane)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; autohyu_msgs/Lanelet[] _lanelet
    (apply #'+ (send-all _lanelet :serialization-length)) 4
    ;; autohyu_msgs/LaneletLine[] _boundary_line
    (apply #'+ (send-all _boundary_line :serialization-length)) 4
    ;; autohyu_msgs/LaneletLane[] _center_lane
    (apply #'+ (send-all _center_lane :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; autohyu_msgs/Lanelet[] _lanelet
     (write-long (length _lanelet) s)
     (dolist (elem _lanelet)
       (send elem :serialize s)
       )
     ;; autohyu_msgs/LaneletLine[] _boundary_line
     (write-long (length _boundary_line) s)
     (dolist (elem _boundary_line)
       (send elem :serialize s)
       )
     ;; autohyu_msgs/LaneletLane[] _center_lane
     (write-long (length _center_lane) s)
     (dolist (elem _center_lane)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; autohyu_msgs/Lanelet[] _lanelet
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _lanelet (let (r) (dotimes (i n) (push (instance autohyu_msgs::Lanelet :init) r)) r))
     (dolist (elem- _lanelet)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; autohyu_msgs/LaneletLine[] _boundary_line
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _boundary_line (let (r) (dotimes (i n) (push (instance autohyu_msgs::LaneletLine :init) r)) r))
     (dolist (elem- _boundary_line)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; autohyu_msgs/LaneletLane[] _center_lane
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _center_lane (let (r) (dotimes (i n) (push (instance autohyu_msgs::LaneletLane :init) r)) r))
     (dolist (elem- _center_lane)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get autohyu_msgs::LaneletRoute :md5sum-) "cd094afb7c96ccd6501ac3bbfa0c72d6")
(setf (get autohyu_msgs::LaneletRoute :datatype-) "autohyu_msgs/LaneletRoute")
(setf (get autohyu_msgs::LaneletRoute :definition-)
      "std_msgs/Header header

autohyu_msgs/Lanelet[] lanelet
autohyu_msgs/LaneletLine[] boundary_line
autohyu_msgs/LaneletLane[] center_lane
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
MSG: autohyu_msgs/Lanelet
int64 id
bool is_ego
bool is_goal
bool is_shortest_path
int64 left_boundary_line_id
int64 right_boundary_line_id
autohyu_msgs/LaneletRelation[] relation
autohyu_msgs/LaneletTrafficSign[] traffic_sign
autohyu_msgs/LaneletTrafficSign[] turn_signal
autohyu_msgs/LaneletTrafficLight[] traffic_light
================================================================================
MSG: autohyu_msgs/LaneletRelation
# Relation between lanes
uint8 NONE = 0
uint8 SUCCESSOR = 1
uint8 LEFT = 2
uint8 RIGHT = 3
uint8 ADJACENT_LEFT = 4
uint8 ADJACENT_RIGHT = 5
uint8 CONFLICTING = 6
uint8 AREA = 7

int64 id
uint8 type
================================================================================
MSG: autohyu_msgs/LaneletTrafficSign
int64 id
string element_type
geometry_msgs/Point[] point
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: autohyu_msgs/LaneletTrafficLight
int64 sign_id
int64 intersection_id
string light_type
geometry_msgs/Point[] stop_point
================================================================================
MSG: autohyu_msgs/LaneletLine
int64 id
string line_type
string line_color
geometry_msgs/Point[] point
================================================================================
MSG: autohyu_msgs/LaneletLane
int64 id
int64 lane_num
float64 max_speed
geometry_msgs/Point[] point
")



(provide :autohyu_msgs/LaneletRoute "cd094afb7c96ccd6501ac3bbfa0c72d6")


