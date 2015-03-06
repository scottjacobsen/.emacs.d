;;; 21erc.el --- Summary
;;; Commentary:
;;; Customizations for ERC
;;;
;;; Code:
(require 'erc)

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
  (when (and (string= "bitlbee" erc-session-server)
             (string= "&bitlbee" (buffer-name)))
    (erc-message "PRIVMSG" (format "%s identify %s"
                                   (erc-default-target)
                                   bitlbee-password))))

(defun chat-connect ()
  "Connects chat sessions."
  (erc :server "bitlbee"
       :nick "scott"
       :password (concat "scott/bitlbee:" bitlbee-password))
  (erc :server "freenode"
       :nick "scott"
       :password (concat "scott/freenode:" bitlbee-password)))
  ;; (erc :server "oftc"
  ;;      :nick "scott"
  ;;      :password (concat "scott/oftc:" bitlbee-password))
  ;; (erc :server "mozilla"
  ;;      :nick "mozilla"
  ;;      :password (concat "scott/mozilla:" bitlbee-password)))

(global-set-key (kbd "C-c eb") (lambda() (interactive) (chat-connect)))

(setq erc-autojoin-channels-alist '(("bitlbee" "#neighborland" "#twitter_jacobsenscott" "#bfdev" "#daily_standups")))



(provide '21erc)
;;; 21erc ends here
