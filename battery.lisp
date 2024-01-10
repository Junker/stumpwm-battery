(in-package :battery)

(defparameter *modeline-fmt* "%c%p"
  "The default value for displaying battery information on the modeline")

(defparameter *formatters-alist*
  '((#\p  ml-percentage)
    (#\c  ml-charging)))

(defparameter *check-interval* 15)
(defparameter *notify-levels* '((15 . :critical)
                                (30 . :warning)))

(defvar *percentage* nil)
(defvar *chargingp* nil)

(defun notify (perc level)
  (message "~A Battery Level: ~A" level perc))

(defun update-info ()
  (when-let* ((battery-info (car (trivial-battery:battery-info)))
              (percentage (assoc-value battery-info "percentage"
                                       :test #'string=)))
    (when-let ((notify-level (assoc-value *notify-levels* percentage))
               (_ (< percentage (or *percentage* 0))))
      (notify percentage notify-level))
    (setf *percentage* percentage)
    (setf *chargingp* (assoc-value battery-info "chargingp"
                                   :test #'string=))))

(defun init ()
  (update-info)
  (run-with-timer 0 *check-interval* #'update-info))


(defun ml-percentage (perc chargingp)
  (declare (ignore chargingp))
  (if perc
      (format nil "^[~A~A%^]"
              (bar-zone-color perc 90 50 20 t)
              perc)
      "N"))

(defun ml-charging (perc chargingp)
  (declare (ignore perc))
  (if chargingp #\+ #\-))

(defun modeline (&optional ml)
  (declare (ignore ml))
  (format-expand *formatters-alist*
                 *modeline-fmt*
                 *percentage* *chargingp*))

(defcommand battery-status () ()
  (message "Battery: ~A%; Status: ~A"
           *percentage* (if *chargingp* "Charging" "Uncharging")))
;; INIT


(add-screen-mode-line-formatter #\B 'modeline)
