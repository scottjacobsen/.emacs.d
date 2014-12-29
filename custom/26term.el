;;; 26term -- Term stuff
;;; Commentary:
;;  Terminal stuff
;;;
;;; Code:
(add-hook 'term-mode-hook 'compilation-shell-minor-mode)
(add-hook 'eshell-mode-hook 'compilation-shell-minor-mode)
(add-hook 'shell-mode-hook 'compilation-shell-minor-mode)
(provide '26term)
;;; 26term.el ends here
