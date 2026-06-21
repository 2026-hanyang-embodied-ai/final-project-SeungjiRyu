;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::TemporalTrajectoryPoint)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'TemporalTrajectoryPoint (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::TEMPORALTRAJECTORYPOINT")
  (make-package "AUTOHYU_MSGS::TEMPORALTRAJECTORYPOINT"))

(in-package "ROS")
;;//! \htmlinclude TemporalTrajectoryPoint.msg.html


(defclass autohyu_msgs::TemporalTrajectoryPoint
  :super ros::object
  :slots (_time _distance _curvature _speed _ref_speed ))

(defmethod autohyu_msgs::TemporalTrajectoryPoint
  (:init
   (&key
    ((:time __time) 0.0)
    ((:distance __distance) 0.0)
    ((:curvature __curvature) 0.0)
    ((:speed __speed) 0.0)
    ((:ref_speed __ref_speed) 0.0)
    )
   (send-super :init)
   (setq _time (float __time))
   (setq _distance (float __distance))
   (setq _curvature (float __curvature))
   (setq _speed (float __speed))
   (setq _ref_speed (float __ref_speed))
   self)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:curvature
   (&optional __curvature)
   (if __curvature (setq _curvature __curvature)) _curvature)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:ref_speed
   (&optional __ref_speed)
   (if __ref_speed (setq _ref_speed __ref_speed)) _ref_speed)
  (:serialization-length
   ()
   (+
    ;; float32 _time
    4
    ;; float32 _distance
    4
    ;; float32 _curvature
    4
    ;; float32 _speed
    4
    ;; float32 _ref_speed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _time
       (sys::poke _time (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _curvature
       (sys::poke _curvature (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ref_speed
       (sys::poke _ref_speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _time
     (setq _time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _curvature
     (setq _curvature (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ref_speed
     (setq _ref_speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get autohyu_msgs::TemporalTrajectoryPoint :md5sum-) "73e7ebf7e38e214887afcc1c9e420d0c")
(setf (get autohyu_msgs::TemporalTrajectoryPoint :datatype-) "autohyu_msgs/TemporalTrajectoryPoint")
(setf (get autohyu_msgs::TemporalTrajectoryPoint :definition-)
      "float32 time
float32 distance
float32 curvature
float32 speed
float32 ref_speed
")



(provide :autohyu_msgs/TemporalTrajectoryPoint "73e7ebf7e38e214887afcc1c9e420d0c")


