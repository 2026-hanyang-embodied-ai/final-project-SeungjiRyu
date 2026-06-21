;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::TrajectoryBoundaryPoint)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'TrajectoryBoundaryPoint (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::TRAJECTORYBOUNDARYPOINT")
  (make-package "AUTOHYU_MSGS::TRAJECTORYBOUNDARYPOINT"))

(in-package "ROS")
;;//! \htmlinclude TrajectoryBoundaryPoint.msg.html


(defclass autohyu_msgs::TrajectoryBoundaryPoint
  :super ros::object
  :slots (_x _y _z _s _n ))

(defmethod autohyu_msgs::TrajectoryBoundaryPoint
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:s __s) 0.0)
    ((:n __n) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _s (float __s))
   (setq _n (float __n))
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
  (:s
   (&optional __s)
   (if __s (setq _s __s)) _s)
  (:n
   (&optional __n)
   (if __n (setq _n __n)) _n)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _z
    4
    ;; float32 _s
    4
    ;; float32 _n
    4
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
     ;; float32 _s
       (sys::poke _s (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _n
       (sys::poke _n (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
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
   ;; float32 _s
     (setq _s (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _n
     (setq _n (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get autohyu_msgs::TrajectoryBoundaryPoint :md5sum-) "be270bb113d640f7a5cca332fdcae3d2")
(setf (get autohyu_msgs::TrajectoryBoundaryPoint :datatype-) "autohyu_msgs/TrajectoryBoundaryPoint")
(setf (get autohyu_msgs::TrajectoryBoundaryPoint :definition-)
      "float32 x
float32 y
float32 z
float32 s
float32 n
")



(provide :autohyu_msgs/TrajectoryBoundaryPoint "be270bb113d640f7a5cca332fdcae3d2")


