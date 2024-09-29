(asdf:defsystem #:battery
  :description "Battery information module for StumpWM"
  :author "Dmitrii Kosenkov"
  :license  "GPLv3"
  :version "0.1.1"
  :serial t
  :depends-on (#:stumpwm #:trivial-battery)
  :components ((:file "package")
               (:file "battery")))
