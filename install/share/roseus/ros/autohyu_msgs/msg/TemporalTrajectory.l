;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::TemporalTrajectory)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'TemporalTrajectory (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::TEMPORALTRAJECTORY")
  (make-package "AUTOHYU_MSGS::TEMPORALTRAJECTORY"))

(in-package "ROS")
;;//! \htmlinclude TemporalTrajectory.msg.html


(defclass autohyu_msgs::TemporalTrajectory
  :super ros::object
  :slots (_point ))

(defmethod autohyu_msgs::TemporalTrajectory
  (:init
   (&key
    ((:point __point) ())
    )
   (send-super :init)
   (setq _point __point)
   self)
  (:point
   (&rest __point)
   (if (keywordp (car __point))
       (send* _point __point)
     (progn
       (if __point (setq _point (car __point)))
       _point)))
  (:serialization-length
   ()
   (+
    ;; autohyu_msgs/TemporalTrajectoryPoint[] _point
    (apply #'+ (send-all _point :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; autohyu_msgs/TemporalTrajectoryPoint[] _point
     (write-long (length _point) s)
     (dolist (elem _point)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; autohyu_msgs/TemporalTrajectoryPoint[] _point
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _point (let (r) (dotimes (i n) (push (instance autohyu_msgs::TemporalTrajectoryPoint :init) r)) r))
     (dolist (elem- _point)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get autohyu_msgs::TemporalTrajectory :md5sum-) "8d4a1cb0de0a51e983f65281b57bfd76")
(setf (get autohyu_msgs::TemporalTrajectory :datatype-) "autohyu_msgs/TemporalTrajectory")
(setf (get autohyu_msgs::TemporalTrajectory :definition-)
      "autohyu_msgs/TemporalTrajectoryPoint[] point
================================================================================
MSG: autohyu_msgs/TemporalTrajectoryPoint
float32 time
float32 distance
float32 curvature
float32 speed
float32 ref_speed
")



(provide :autohyu_msgs/TemporalTrajectory "8d4a1cb0de0a51e983f65281b57bfd76")


