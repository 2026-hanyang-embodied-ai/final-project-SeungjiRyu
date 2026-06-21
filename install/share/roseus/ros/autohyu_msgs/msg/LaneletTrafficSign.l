;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::LaneletTrafficSign)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'LaneletTrafficSign (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::LANELETTRAFFICSIGN")
  (make-package "AUTOHYU_MSGS::LANELETTRAFFICSIGN"))

(in-package "ROS")
;;//! \htmlinclude LaneletTrafficSign.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass autohyu_msgs::LaneletTrafficSign
  :super ros::object
  :slots (_id _element_type _point ))

(defmethod autohyu_msgs::LaneletTrafficSign
  (:init
   (&key
    ((:id __id) 0)
    ((:element_type __element_type) "")
    ((:point __point) ())
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _element_type (string __element_type))
   (setq _point __point)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:element_type
   (&optional __element_type)
   (if __element_type (setq _element_type __element_type)) _element_type)
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
    ;; string _element_type
    4 (length _element_type)
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
     ;; string _element_type
       (write-long (length _element_type) s) (princ _element_type s)
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
   ;; string _element_type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _element_type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
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

(setf (get autohyu_msgs::LaneletTrafficSign :md5sum-) "353183291c773492e99bdf1efd8fcca2")
(setf (get autohyu_msgs::LaneletTrafficSign :datatype-) "autohyu_msgs/LaneletTrafficSign")
(setf (get autohyu_msgs::LaneletTrafficSign :definition-)
      "int64 id
string element_type
geometry_msgs/Point[] point
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :autohyu_msgs/LaneletTrafficSign "353183291c773492e99bdf1efd8fcca2")


