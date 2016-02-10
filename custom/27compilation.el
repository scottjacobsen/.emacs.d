;;; 27compilation -- Compilation stuff
;;; Commentary:
;;  Compilation mode stuff
;;;
;;; Code:
(setq next-error-highlight t)
(eval-after-load "compile" '(progn
  (setq compilation-error-regexp-alist-alist
        (cons
         '(ruby-shoulda "\\[/.*\\(neighborland.com\\|brightfunds\\|silvernest.com\\|vagrant\\)/\\(?1:.*\\.rb\\):\\(?2:[0-9]+\\)\\]" 1 2)
         compilation-error-regexp-alist-alist))

  (setq compilation-error-regexp-alist (cons 'ruby-shoulda compilation-error-regexp-alist))
  ))

(provide '27compilation)

;; (setq compilation-error-regexp-alist
;;       (cdr compilation-error-regexp-alist))
;; (setq compilation-error-regexp-alist-alist
;;       (cdr compilation-error-regexp-alist-alist))
;; 27compilation.el ends here
