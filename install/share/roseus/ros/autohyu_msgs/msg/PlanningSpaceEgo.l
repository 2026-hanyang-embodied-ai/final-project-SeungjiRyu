;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::PlanningSpaceEgo)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'PlanningSpaceEgo (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::PLANNINGSPACEEGO")
  (make-package "AUTOHYU_MSGS::PLANNINGSPACEEGO"))

(in-package "ROS")
;;//! \htmlinclude PlanningSpaceEgo.msg.html


(defclass autohyu_msgs::PlanningSpaceEgo
  :super ros::object
  :slots (_state ))

(defmethod autohyu_msgs::PlanningSpaceEgo
  (:init
   (&key
    ((:state __state) ())
    )
   (send-super :init)
   (setq _state __state)
   self)
  (:state
   (&rest __state)
   (if (keywordp (car __state))
       (send* _state __state)
     (progn
       (if __state (setq _state (car __state)))
       _state)))
  (:serialization-length
   ()
   (+
    ;; autohyu_msgs/PlanningSpaceState[] _state
    (apply #'+ (send-all _state :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; autohyu_msgs/PlanningSpaceState[] _state
     (write-long (length _state) s)
     (dolist (elem _state)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; autohyu_msgs/PlanningSpaceState[] _state
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _state (let (r) (dotimes (i n) (push (instance autohyu_msgs::PlanningSpaceState :init) r)) r))
     (dolist (elem- _state)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get autohyu_msgs::PlanningSpaceEgo :md5sum-) "a7e39028661dc5d2bad0d2373d1ce403")
(setf (get autohyu_msgs::PlanningSpaceEgo :datatype-) "autohyu_msgs/PlanningSpaceEgo")
(setf (get autohyu_msgs::PlanningSpaceEgo :definition-)
      "autohyu_msgs/PlanningSpaceState[] state

================================================================================
MSG: autohyu_msgs/PlanningSpaceState
float64 stamp
float64 x
float64 y
float64 heading
float64 vx
float64 vy
float64 ax
float64 ay
float64 tire_angle
")



(provide :autohyu_msgs/PlanningSpaceEgo "a7e39028661dc5d2bad0d2373d1ce403")


