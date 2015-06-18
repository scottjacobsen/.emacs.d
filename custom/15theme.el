;;; (load-theme 'zenburn t)
(when (display-graphic-p)
  (load-theme 'hc-zenburn t))

(load-theme 'solarized-dark t)
;;

(defun light-theme
    (interactive)
  (load-theme 'solarized-light t)
  )

(provide '15theme)
