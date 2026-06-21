
(cl:in-package :asdf)

(defsystem "autohyu_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "MapBinSrv" :depends-on ("_package_MapBinSrv"))
    (:file "_package_MapBinSrv" :depends-on ("_package"))
  ))