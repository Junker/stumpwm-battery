(defpackage #:battery
	(:use #:cl #:stumpwm #:alexandria)
  (:export #:*percentage*
           #:*chargingp*
           #:*check-interval*
           #:init
           #:*notify-levels*
           #:modeline
           #:*modeline-fmt*))
