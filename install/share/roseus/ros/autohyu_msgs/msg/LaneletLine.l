;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::LaneletLine)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'LaneletLine (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::LANELETLINE")
  (make-package "AUTOHYU_MSGS::LANELETLINE"))

(in-package "ROS")
;;//! \htmlinclude LaneletLine.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass autohyu_msgs::LaneletLine
  :super ros::object
  :slots (_id _line_type _line_color _point ))

(defmethod autohyu_msgs::LaneletLine
  (:init
   (&key
    ((:id __id) 0)
    ((:line_type __line_type) "")
    ((:line_color __line_color) "")
    ((:point __point) ())
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _line_type (string __line_type))
   (setq _line_color (string __line_color))
   (setq _point __point)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:line_type
   (&optional __line_type)
   (if __line_type (setq _line_type __line_type)) _line_type)
  (:line_color
   (&optional __line_color)
   (if __line_color (setq _line_color __line_color)) _line_color)
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
    ;; string _line_type
    4 (length _line_type)
    ;; string _line_color
    4 (length _line_color)
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
     ;; string _line_type
       (write-long (length _line_type) s) (princ _line_type s)
     ;; string _line_color
       (write-long (length _line_color) s) (princ _line_color s)
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
   ;; string _line_type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _line_type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _line_color
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _line_color (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
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

(setf (get autohyu_msgs::LaneletLine :md5sum-) "9c57b13f124b0bb158b6d8860251cbb8")
(setf (get autohyu_msgs::LaneletLine :datatype-) "autohyu_msgs/LaneletLine")
(setf (get autohyu_msgs::LaneletLine :definition-)
      "int64 id
string line_type
string line_color
geometry_msgs/Point[] point
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :autohyu_msgs/LaneletLine "9c57b13f124b0bb158b6d8860251cbb8")


