;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::PlanningSpaceObject)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'PlanningSpaceObject (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::PLANNINGSPACEOBJECT")
  (make-package "AUTOHYU_MSGS::PLANNINGSPACEOBJECT"))

(in-package "ROS")
;;//! \htmlinclude PlanningSpaceObject.msg.html


(defclass autohyu_msgs::PlanningSpaceObject
  :super ros::object
  :slots (_id _length _width _height _classification _state ))

(defmethod autohyu_msgs::PlanningSpaceObject
  (:init
   (&key
    ((:id __id) 0)
    ((:length __length) 0.0)
    ((:width __width) 0.0)
    ((:height __height) 0.0)
    ((:classification __classification) 0)
    ((:state __state) ())
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _length (float __length))
   (setq _width (float __width))
   (setq _height (float __height))
   (setq _classification (round __classification))
   (setq _state __state)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:length
   (&optional __length)
   (if __length (setq _length __length)) _length)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:classification
   (&optional __classification)
   (if __classification (setq _classification __classification)) _classification)
  (:state
   (&rest __state)
   (if (keywordp (car __state))
       (send* _state __state)
     (progn
       (if __state (setq _state (car __state)))
       _state)))
  (:serialization-length
   ()
   (+
    ;; uint64 _id
    8
    ;; float64 _length
    8
    ;; float64 _width
    8
    ;; float64 _height
    8
    ;; uint16 _classification
    2
    ;; autohyu_msgs/PlanningSpaceState[] _state
    (apply #'+ (send-all _state :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint64 _id
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
     ;; float64 _length
       (sys::poke _length (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _width
       (sys::poke _width (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _height
       (sys::poke _height (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint16 _classification
       (write-word _classification s)
     ;; autohyu_msgs/PlanningSpaceState[] _state
     (write-long (length _state) s)
     (dolist (elem _state)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint64 _id
     
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
   ;; float64 _length
     (setq _length (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _width
     (setq _width (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _height
     (setq _height (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint16 _classification
     (setq _classification (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; autohyu_msgs/PlanningSpaceState[] _state
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _state (let (r) (dotimes (i n) (push (instance autohyu_msgs::PlanningSpaceState :init) r)) r))
     (dolist (elem- _state)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get autohyu_msgs::PlanningSpaceObject :md5sum-) "124f79f4bfef2fc993aeba3f2b4a639a")
(setf (get autohyu_msgs::PlanningSpaceObject :datatype-) "autohyu_msgs/PlanningSpaceObject")
(setf (get autohyu_msgs::PlanningSpaceObject :definition-)
      "uint64  id
float64 length
float64 width
float64 height
uint16  classification

autohyu_msgs/PlanningSpaceState[] state
================================================================================
MSG: autohyu_msgs/PlanningSpaceState
float64 stamp
float64 x
float64 y
float64 heading
float64 vx
float64 vy
float64 ax
float64 ay
float64 tire_angle
")



(provide :autohyu_msgs/PlanningSpaceObject "124f79f4bfef2fc993aeba3f2b4a639a")


