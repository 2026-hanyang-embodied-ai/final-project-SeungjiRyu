;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::LaneletTrafficLight)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'LaneletTrafficLight (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::LANELETTRAFFICLIGHT")
  (make-package "AUTOHYU_MSGS::LANELETTRAFFICLIGHT"))

(in-package "ROS")
;;//! \htmlinclude LaneletTrafficLight.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass autohyu_msgs::LaneletTrafficLight
  :super ros::object
  :slots (_sign_id _intersection_id _light_type _stop_point ))

(defmethod autohyu_msgs::LaneletTrafficLight
  (:init
   (&key
    ((:sign_id __sign_id) 0)
    ((:intersection_id __intersection_id) 0)
    ((:light_type __light_type) "")
    ((:stop_point __stop_point) ())
    )
   (send-super :init)
   (setq _sign_id (round __sign_id))
   (setq _intersection_id (round __intersection_id))
   (setq _light_type (string __light_type))
   (setq _stop_point __stop_point)
   self)
  (:sign_id
   (&optional __sign_id)
   (if __sign_id (setq _sign_id __sign_id)) _sign_id)
  (:intersection_id
   (&optional __intersection_id)
   (if __intersection_id (setq _intersection_id __intersection_id)) _intersection_id)
  (:light_type
   (&optional __light_type)
   (if __light_type (setq _light_type __light_type)) _light_type)
  (:stop_point
   (&rest __stop_point)
   (if (keywordp (car __stop_point))
       (send* _stop_point __stop_point)
     (progn
       (if __stop_point (setq _stop_point (car __stop_point)))
       _stop_point)))
  (:serialization-length
   ()
   (+
    ;; int64 _sign_id
    8
    ;; int64 _intersection_id
    8
    ;; string _light_type
    4 (length _light_type)
    ;; geometry_msgs/Point[] _stop_point
    (apply #'+ (send-all _stop_point :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _sign_id
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _sign_id (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _sign_id) (= (length (_sign_id . bv)) 2)) ;; bignum
              (write-long (ash (elt (_sign_id . bv) 0) 0) s)
              (write-long (ash (elt (_sign_id . bv) 1) -1) s))
             ((and (class _sign_id) (= (length (_sign_id . bv)) 1)) ;; big1
              (write-long (elt (_sign_id . bv) 0) s)
              (write-long (if (>= _sign_id 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _sign_id s)(write-long (if (>= _sign_id 0) 0 #xffffffff) s)))
     ;; int64 _intersection_id
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _intersection_id (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _intersection_id) (= (length (_intersection_id . bv)) 2)) ;; bignum
              (write-long (ash (elt (_intersection_id . bv) 0) 0) s)
              (write-long (ash (elt (_intersection_id . bv) 1) -1) s))
             ((and (class _intersection_id) (= (length (_intersection_id . bv)) 1)) ;; big1
              (write-long (elt (_intersection_id . bv) 0) s)
              (write-long (if (>= _intersection_id 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _intersection_id s)(write-long (if (>= _intersection_id 0) 0 #xffffffff) s)))
     ;; string _light_type
       (write-long (length _light_type) s) (princ _light_type s)
     ;; geometry_msgs/Point[] _stop_point
     (write-long (length _stop_point) s)
     (dolist (elem _stop_point)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _sign_id
#+(or :alpha :irix6 :x86_64)
      (setf _sign_id (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _sign_id (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _intersection_id
#+(or :alpha :irix6 :x86_64)
      (setf _intersection_id (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _intersection_id (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; string _light_type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _light_type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Point[] _stop_point
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _stop_point (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _stop_point)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get autohyu_msgs::LaneletTrafficLight :md5sum-) "2ee52a1dcd096e64bfcc591f681c7089")
(setf (get autohyu_msgs::LaneletTrafficLight :datatype-) "autohyu_msgs/LaneletTrafficLight")
(setf (get autohyu_msgs::LaneletTrafficLight :definition-)
      "int64 sign_id
int64 intersection_id
string light_type
geometry_msgs/Point[] stop_point
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :autohyu_msgs/LaneletTrafficLight "2ee52a1dcd096e64bfcc591f681c7089")


