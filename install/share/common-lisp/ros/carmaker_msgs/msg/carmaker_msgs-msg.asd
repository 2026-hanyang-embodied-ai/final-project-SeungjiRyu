
(cl:in-package :asdf)

(defsystem "carmaker_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Control_Signal" :depends-on ("_package_Control_Signal"))
    (:file "_package_Control_Signal" :depends-on ("_package"))
    (:file "GNSS" :depends-on ("_package_GNSS"))
    (:file "_package_GNSS" :depends-on ("_package"))
    (:file "Object" :depends-on ("_package_Object"))
    (:file "_package_Object" :depends-on ("_package"))
    (:file "ObjectState" :depends-on ("_package_ObjectState"))
    (:file "_package_ObjectState" :depends-on ("_package"))
    (:file "Objects" :depends-on ("_package_Objects"))
    (:file "_package_Objects" :depends-on ("_package"))
    (:file "TrafficLight" :depends-on ("_package_TrafficLight"))
    (:file "_package_TrafficLight" :depends-on ("_package"))
    (:file "UAQ_Out" :depends-on ("_package_UAQ_Out"))
    (:file "_package_UAQ_Out" :depends-on ("_package"))
  ))