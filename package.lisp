(defpackage #:battery
	(:use #:cl #:stumpwm #:alexandria)
  (:export #:*percentage*
           #:*chargingp*
           #:init
           #:*notify-levels*
           #:modeline
           #:*modeline-fmt*))
