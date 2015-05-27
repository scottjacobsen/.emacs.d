;;; 41midnight --- Configure midnight
;;; Commentary:
;;; Code:
(require 'midnight)

;; clean buffers at 10 am
(midnight-delay-set 'midnight-delay (* 10 60 60))

(provide '41midnight)
;;; 41midnight.el ends here
