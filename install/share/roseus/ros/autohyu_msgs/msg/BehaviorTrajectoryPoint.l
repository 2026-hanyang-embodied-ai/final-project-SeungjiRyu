;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::BehaviorTrajectoryPoint)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'BehaviorTrajectoryPoint (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::BEHAVIORTRAJECTORYPOINT")
  (make-package "AUTOHYU_MSGS::BEHAVIORTRAJECTORYPOINT"))

(in-package "ROS")
;;//! \htmlinclude BehaviorTrajectoryPoint.msg.html


(defclass autohyu_msgs::BehaviorTrajectoryPoint
  :super ros::object
  :slots (_time _distance _x _y _z _curvature _speed _max_speed _on_shortest_path _lane_num ))

(defmethod autohyu_msgs::BehaviorTrajectoryPoint
  (:init
   (&key
    ((:time __time) 0.0)
    ((:distance __distance) 0.0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:curvature __curvature) 0.0)
    ((:speed __speed) 0.0)
    ((:max_speed __max_speed) 0.0)
    ((:on_shortest_path __on_shortest_path) nil)
    ((:lane_num __lane_num) 0)
    )
   (send-super :init)
   (setq _time (float __time))
   (setq _distance (float __distance))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _curvature (float __curvature))
   (setq _speed (float __speed))
   (setq _max_speed (float __max_speed))
   (setq _on_shortest_path __on_shortest_path)
   (setq _lane_num (round __lane_num))
   self)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:curvature
   (&optional __curvature)
   (if __curvature (setq _curvature __curvature)) _curvature)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:max_speed
   (&optional __max_speed)
   (if __max_speed (setq _max_speed __max_speed)) _max_speed)
  (:on_shortest_path
   (&optional (__on_shortest_path :null))
   (if (not (eq __on_shortest_path :null)) (setq _on_shortest_path __on_shortest_path)) _on_shortest_path)
  (:lane_num
   (&optional __lane_num)
   (if __lane_num (setq _lane_num __lane_num)) _lane_num)
  (:serialization-length
   ()
   (+
    ;; float64 _time
    8
    ;; float64 _distance
    8
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; float64 _curvature
    8
    ;; float64 _speed
    8
    ;; float64 _max_speed
    8
    ;; bool _on_shortest_path
    1
    ;; int16 _lane_num
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _time
       (sys::poke _time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _curvature
       (sys::poke _curvature (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _max_speed
       (sys::poke _max_speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _on_shortest_path
       (if _on_shortest_path (write-byte -1 s) (write-byte 0 s))
     ;; int16 _lane_num
       (write-word _lane_num s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _time
     (setq _time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _distance
     (setq _distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _curvature
     (setq _curvature (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed
     (setq _speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _max_speed
     (setq _max_speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _on_shortest_path
     (setq _on_shortest_path (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int16 _lane_num
     (setq _lane_num (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get autohyu_msgs::BehaviorTrajectoryPoint :md5sum-) "4d2a8332a064d20083360d43491ce430")
(setf (get autohyu_msgs::BehaviorTrajectoryPoint :datatype-) "autohyu_msgs/BehaviorTrajectoryPoint")
(setf (get autohyu_msgs::BehaviorTrajectoryPoint :definition-)
      "float64 time
float64 distance
float64 x
float64 y
float64 z
float64 curvature
float64 speed
float64 max_speed
bool    on_shortest_path
int16   lane_num
")



(provide :autohyu_msgs/BehaviorTrajectoryPoint "4d2a8332a064d20083360d43491ce430")


