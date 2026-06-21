;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::Reference)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'Reference (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::REFERENCE")
  (make-package "AUTOHYU_MSGS::REFERENCE"))

(in-package "ROS")
;;//! \htmlinclude Reference.msg.html


(defclass autohyu_msgs::Reference
  :super ros::object
  :slots (_projection _wgs84 ))

(defmethod autohyu_msgs::Reference
  (:init
   (&key
    ((:projection __projection) "")
    ((:wgs84 __wgs84) (instance autohyu_msgs::WGS84 :init))
    )
   (send-super :init)
   (setq _projection (string __projection))
   (setq _wgs84 __wgs84)
   self)
  (:projection
   (&optional __projection)
   (if __projection (setq _projection __projection)) _projection)
  (:wgs84
   (&rest __wgs84)
   (if (keywordp (car __wgs84))
       (send* _wgs84 __wgs84)
     (progn
       (if __wgs84 (setq _wgs84 (car __wgs84)))
       _wgs84)))
  (:serialization-length
   ()
   (+
    ;; string _projection
    4 (length _projection)
    ;; autohyu_msgs/WGS84 _wgs84
    (send _wgs84 :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _projection
       (write-long (length _projection) s) (princ _projection s)
     ;; autohyu_msgs/WGS84 _wgs84
       (send _wgs84 :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _projection
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _projection (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; autohyu_msgs/WGS84 _wgs84
     (send _wgs84 :deserialize buf ptr-) (incf ptr- (send _wgs84 :serialization-length))
   ;;
   self)
  )

(setf (get autohyu_msgs::Reference :md5sum-) "4d603e2ddd7205e463437d38cbec7ed4")
(setf (get autohyu_msgs::Reference :datatype-) "autohyu_msgs/Reference")
(setf (get autohyu_msgs::Reference :definition-)
      "string  projection
autohyu_msgs/WGS84 wgs84
================================================================================
MSG: autohyu_msgs/WGS84
float64 latitude
float64 longitude
float64 altitude
")



(provide :autohyu_msgs/Reference "4d603e2ddd7205e463437d38cbec7ed4")


