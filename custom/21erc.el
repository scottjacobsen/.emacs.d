;;; 21erc.el --- Summary
;;; Commentary:
;;; Customizations for ERC
;;;
;;; Code:
(defun my-reformat-jabber-backlog ()
  "Fix \"unkown participant\" backlog messages from bitlbee."
  (save-excursion
    (goto-char (point-min))
    (if (looking-at
    	 "^<root> Message from unknown participant \\([^:]+\\):")
    	(replace-match "<\\1>"))))
(add-hook 'erc-insert-modify-hook 'my-reformat-jabber-backlog)
(erc-spelling-mode)

(defvar bitlbee-password (getenv "BITLBEE_PW"))

(add-hook 'erc-join-hook 'bitlbee-identify)
(defun bitlbee-identify ()
  "If we're on the bitlbee server, send the identify command to the &bitlbee channel."
  (when (and (string= "localhost" erc-session-server)
             (string= "&bitlbee" (buffer-name)))
    (erc-message "PRIVMSG" (format "%s identify %s"
                                   (erc-default-target)
                                   bitlbee-password))))
(provide '21erc)
;;; 21erc ends here
