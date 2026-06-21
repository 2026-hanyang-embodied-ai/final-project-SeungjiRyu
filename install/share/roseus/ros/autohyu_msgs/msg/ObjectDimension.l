;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::ObjectDimension)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'ObjectDimension (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::OBJECTDIMENSION")
  (make-package "AUTOHYU_MSGS::OBJECTDIMENSION"))

(in-package "ROS")
;;//! \htmlinclude ObjectDimension.msg.html


(defclass autohyu_msgs::ObjectDimension
  :super ros::object
  :slots (_length _width _height ))

(defmethod autohyu_msgs::ObjectDimension
  (:init
   (&key
    ((:length __length) 0.0)
    ((:width __width) 0.0)
    ((:height __height) 0.0)
    )
   (send-super :init)
   (setq _length (float __length))
   (setq _width (float __width))
   (setq _height (float __height))
   self)
  (:length
   (&optional __length)
   (if __length (setq _length __length)) _length)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:serialization-length
   ()
   (+
    ;; float32 _length
    4
    ;; float32 _width
    4
    ;; float32 _height
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _length
       (sys::poke _length (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _width
       (sys::poke _width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _height
       (sys::poke _height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _length
     (setq _length (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _width
     (setq _width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _height
     (setq _height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get autohyu_msgs::ObjectDimension :md5sum-) "d53e990829928c9e5c4832291f8458ce")
(setf (get autohyu_msgs::ObjectDimension :datatype-) "autohyu_msgs/ObjectDimension")
(setf (get autohyu_msgs::ObjectDimension :definition-)
      "float32 length
float32 width
float32 height

")



(provide :autohyu_msgs/ObjectDimension "d53e990829928c9e5c4832291f8458ce")


