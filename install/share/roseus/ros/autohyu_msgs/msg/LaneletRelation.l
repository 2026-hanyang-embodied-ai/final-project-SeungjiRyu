;; Auto-generated. Do not edit!


(when (boundp 'autohyu_msgs::LaneletRelation)
  (if (not (find-package "AUTOHYU_MSGS"))
    (make-package "AUTOHYU_MSGS"))
  (shadow 'LaneletRelation (find-package "AUTOHYU_MSGS")))
(unless (find-package "AUTOHYU_MSGS::LANELETRELATION")
  (make-package "AUTOHYU_MSGS::LANELETRELATION"))

(in-package "ROS")
;;//! \htmlinclude LaneletRelation.msg.html


(intern "*NONE*" (find-package "AUTOHYU_MSGS::LANELETRELATION"))
(shadow '*NONE* (find-package "AUTOHYU_MSGS::LANELETRELATION"))
(defconstant autohyu_msgs::LaneletRelation::*NONE* 0)
(intern "*SUCCESSOR*" (find-package "AUTOHYU_MSGS::LANELETRELATION"))
(shadow '*SUCCESSOR* (find-package "AUTOHYU_MSGS::LANELETRELATION"))
(defconstant autohyu_msgs::LaneletRelation::*SUCCESSOR* 1)
(intern "*LEFT*" (find-package "AUTOHYU_MSGS::LANELETRELATION"))
(shadow '*LEFT* (find-package "AUTOHYU_MSGS::LANELETRELATION"))
(defconstant autohyu_msgs::LaneletRelation::*LEFT* 2)
(intern "*RIGHT*" (find-package "AUTOHYU_MSGS::LANELETRELATION"))
(shadow '*RIGHT* (find-package "AUTOHYU_MSGS::LANELETRELATION"))
(defconstant autohyu_msgs::LaneletRelation::*RIGHT* 3)
(intern "*ADJACENT_LEFT*" (find-package "AUTOHYU_MSGS::LANELETRELATION"))
(shadow '*ADJACENT_LEFT* (find-package "AUTOHYU_MSGS::LANELETRELATION"))
(defconstant autohyu_msgs::LaneletRelation::*ADJACENT_LEFT* 4)
(intern "*ADJACENT_RIGHT*" (find-package "AUTOHYU_MSGS::LANELETRELATION"))
(shadow '*ADJACENT_RIGHT* (find-package "AUTOHYU_MSGS::LANELETRELATION"))
(defconstant autohyu_msgs::LaneletRelation::*ADJACENT_RIGHT* 5)
(intern "*CONFLICTING*" (find-package "AUTOHYU_MSGS::LANELETRELATION"))
(shadow '*CONFLICTING* (find-package "AUTOHYU_MSGS::LANELETRELATION"))
(defconstant autohyu_msgs::LaneletRelation::*CONFLICTING* 6)
(intern "*AREA*" (find-package "AUTOHYU_MSGS::LANELETRELATION"))
(shadow '*AREA* (find-package "AUTOHYU_MSGS::LANELETRELATION"))
(defconstant autohyu_msgs::LaneletRelation::*AREA* 7)

(defun autohyu_msgs::LaneletRelation-to-symbol (const)
  (cond
        ((= const 0) 'autohyu_msgs::LaneletRelation::*NONE*)
        ((= const 1) 'autohyu_msgs::LaneletRelation::*SUCCESSOR*)
        ((= const 2) 'autohyu_msgs::LaneletRelation::*LEFT*)
        ((= const 3) 'autohyu_msgs::LaneletRelation::*RIGHT*)
        ((= const 4) 'autohyu_msgs::LaneletRelation::*ADJACENT_LEFT*)
        ((= const 5) 'autohyu_msgs::LaneletRelation::*ADJACENT_RIGHT*)
        ((= const 6) 'autohyu_msgs::LaneletRelation::*CONFLICTING*)
        ((= const 7) 'autohyu_msgs::LaneletRelation::*AREA*)
        (t nil)))

(defclass autohyu_msgs::LaneletRelation
  :super ros::object
  :slots (_id _type ))

(defmethod autohyu_msgs::LaneletRelation
  (:init
   (&key
    ((:id __id) 0)
    ((:type __type) 0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _type (round __type))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:serialization-length
   ()
   (+
    ;; int64 _id
    8
    ;; uint8 _type
    1
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
     ;; uint8 _type
       (write-byte _type s)
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
   ;; uint8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get autohyu_msgs::LaneletRelation :md5sum-) "af7fa5165485233d64a846f479ababaf")
(setf (get autohyu_msgs::LaneletRelation :datatype-) "autohyu_msgs/LaneletRelation")
(setf (get autohyu_msgs::LaneletRelation :definition-)
      "# Relation between lanes
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
")



(provide :autohyu_msgs/LaneletRelation "af7fa5165485233d64a846f479ababaf")


