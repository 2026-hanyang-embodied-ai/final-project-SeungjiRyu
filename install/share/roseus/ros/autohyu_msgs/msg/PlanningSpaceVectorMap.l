;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::PlanningSpaceVectorMap)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'PlanningSpaceVectorMap (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::PLANNINGSPACEVECTORMAP")
  (make-package "AUTOHYU_MSGS::PLANNINGSPACEVECTORMAP"))

(in-package "ROS")
;;//! \htmlinclude PlanningSpaceVectorMap.msg.html


(defclass autohyu_msgs::PlanningSpaceVectorMap
  :super ros::object
  :slots (_id _is_dividing_lane _traffic_light_id _traffic_light_color _max_speed _point _left_boundary _right_boundary ))

(defmethod autohyu_msgs::PlanningSpaceVectorMap
  (:init
   (&key
    ((:id __id) 0)
    ((:is_dividing_lane __is_dividing_lane) nil)
    ((:traffic_light_id __traffic_light_id) 0)
    ((:traffic_light_color __traffic_light_color) 0)
    ((:max_speed __max_speed) 0.0)
    ((:point __point) ())
    ((:left_boundary __left_boundary) ())
    ((:right_boundary __right_boundary) ())
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _is_dividing_lane __is_dividing_lane)
   (setq _traffic_light_id (round __traffic_light_id))
   (setq _traffic_light_color (round __traffic_light_color))
   (setq _max_speed (float __max_speed))
   (setq _point __point)
   (setq _left_boundary __left_boundary)
   (setq _right_boundary __right_boundary)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:is_dividing_lane
   (&optional (__is_dividing_lane :null))
   (if (not (eq __is_dividing_lane :null)) (setq _is_dividing_lane __is_dividing_lane)) _is_dividing_lane)
  (:traffic_light_id
   (&optional __traffic_light_id)
   (if __traffic_light_id (setq _traffic_light_id __traffic_light_id)) _traffic_light_id)
  (:traffic_light_color
   (&optional __traffic_light_color)
   (if __traffic_light_color (setq _traffic_light_color __traffic_light_color)) _traffic_light_color)
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
  (:left_boundary
   (&rest __left_boundary)
   (if (keywordp (car __left_boundary))
       (send* _left_boundary __left_boundary)
     (progn
       (if __left_boundary (setq _left_boundary (car __left_boundary)))
       _left_boundary)))
  (:right_boundary
   (&rest __right_boundary)
   (if (keywordp (car __right_boundary))
       (send* _right_boundary __right_boundary)
     (progn
       (if __right_boundary (setq _right_boundary (car __right_boundary)))
       _right_boundary)))
  (:serialization-length
   ()
   (+
    ;; int64 _id
    8
    ;; bool _is_dividing_lane
    1
    ;; int64 _traffic_light_id
    8
    ;; int32 _traffic_light_color
    4
    ;; float64 _max_speed
    8
    ;; autohyu_msgs/PlanningSpacePoint[] _point
    (apply #'+ (send-all _point :serialization-length)) 4
    ;; autohyu_msgs/PlanningSpacePoint[] _left_boundary
    (apply #'+ (send-all _left_boundary :serialization-length)) 4
    ;; autohyu_msgs/PlanningSpacePoint[] _right_boundary
    (apply #'+ (send-all _right_boundary :serialization-length)) 4
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
     ;; bool _is_dividing_lane
       (if _is_dividing_lane (write-byte -1 s) (write-byte 0 s))
     ;; int64 _traffic_light_id
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _traffic_light_id (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _traffic_light_id) (= (length (_traffic_light_id . bv)) 2)) ;; bignum
              (write-long (ash (elt (_traffic_light_id . bv) 0) 0) s)
              (write-long (ash (elt (_traffic_light_id . bv) 1) -1) s))
             ((and (class _traffic_light_id) (= (length (_traffic_light_id . bv)) 1)) ;; big1
              (write-long (elt (_traffic_light_id . bv) 0) s)
              (write-long (if (>= _traffic_light_id 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _traffic_light_id s)(write-long (if (>= _traffic_light_id 0) 0 #xffffffff) s)))
     ;; int32 _traffic_light_color
       (write-long _traffic_light_color s)
     ;; float64 _max_speed
       (sys::poke _max_speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; autohyu_msgs/PlanningSpacePoint[] _point
     (write-long (length _point) s)
     (dolist (elem _point)
       (send elem :serialize s)
       )
     ;; autohyu_msgs/PlanningSpacePoint[] _left_boundary
     (write-long (length _left_boundary) s)
     (dolist (elem _left_boundary)
       (send elem :serialize s)
       )
     ;; autohyu_msgs/PlanningSpacePoint[] _right_boundary
     (write-long (length _right_boundary) s)
     (dolist (elem _right_boundary)
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
   ;; bool _is_dividing_lane
     (setq _is_dividing_lane (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int64 _traffic_light_id
#+(or :alpha :irix6 :x86_64)
      (setf _traffic_light_id (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _traffic_light_id (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int32 _traffic_light_color
     (setq _traffic_light_color (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _max_speed
     (setq _max_speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; autohyu_msgs/PlanningSpacePoint[] _point
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _point (let (r) (dotimes (i n) (push (instance autohyu_msgs::PlanningSpacePoint :init) r)) r))
     (dolist (elem- _point)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; autohyu_msgs/PlanningSpacePoint[] _left_boundary
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _left_boundary (let (r) (dotimes (i n) (push (instance autohyu_msgs::PlanningSpacePoint :init) r)) r))
     (dolist (elem- _left_boundary)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; autohyu_msgs/PlanningSpacePoint[] _right_boundary
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _right_boundary (let (r) (dotimes (i n) (push (instance autohyu_msgs::PlanningSpacePoint :init) r)) r))
     (dolist (elem- _right_boundary)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get autohyu_msgs::PlanningSpaceVectorMap :md5sum-) "cfb901b2beee878505834aab53d39190")
(setf (get autohyu_msgs::PlanningSpaceVectorMap :datatype-) "autohyu_msgs/PlanningSpaceVectorMap")
(setf (get autohyu_msgs::PlanningSpaceVectorMap :definition-)
      "int64 id
bool is_dividing_lane
int64 traffic_light_id
int32 traffic_light_color
float64 max_speed
autohyu_msgs/PlanningSpacePoint[] point
autohyu_msgs/PlanningSpacePoint[] left_boundary
autohyu_msgs/PlanningSpacePoint[] right_boundary
================================================================================
MSG: autohyu_msgs/PlanningSpacePoint
float64 x
float64 y
float64 heading
string  traffic_light_id
uint16  traffic_light_color
")



(provide :autohyu_msgs/PlanningSpaceVectorMap "cfb901b2beee878505834aab53d39190")


