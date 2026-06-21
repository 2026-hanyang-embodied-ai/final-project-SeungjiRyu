;; Auto-generated. Do not edit!


(when (boundp 'carmaker_msgs::Init)
  (if (not (find-package "CARMAKER_MSGS"))
    (make-package "CARMAKER_MSGS"))
  (shadow 'Init (find-package "CARMAKER_MSGS")))
(unless (find-package "CARMAKER_MSGS::INIT")
  (make-package "CARMAKER_MSGS::INIT"))
(unless (find-package "CARMAKER_MSGS::INITREQUEST")
  (make-package "CARMAKER_MSGS::INITREQUEST"))
(unless (find-package "CARMAKER_MSGS::INITRESPONSE")
  (make-package "CARMAKER_MSGS::INITRESPONSE"))

(in-package "ROS")





(defclass carmaker_msgs::InitRequest
  :super ros::object
  :slots (_message ))

(defmethod carmaker_msgs::InitRequest
  (:init
   (&key
    ((:message __message) "")
    )
   (send-super :init)
   (setq _message (string __message))
   self)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass carmaker_msgs::InitResponse
  :super ros::object
  :slots (_success _cycletime _message ))

(defmethod carmaker_msgs::InitResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:cycletime __cycletime) 0)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _cycletime (round __cycletime))
   (setq _message (string __message))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:cycletime
   (&optional __cycletime)
   (if __cycletime (setq _cycletime __cycletime)) _cycletime)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; int32 _cycletime
    4
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; int32 _cycletime
       (write-long _cycletime s)
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int32 _cycletime
     (setq _cycletime (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass carmaker_msgs::Init
  :super ros::object
  :slots ())

(setf (get carmaker_msgs::Init :md5sum-) "c39177108282824e55cd272f345a59bb")
(setf (get carmaker_msgs::Init :datatype-) "carmaker_msgs/Init")
(setf (get carmaker_msgs::Init :request) carmaker_msgs::InitRequest)
(setf (get carmaker_msgs::Init :response) carmaker_msgs::InitResponse)

(defmethod carmaker_msgs::InitRequest
  (:response () (instance carmaker_msgs::InitResponse :init)))

(setf (get carmaker_msgs::InitRequest :md5sum-) "c39177108282824e55cd272f345a59bb")
(setf (get carmaker_msgs::InitRequest :datatype-) "carmaker_msgs/InitRequest")
(setf (get carmaker_msgs::InitRequest :definition-)
      "string message    # informational, e.g. name of triggering node
---
bool   success    # indicate successful run of triggered service
int32  cycletime  # default cycle time in ms 
string message    # informational, e.g. for error messages

")

(setf (get carmaker_msgs::InitResponse :md5sum-) "c39177108282824e55cd272f345a59bb")
(setf (get carmaker_msgs::InitResponse :datatype-) "carmaker_msgs/InitResponse")
(setf (get carmaker_msgs::InitResponse :definition-)
      "string message    # informational, e.g. name of triggering node
---
bool   success    # indicate successful run of triggered service
int32  cycletime  # default cycle time in ms 
string message    # informational, e.g. for error messages

")



(provide :carmaker_msgs/Init "c39177108282824e55cd272f345a59bb")


