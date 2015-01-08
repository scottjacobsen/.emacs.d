;;; 28mutt -- Mutt mail stuff
;;; Commentary:
;;  Compilation mode stuff
;;;
;;; Code:
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
(add-hook 'message-mode-hook 'turn-on-auto-fill)
(provide '28mutt)
;; (setq compilation-error-regexp-alist
;;       (cdr compilation-error-regexp-alist))
;; (setq compilation-error-regexp-alist-alist
;;       (cdr compilation-error-regexp-alist-alist))
;; 28mutt.el ends here
