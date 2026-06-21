;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::LaneletPath)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'LaneletPath (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::LANELETPATH")
  (make-package "AUTOHYU_MSGS::LANELETPATH"))

(in-package "ROS")
;;//! \htmlinclude LaneletPath.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autohyu_msgs::LaneletPath
  :super ros::object
  :slots (_header _ll_id_path _ll_id_ego _goal_point ))

(defmethod autohyu_msgs::LaneletPath
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:ll_id_path __ll_id_path) (make-array 0 :initial-element 0 :element-type :integer))
    ((:ll_id_ego __ll_id_ego) 0)
    ((:goal_point __goal_point) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _ll_id_path __ll_id_path)
   (setq _ll_id_ego (round __ll_id_ego))
   (setq _goal_point __goal_point)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:ll_id_path
   (&optional __ll_id_path)
   (if __ll_id_path (setq _ll_id_path __ll_id_path)) _ll_id_path)
  (:ll_id_ego
   (&optional __ll_id_ego)
   (if __ll_id_ego (setq _ll_id_ego __ll_id_ego)) _ll_id_ego)
  (:goal_point
   (&rest __goal_point)
   (if (keywordp (car __goal_point))
       (send* _goal_point __goal_point)
     (progn
       (if __goal_point (setq _goal_point (car __goal_point)))
       _goal_point)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int64[] _ll_id_path
    (* 8    (length _ll_id_path)) 4
    ;; int64 _ll_id_ego
    8
    ;; geometry_msgs/Point _goal_point
    (send _goal_point :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int64[] _ll_id_path
     (write-long (length _ll_id_path) s)
     (dotimes (i (length _ll_id_path))
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _ll_id_path i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _ll_id_path i)) (= (length ((elt _ll_id_path i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _ll_id_path i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _ll_id_path i) . bv) 1) -1) s))
             ((and (class (elt _ll_id_path i)) (= (length ((elt _ll_id_path i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _ll_id_path i) . bv) 0) s)
              (write-long (if (>= (elt _ll_id_path i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _ll_id_path i) s)(write-long (if (>= (elt _ll_id_path i) 0) 0 #xffffffff) s)))
       )
     ;; int64 _ll_id_ego
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _ll_id_ego (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _ll_id_ego) (= (length (_ll_id_ego . bv)) 2)) ;; bignum
              (write-long (ash (elt (_ll_id_ego . bv) 0) 0) s)
              (write-long (ash (elt (_ll_id_ego . bv) 1) -1) s))
             ((and (class _ll_id_ego) (= (length (_ll_id_ego . bv)) 1)) ;; big1
              (write-long (elt (_ll_id_ego . bv) 0) s)
              (write-long (if (>= _ll_id_ego 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _ll_id_ego s)(write-long (if (>= _ll_id_ego 0) 0 #xffffffff) s)))
     ;; geometry_msgs/Point _goal_point
       (send _goal_point :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int64[] _ll_id_path
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ll_id_path (instantiate integer-vector n))
     (dotimes (i n)
#+(or :alpha :irix6 :x86_64)
      (setf (elt _ll_id_path i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _ll_id_path i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     ))
   ;; int64 _ll_id_ego
#+(or :alpha :irix6 :x86_64)
      (setf _ll_id_ego (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _ll_id_ego (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; geometry_msgs/Point _goal_point
     (send _goal_point :deserialize buf ptr-) (incf ptr- (send _goal_point :serialization-length))
   ;;
   self)
  )

(setf (get autohyu_msgs::LaneletPath :md5sum-) "c7ff983bae1712fb37868ddd2fe37071")
(setf (get autohyu_msgs::LaneletPath :datatype-) "autohyu_msgs/LaneletPath")
(setf (get autohyu_msgs::LaneletPath :definition-)
      "std_msgs/Header header

int64[] ll_id_path
int64 ll_id_ego
geometry_msgs/Point goal_point
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

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :autohyu_msgs/LaneletPath "c7ff983bae1712fb37868ddd2fe37071")


