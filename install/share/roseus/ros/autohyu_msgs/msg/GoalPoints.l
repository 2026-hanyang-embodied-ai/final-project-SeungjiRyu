;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::GoalPoints)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'GoalPoints (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::GOALPOINTS")
  (make-package "AUTOHYU_MSGS::GOALPOINTS"))

(in-package "ROS")
;;//! \htmlinclude GoalPoints.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass autohyu_msgs::GoalPoints
  :super ros::object
  :slots (_goal_points ))

(defmethod autohyu_msgs::GoalPoints
  (:init
   (&key
    ((:goal_points __goal_points) ())
    )
   (send-super :init)
   (setq _goal_points __goal_points)
   self)
  (:goal_points
   (&rest __goal_points)
   (if (keywordp (car __goal_points))
       (send* _goal_points __goal_points)
     (progn
       (if __goal_points (setq _goal_points (car __goal_points)))
       _goal_points)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point[] _goal_points
    (apply #'+ (send-all _goal_points :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point[] _goal_points
     (write-long (length _goal_points) s)
     (dolist (elem _goal_points)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point[] _goal_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _goal_points (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _goal_points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get autohyu_msgs::GoalPoints :md5sum-) "d9c0f6fe1383e1e35c12b2c5901041a7")
(setf (get autohyu_msgs::GoalPoints :datatype-) "autohyu_msgs/GoalPoints")
(setf (get autohyu_msgs::GoalPoints :definition-)
      "geometry_msgs/Point[] goal_points
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :autohyu_msgs/GoalPoints "d9c0f6fe1383e1e35c12b2c5901041a7")


