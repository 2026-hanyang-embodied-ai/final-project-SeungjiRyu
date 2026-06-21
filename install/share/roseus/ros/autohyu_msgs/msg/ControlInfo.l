;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::ControlInfo)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'ControlInfo (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::CONTROLINFO")
  (make-package "AUTOHYU_MSGS::CONTROLINFO"))

(in-package "ROS")
;;//! \htmlinclude ControlInfo.msg.html


(defclass autohyu_msgs::ControlInfo
  :super ros::object
  :slots (_cross_track_error _yaw_error _speed_error _target_speed _current_speed _opt_cost _opt_time _solve_time _total_time _sqp_iter _qp_iter ))

(defmethod autohyu_msgs::ControlInfo
  (:init
   (&key
    ((:cross_track_error __cross_track_error) 0.0)
    ((:yaw_error __yaw_error) 0.0)
    ((:speed_error __speed_error) 0.0)
    ((:target_speed __target_speed) 0.0)
    ((:current_speed __current_speed) 0.0)
    ((:opt_cost __opt_cost) 0.0)
    ((:opt_time __opt_time) 0.0)
    ((:solve_time __solve_time) 0.0)
    ((:total_time __total_time) 0.0)
    ((:sqp_iter __sqp_iter) 0.0)
    ((:qp_iter __qp_iter) 0.0)
    )
   (send-super :init)
   (setq _cross_track_error (float __cross_track_error))
   (setq _yaw_error (float __yaw_error))
   (setq _speed_error (float __speed_error))
   (setq _target_speed (float __target_speed))
   (setq _current_speed (float __current_speed))
   (setq _opt_cost (float __opt_cost))
   (setq _opt_time (float __opt_time))
   (setq _solve_time (float __solve_time))
   (setq _total_time (float __total_time))
   (setq _sqp_iter (float __sqp_iter))
   (setq _qp_iter (float __qp_iter))
   self)
  (:cross_track_error
   (&optional __cross_track_error)
   (if __cross_track_error (setq _cross_track_error __cross_track_error)) _cross_track_error)
  (:yaw_error
   (&optional __yaw_error)
   (if __yaw_error (setq _yaw_error __yaw_error)) _yaw_error)
  (:speed_error
   (&optional __speed_error)
   (if __speed_error (setq _speed_error __speed_error)) _speed_error)
  (:target_speed
   (&optional __target_speed)
   (if __target_speed (setq _target_speed __target_speed)) _target_speed)
  (:current_speed
   (&optional __current_speed)
   (if __current_speed (setq _current_speed __current_speed)) _current_speed)
  (:opt_cost
   (&optional __opt_cost)
   (if __opt_cost (setq _opt_cost __opt_cost)) _opt_cost)
  (:opt_time
   (&optional __opt_time)
   (if __opt_time (setq _opt_time __opt_time)) _opt_time)
  (:solve_time
   (&optional __solve_time)
   (if __solve_time (setq _solve_time __solve_time)) _solve_time)
  (:total_time
   (&optional __total_time)
   (if __total_time (setq _total_time __total_time)) _total_time)
  (:sqp_iter
   (&optional __sqp_iter)
   (if __sqp_iter (setq _sqp_iter __sqp_iter)) _sqp_iter)
  (:qp_iter
   (&optional __qp_iter)
   (if __qp_iter (setq _qp_iter __qp_iter)) _qp_iter)
  (:serialization-length
   ()
   (+
    ;; float64 _cross_track_error
    8
    ;; float64 _yaw_error
    8
    ;; float64 _speed_error
    8
    ;; float64 _target_speed
    8
    ;; float64 _current_speed
    8
    ;; float64 _opt_cost
    8
    ;; float64 _opt_time
    8
    ;; float64 _solve_time
    8
    ;; float64 _total_time
    8
    ;; float64 _sqp_iter
    8
    ;; float64 _qp_iter
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _cross_track_error
       (sys::poke _cross_track_error (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw_error
       (sys::poke _yaw_error (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed_error
       (sys::poke _speed_error (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _target_speed
       (sys::poke _target_speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _current_speed
       (sys::poke _current_speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _opt_cost
       (sys::poke _opt_cost (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _opt_time
       (sys::poke _opt_time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _solve_time
       (sys::poke _solve_time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _total_time
       (sys::poke _total_time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _sqp_iter
       (sys::poke _sqp_iter (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _qp_iter
       (sys::poke _qp_iter (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _cross_track_error
     (setq _cross_track_error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw_error
     (setq _yaw_error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed_error
     (setq _speed_error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _target_speed
     (setq _target_speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _current_speed
     (setq _current_speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _opt_cost
     (setq _opt_cost (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _opt_time
     (setq _opt_time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _solve_time
     (setq _solve_time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _total_time
     (setq _total_time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _sqp_iter
     (setq _sqp_iter (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _qp_iter
     (setq _qp_iter (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get autohyu_msgs::ControlInfo :md5sum-) "30f8ded77960efce2e4f59447134a078")
(setf (get autohyu_msgs::ControlInfo :datatype-) "autohyu_msgs/ControlInfo")
(setf (get autohyu_msgs::ControlInfo :definition-)
      "float64 cross_track_error
float64 yaw_error
float64 speed_error
float64 target_speed
float64 current_speed
float64 opt_cost
float64 opt_time
float64 solve_time
float64 total_time
float64 sqp_iter
float64 qp_iter
")



(provide :autohyu_msgs/ControlInfo "30f8ded77960efce2e4f59447134a078")


