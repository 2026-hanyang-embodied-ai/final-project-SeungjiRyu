;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::TrajectoryBoundary)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'TrajectoryBoundary (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::TRAJECTORYBOUNDARY")
  (make-package "AUTOHYU_MSGS::TRAJECTORYBOUNDARY"))

(in-package "ROS")
;;//! \htmlinclude TrajectoryBoundary.msg.html


(defclass autohyu_msgs::TrajectoryBoundary
  :super ros::object
  :slots (_point ))

(defmethod autohyu_msgs::TrajectoryBoundary
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
    ;; autohyu_msgs/TrajectoryBoundaryPoint[] _point
    (apply #'+ (send-all _point :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; autohyu_msgs/TrajectoryBoundaryPoint[] _point
     (write-long (length _point) s)
     (dolist (elem _point)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; autohyu_msgs/TrajectoryBoundaryPoint[] _point
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _point (let (r) (dotimes (i n) (push (instance autohyu_msgs::TrajectoryBoundaryPoint :init) r)) r))
     (dolist (elem- _point)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get autohyu_msgs::TrajectoryBoundary :md5sum-) "855c97146bb19f8639cd6503bd7dae24")
(setf (get autohyu_msgs::TrajectoryBoundary :datatype-) "autohyu_msgs/TrajectoryBoundary")
(setf (get autohyu_msgs::TrajectoryBoundary :definition-)
      "autohyu_msgs/TrajectoryBoundaryPoint[] point
================================================================================
MSG: autohyu_msgs/TrajectoryBoundaryPoint
float32 x
float32 y
float32 z
float32 s
float32 n
")



(provide :autohyu_msgs/TrajectoryBoundary "855c97146bb19f8639cd6503bd7dae24")


