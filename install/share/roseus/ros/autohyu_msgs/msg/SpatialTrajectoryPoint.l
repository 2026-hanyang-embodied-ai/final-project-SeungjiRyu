;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::SpatialTrajectoryPoint)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'SpatialTrajectoryPoint (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::SPATIALTRAJECTORYPOINT")
  (make-package "AUTOHYU_MSGS::SPATIALTRAJECTORYPOINT"))

(in-package "ROS")
;;//! \htmlinclude SpatialTrajectoryPoint.msg.html


(defclass autohyu_msgs::SpatialTrajectoryPoint
  :super ros::object
  :slots (_x _y _z _on_shortest_path _lane_num ))

(defmethod autohyu_msgs::SpatialTrajectoryPoint
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:on_shortest_path __on_shortest_path) nil)
    ((:lane_num __lane_num) 0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _on_shortest_path __on_shortest_path)
   (setq _lane_num (round __lane_num))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:on_shortest_path
   (&optional (__on_shortest_path :null))
   (if (not (eq __on_shortest_path :null)) (setq _on_shortest_path __on_shortest_path)) _on_shortest_path)
  (:lane_num
   (&optional __lane_num)
   (if __lane_num (setq _lane_num __lane_num)) _lane_num)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _z
    4
    ;; bool _on_shortest_path
    1
    ;; int16 _lane_num
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _z
       (sys::poke _z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _on_shortest_path
       (if _on_shortest_path (write-byte -1 s) (write-byte 0 s))
     ;; int16 _lane_num
       (write-word _lane_num s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _z
     (setq _z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _on_shortest_path
     (setq _on_shortest_path (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int16 _lane_num
     (setq _lane_num (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get autohyu_msgs::SpatialTrajectoryPoint :md5sum-) "49797d301bc91d0456d52eb2d842a6b1")
(setf (get autohyu_msgs::SpatialTrajectoryPoint :datatype-) "autohyu_msgs/SpatialTrajectoryPoint")
(setf (get autohyu_msgs::SpatialTrajectoryPoint :definition-)
      "float32 x
float32 y
float32 z
bool on_shortest_path
int16 lane_num
")



(provide :autohyu_msgs/SpatialTrajectoryPoint "49797d301bc91d0456d52eb2d842a6b1")


