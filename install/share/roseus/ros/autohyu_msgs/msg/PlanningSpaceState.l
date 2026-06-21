;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::PlanningSpaceState)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'PlanningSpaceState (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::PLANNINGSPACESTATE")
  (make-package "AUTOHYU_MSGS::PLANNINGSPACESTATE"))

(in-package "ROS")
;;//! \htmlinclude PlanningSpaceState.msg.html


(defclass autohyu_msgs::PlanningSpaceState
  :super ros::object
  :slots (_stamp _x _y _heading _vx _vy _ax _ay _tire_angle ))

(defmethod autohyu_msgs::PlanningSpaceState
  (:init
   (&key
    ((:stamp __stamp) 0.0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:heading __heading) 0.0)
    ((:vx __vx) 0.0)
    ((:vy __vy) 0.0)
    ((:ax __ax) 0.0)
    ((:ay __ay) 0.0)
    ((:tire_angle __tire_angle) 0.0)
    )
   (send-super :init)
   (setq _stamp (float __stamp))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _heading (float __heading))
   (setq _vx (float __vx))
   (setq _vy (float __vy))
   (setq _ax (float __ax))
   (setq _ay (float __ay))
   (setq _tire_angle (float __tire_angle))
   self)
  (:stamp
   (&optional __stamp)
   (if __stamp (setq _stamp __stamp)) _stamp)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:heading
   (&optional __heading)
   (if __heading (setq _heading __heading)) _heading)
  (:vx
   (&optional __vx)
   (if __vx (setq _vx __vx)) _vx)
  (:vy
   (&optional __vy)
   (if __vy (setq _vy __vy)) _vy)
  (:ax
   (&optional __ax)
   (if __ax (setq _ax __ax)) _ax)
  (:ay
   (&optional __ay)
   (if __ay (setq _ay __ay)) _ay)
  (:tire_angle
   (&optional __tire_angle)
   (if __tire_angle (setq _tire_angle __tire_angle)) _tire_angle)
  (:serialization-length
   ()
   (+
    ;; float64 _stamp
    8
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _heading
    8
    ;; float64 _vx
    8
    ;; float64 _vy
    8
    ;; float64 _ax
    8
    ;; float64 _ay
    8
    ;; float64 _tire_angle
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _stamp
       (sys::poke _stamp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _heading
       (sys::poke _heading (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vx
       (sys::poke _vx (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vy
       (sys::poke _vy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ax
       (sys::poke _ax (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ay
       (sys::poke _ay (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _tire_angle
       (sys::poke _tire_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _stamp
     (setq _stamp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _heading
     (setq _heading (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vx
     (setq _vx (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vy
     (setq _vy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ax
     (setq _ax (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ay
     (setq _ay (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _tire_angle
     (setq _tire_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get autohyu_msgs::PlanningSpaceState :md5sum-) "238e0b8ec7cb282350fb75455d7aaa7e")
(setf (get autohyu_msgs::PlanningSpaceState :datatype-) "autohyu_msgs/PlanningSpaceState")
(setf (get autohyu_msgs::PlanningSpaceState :definition-)
      "float64 stamp
float64 x
float64 y
float64 heading
float64 vx
float64 vy
float64 ax
float64 ay
float64 tire_angle
")



(provide :autohyu_msgs/PlanningSpaceState "238e0b8ec7cb282350fb75455d7aaa7e")


