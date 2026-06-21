;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::PlanningSpacePoint)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'PlanningSpacePoint (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::PLANNINGSPACEPOINT")
  (make-package "AUTOHYU_MSGS::PLANNINGSPACEPOINT"))

(in-package "ROS")
;;//! \htmlinclude PlanningSpacePoint.msg.html


(defclass autohyu_msgs::PlanningSpacePoint
  :super ros::object
  :slots (_x _y _heading _traffic_light_id _traffic_light_color ))

(defmethod autohyu_msgs::PlanningSpacePoint
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:heading __heading) 0.0)
    ((:traffic_light_id __traffic_light_id) "")
    ((:traffic_light_color __traffic_light_color) 0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _heading (float __heading))
   (setq _traffic_light_id (string __traffic_light_id))
   (setq _traffic_light_color (round __traffic_light_color))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:heading
   (&optional __heading)
   (if __heading (setq _heading __heading)) _heading)
  (:traffic_light_id
   (&optional __traffic_light_id)
   (if __traffic_light_id (setq _traffic_light_id __traffic_light_id)) _traffic_light_id)
  (:traffic_light_color
   (&optional __traffic_light_color)
   (if __traffic_light_color (setq _traffic_light_color __traffic_light_color)) _traffic_light_color)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _heading
    8
    ;; string _traffic_light_id
    4 (length _traffic_light_id)
    ;; uint16 _traffic_light_color
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _heading
       (sys::poke _heading (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _traffic_light_id
       (write-long (length _traffic_light_id) s) (princ _traffic_light_id s)
     ;; uint16 _traffic_light_color
       (write-word _traffic_light_color s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _heading
     (setq _heading (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _traffic_light_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _traffic_light_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint16 _traffic_light_color
     (setq _traffic_light_color (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get autohyu_msgs::PlanningSpacePoint :md5sum-) "aa200d3801db544dc5c0cfd6666243ad")
(setf (get autohyu_msgs::PlanningSpacePoint :datatype-) "autohyu_msgs/PlanningSpacePoint")
(setf (get autohyu_msgs::PlanningSpacePoint :definition-)
      "float64 x
float64 y
float64 heading
string  traffic_light_id
uint16  traffic_light_color
")



(provide :autohyu_msgs/PlanningSpacePoint "aa200d3801db544dc5c0cfd6666243ad")


