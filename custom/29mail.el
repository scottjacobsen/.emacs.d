;;; 29mail -- mail stuff
;;; Commentary:
;;; Mail mode stuff
;;;
;;; Code:
(require 'mu4e)

(setq mail-user-agent 'mu4e-user-agent)
(setq mu4e-sent-messages-behavior 'delete)
(setq mu4e-view-html-plaintext-ratio-heuristic most-positive-fixnum)

(setq mu4e-get-mail-command "offlineimap")
(setq mu4e-update-interval 600)

(setq mu4e-sent-messages-behavior 'delete)
(setq mu4e-view-show-addresses t)

(setq mu4e-drafts-folder "/brightfunds/drafts")
(setq mu4e-sent-folder   "/brightfunds/sent")
(setq mu4e-trash-folder  "/brightfunds/trash")
(setq mu4e-user-mail-address-list '("scott@brightfunds.org" "scottericjacobsen@gmail.com"))

(setq mu4e-headers-fields '((:human-date . 12)
                            (:flags . 6)
                            (:mailing-list . 10)
                            (:from-or-to . 22)
                            (:subject)))

(setq mu4e-compose-format-flowed t)

(setq
   mu4e-compose-signature
    (concat
      "Scott Jacobsen\n"
      "scott@brightfunds.org\n"))

(setq message-sendmail-f-is-evil 't)
(setq message-sendmail-extra-arguments '("--read-envelope-from"))
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq message-fill-column nil)
(setq sendmail-program "/usr/local/bin/msmtp")
(setq user-full-name "Scott Jacobsen")
(setq user-mail-address "scott@brightfunds.org")

(setq message-kill-buffer-on-exit t)
(provide '29mail)

;; (setq compilation-error-regexp-alist
;;       (cdr compilation-error-regexp-alist))
;; (setq compilation-error-regexp-alist-alist
;;       (cdr compilation-error-regexp-alist-alist))
;; 29mail.el ends here
