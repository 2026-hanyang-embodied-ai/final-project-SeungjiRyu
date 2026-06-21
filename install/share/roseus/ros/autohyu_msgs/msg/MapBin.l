;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::MapBin)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'MapBin (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::MAPBIN")
  (make-package "AUTOHYU_MSGS::MAPBIN"))

(in-package "ROS")
;;//! \htmlinclude MapBin.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autohyu_msgs::MapBin
  :super ros::object
  :slots (_header _data ))

(defmethod autohyu_msgs::MapBin
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:data __data) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _header __header)
   (setq _data __data)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int8[] _data
    (* 1    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int8[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (write-byte (elt _data i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int8[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _data i) 127) (setf (elt _data i) (- (elt _data i) 256)))
     ))
   ;;
   self)
  )

(setf (get autohyu_msgs::MapBin :md5sum-) "76e8caca558be0db7a08d3479289f362")
(setf (get autohyu_msgs::MapBin :datatype-) "autohyu_msgs/MapBin")
(setf (get autohyu_msgs::MapBin :definition-)
      "std_msgs/Header header
# binary data of lanelet2 map
# use int8 because byte is deprecated
int8[] data
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :autohyu_msgs/MapBin "76e8caca558be0db7a08d3479289f362")


