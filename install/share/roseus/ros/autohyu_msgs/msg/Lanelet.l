;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::Lanelet)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'Lanelet (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::LANELET")
  (make-package "AUTOHYU_MSGS::LANELET"))

(in-package "ROS")
;;//! \htmlinclude Lanelet.msg.html


(defclass autohyu_msgs::Lanelet
  :super ros::object
  :slots (_id _is_ego _is_goal _is_shortest_path _left_boundary_line_id _right_boundary_line_id _relation _traffic_sign _turn_signal _traffic_light ))

(defmethod autohyu_msgs::Lanelet
  (:init
   (&key
    ((:id __id) 0)
    ((:is_ego __is_ego) nil)
    ((:is_goal __is_goal) nil)
    ((:is_shortest_path __is_shortest_path) nil)
    ((:left_boundary_line_id __left_boundary_line_id) 0)
    ((:right_boundary_line_id __right_boundary_line_id) 0)
    ((:relation __relation) ())
    ((:traffic_sign __traffic_sign) ())
    ((:turn_signal __turn_signal) ())
    ((:traffic_light __traffic_light) ())
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _is_ego __is_ego)
   (setq _is_goal __is_goal)
   (setq _is_shortest_path __is_shortest_path)
   (setq _left_boundary_line_id (round __left_boundary_line_id))
   (setq _right_boundary_line_id (round __right_boundary_line_id))
   (setq _relation __relation)
   (setq _traffic_sign __traffic_sign)
   (setq _turn_signal __turn_signal)
   (setq _traffic_light __traffic_light)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:is_ego
   (&optional (__is_ego :null))
   (if (not (eq __is_ego :null)) (setq _is_ego __is_ego)) _is_ego)
  (:is_goal
   (&optional (__is_goal :null))
   (if (not (eq __is_goal :null)) (setq _is_goal __is_goal)) _is_goal)
  (:is_shortest_path
   (&optional (__is_shortest_path :null))
   (if (not (eq __is_shortest_path :null)) (setq _is_shortest_path __is_shortest_path)) _is_shortest_path)
  (:left_boundary_line_id
   (&optional __left_boundary_line_id)
   (if __left_boundary_line_id (setq _left_boundary_line_id __left_boundary_line_id)) _left_boundary_line_id)
  (:right_boundary_line_id
   (&optional __right_boundary_line_id)
   (if __right_boundary_line_id (setq _right_boundary_line_id __right_boundary_line_id)) _right_boundary_line_id)
  (:relation
   (&rest __relation)
   (if (keywordp (car __relation))
       (send* _relation __relation)
     (progn
       (if __relation (setq _relation (car __relation)))
       _relation)))
  (:traffic_sign
   (&rest __traffic_sign)
   (if (keywordp (car __traffic_sign))
       (send* _traffic_sign __traffic_sign)
     (progn
       (if __traffic_sign (setq _traffic_sign (car __traffic_sign)))
       _traffic_sign)))
  (:turn_signal
   (&rest __turn_signal)
   (if (keywordp (car __turn_signal))
       (send* _turn_signal __turn_signal)
     (progn
       (if __turn_signal (setq _turn_signal (car __turn_signal)))
       _turn_signal)))
  (:traffic_light
   (&rest __traffic_light)
   (if (keywordp (car __traffic_light))
       (send* _traffic_light __traffic_light)
     (progn
       (if __traffic_light (setq _traffic_light (car __traffic_light)))
       _traffic_light)))
  (:serialization-length
   ()
   (+
    ;; int64 _id
    8
    ;; bool _is_ego
    1
    ;; bool _is_goal
    1
    ;; bool _is_shortest_path
    1
    ;; int64 _left_boundary_line_id
    8
    ;; int64 _right_boundary_line_id
    8
    ;; autohyu_msgs/LaneletRelation[] _relation
    (apply #'+ (send-all _relation :serialization-length)) 4
    ;; autohyu_msgs/LaneletTrafficSign[] _traffic_sign
    (apply #'+ (send-all _traffic_sign :serialization-length)) 4
    ;; autohyu_msgs/LaneletTrafficSign[] _turn_signal
    (apply #'+ (send-all _turn_signal :serialization-length)) 4
    ;; autohyu_msgs/LaneletTrafficLight[] _traffic_light
    (apply #'+ (send-all _traffic_light :serialization-length)) 4
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
     ;; bool _is_ego
       (if _is_ego (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_goal
       (if _is_goal (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_shortest_path
       (if _is_shortest_path (write-byte -1 s) (write-byte 0 s))
     ;; int64 _left_boundary_line_id
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _left_boundary_line_id (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _left_boundary_line_id) (= (length (_left_boundary_line_id . bv)) 2)) ;; bignum
              (write-long (ash (elt (_left_boundary_line_id . bv) 0) 0) s)
              (write-long (ash (elt (_left_boundary_line_id . bv) 1) -1) s))
             ((and (class _left_boundary_line_id) (= (length (_left_boundary_line_id . bv)) 1)) ;; big1
              (write-long (elt (_left_boundary_line_id . bv) 0) s)
              (write-long (if (>= _left_boundary_line_id 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _left_boundary_line_id s)(write-long (if (>= _left_boundary_line_id 0) 0 #xffffffff) s)))
     ;; int64 _right_boundary_line_id
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _right_boundary_line_id (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _right_boundary_line_id) (= (length (_right_boundary_line_id . bv)) 2)) ;; bignum
              (write-long (ash (elt (_right_boundary_line_id . bv) 0) 0) s)
              (write-long (ash (elt (_right_boundary_line_id . bv) 1) -1) s))
             ((and (class _right_boundary_line_id) (= (length (_right_boundary_line_id . bv)) 1)) ;; big1
              (write-long (elt (_right_boundary_line_id . bv) 0) s)
              (write-long (if (>= _right_boundary_line_id 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _right_boundary_line_id s)(write-long (if (>= _right_boundary_line_id 0) 0 #xffffffff) s)))
     ;; autohyu_msgs/LaneletRelation[] _relation
     (write-long (length _relation) s)
     (dolist (elem _relation)
       (send elem :serialize s)
       )
     ;; autohyu_msgs/LaneletTrafficSign[] _traffic_sign
     (write-long (length _traffic_sign) s)
     (dolist (elem _traffic_sign)
       (send elem :serialize s)
       )
     ;; autohyu_msgs/LaneletTrafficSign[] _turn_signal
     (write-long (length _turn_signal) s)
     (dolist (elem _turn_signal)
       (send elem :serialize s)
       )
     ;; autohyu_msgs/LaneletTrafficLight[] _traffic_light
     (write-long (length _traffic_light) s)
     (dolist (elem _traffic_light)
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
   ;; bool _is_ego
     (setq _is_ego (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_goal
     (setq _is_goal (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_shortest_path
     (setq _is_shortest_path (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int64 _left_boundary_line_id
#+(or :alpha :irix6 :x86_64)
      (setf _left_boundary_line_id (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _left_boundary_line_id (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _right_boundary_line_id
#+(or :alpha :irix6 :x86_64)
      (setf _right_boundary_line_id (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _right_boundary_line_id (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; autohyu_msgs/LaneletRelation[] _relation
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _relation (let (r) (dotimes (i n) (push (instance autohyu_msgs::LaneletRelation :init) r)) r))
     (dolist (elem- _relation)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; autohyu_msgs/LaneletTrafficSign[] _traffic_sign
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _traffic_sign (let (r) (dotimes (i n) (push (instance autohyu_msgs::LaneletTrafficSign :init) r)) r))
     (dolist (elem- _traffic_sign)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; autohyu_msgs/LaneletTrafficSign[] _turn_signal
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _turn_signal (let (r) (dotimes (i n) (push (instance autohyu_msgs::LaneletTrafficSign :init) r)) r))
     (dolist (elem- _turn_signal)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; autohyu_msgs/LaneletTrafficLight[] _traffic_light
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _traffic_light (let (r) (dotimes (i n) (push (instance autohyu_msgs::LaneletTrafficLight :init) r)) r))
     (dolist (elem- _traffic_light)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get autohyu_msgs::Lanelet :md5sum-) "70053e1f1419d63eb5b6723712e051a8")
(setf (get autohyu_msgs::Lanelet :datatype-) "autohyu_msgs/Lanelet")
(setf (get autohyu_msgs::Lanelet :definition-)
      "int64 id
bool is_ego
bool is_goal
bool is_shortest_path
int64 left_boundary_line_id
int64 right_boundary_line_id
autohyu_msgs/LaneletRelation[] relation
autohyu_msgs/LaneletTrafficSign[] traffic_sign
autohyu_msgs/LaneletTrafficSign[] turn_signal
autohyu_msgs/LaneletTrafficLight[] traffic_light
================================================================================
MSG: autohyu_msgs/LaneletRelation
# Relation between lanes
uint8 NONE = 0
uint8 SUCCESSOR = 1
uint8 LEFT = 2
uint8 RIGHT = 3
uint8 ADJACENT_LEFT = 4
uint8 ADJACENT_RIGHT = 5
uint8 CONFLICTING = 6
uint8 AREA = 7

int64 id
uint8 type
================================================================================
MSG: autohyu_msgs/LaneletTrafficSign
int64 id
string element_type
geometry_msgs/Point[] point
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: autohyu_msgs/LaneletTrafficLight
int64 sign_id
int64 intersection_id
string light_type
geometry_msgs/Point[] stop_point
")



(provide :autohyu_msgs/Lanelet "70053e1f1419d63eb5b6723712e051a8")


