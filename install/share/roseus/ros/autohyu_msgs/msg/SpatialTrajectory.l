;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::SpatialTrajectory)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'SpatialTrajectory (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::SPATIALTRAJECTORY")
  (make-package "AUTOHYU_MSGS::SPATIALTRAJECTORY"))

(in-package "ROS")
;;//! \htmlinclude SpatialTrajectory.msg.html


(defclass autohyu_msgs::SpatialTrajectory
  :super ros::object
  :slots (_point ))

(defmethod autohyu_msgs::SpatialTrajectory
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
    ;; autohyu_msgs/SpatialTrajectoryPoint[] _point
    (apply #'+ (send-all _point :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; autohyu_msgs/SpatialTrajectoryPoint[] _point
     (write-long (length _point) s)
     (dolist (elem _point)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; autohyu_msgs/SpatialTrajectoryPoint[] _point
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _point (let (r) (dotimes (i n) (push (instance autohyu_msgs::SpatialTrajectoryPoint :init) r)) r))
     (dolist (elem- _point)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get autohyu_msgs::SpatialTrajectory :md5sum-) "fb5678abb8463c3e8dd1cb3a32561fd6")
(setf (get autohyu_msgs::SpatialTrajectory :datatype-) "autohyu_msgs/SpatialTrajectory")
(setf (get autohyu_msgs::SpatialTrajectory :definition-)
      "autohyu_msgs/SpatialTrajectoryPoint[] point
================================================================================
MSG: autohyu_msgs/SpatialTrajectoryPoint
float32 x
float32 y
float32 z
bool on_shortest_path
int16 lane_num
")



(provide :autohyu_msgs/SpatialTrajectory "fb5678abb8463c3e8dd1cb3a32561fd6")


