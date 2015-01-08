;;; 29mail -- mail stuff
;;; Commentary:
;;; Mail mode stuff
;;;
;;; Code:
(setq message-sendmail-f-is-evil 't)
(setq message-sendmail-extra-arguments '("--read-envelope-from"))
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq sendmail-program "/usr/local/bin/msmtp")
(setq user-full-name "Scott Jacobsen")
(setq user-mail-address "jacobsenscott@yahoo.com")
(provide '29mail)
;; (setq compilation-error-regexp-alist
;;       (cdr compilation-error-regexp-alist))
;; (setq compilation-error-regexp-alist-alist
;;       (cdr compilation-error-regexp-alist-alist))
;; 29mail.el ends here
