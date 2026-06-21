;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::LaneletLane)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'LaneletLane (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::LANELETLANE")
  (make-package "AUTOHYU_MSGS::LANELETLANE"))

(in-package "ROS")
;;//! \htmlinclude LaneletLane.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass autohyu_msgs::LaneletLane
  :super ros::object
  :slots (_id _lane_num _max_speed _point ))

(defmethod autohyu_msgs::LaneletLane
  (:init
   (&key
    ((:id __id) 0)
    ((:lane_num __lane_num) 0)
    ((:max_speed __max_speed) 0.0)
    ((:point __point) ())
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _lane_num (round __lane_num))
   (setq _max_speed (float __max_speed))
   (setq _point __point)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:lane_num
   (&optional __lane_num)
   (if __lane_num (setq _lane_num __lane_num)) _lane_num)
  (:max_speed
   (&optional __max_speed)
   (if __max_speed (setq _max_speed __max_speed)) _max_speed)
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
    ;; int64 _id
    8
    ;; int64 _lane_num
    8
    ;; float64 _max_speed
    8
    ;; geometry_msgs/Point[] _point
    (apply #'+ (send-all _point :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _id
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _id (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _id) (= (length (_id . bv)) 2)) ;; bignum
              (write-long (ash (elt (_id . bv) 0) 0) s)
              (write-long (ash (elt (_id . bv) 1) -1) s))
             ((and (class _id) (= (length (_id . bv)) 1)) ;; big1
              (write-long (elt (_id . bv) 0) s)
              (write-long (if (>= _id 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _id s)(write-long (if (>= _id 0) 0 #xffffffff) s)))
     ;; int64 _lane_num
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _lane_num (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _lane_num) (= (length (_lane_num . bv)) 2)) ;; bignum
              (write-long (ash (elt (_lane_num . bv) 0) 0) s)
              (write-long (ash (elt (_lane_num . bv) 1) -1) s))
             ((and (class _lane_num) (= (length (_lane_num . bv)) 1)) ;; big1
              (write-long (elt (_lane_num . bv) 0) s)
              (write-long (if (>= _lane_num 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _lane_num s)(write-long (if (>= _lane_num 0) 0 #xffffffff) s)))
     ;; float64 _max_speed
       (sys::poke _max_speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; geometry_msgs/Point[] _point
     (write-long (length _point) s)
     (dolist (elem _point)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _id
#+(or :alpha :irix6 :x86_64)
      (setf _id (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _id (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _lane_num
#+(or :alpha :irix6 :x86_64)
      (setf _lane_num (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _lane_num (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _max_speed
     (setq _max_speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; geometry_msgs/Point[] _point
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _point (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _point)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get autohyu_msgs::LaneletLane :md5sum-) "fb63acd9fe247ce61de16b34f509ede1")
(setf (get autohyu_msgs::LaneletLane :datatype-) "autohyu_msgs/LaneletLane")
(setf (get autohyu_msgs::LaneletLane :definition-)
      "int64 id
int64 lane_num
float64 max_speed
geometry_msgs/Point[] point
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :autohyu_msgs/LaneletLane "fb63acd9fe247ce61de16b34f509ede1")


