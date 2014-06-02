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
(provide '21erc)
;;; 21erc ends here
