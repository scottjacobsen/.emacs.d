;;; package --- yagist config
;;; Commentary:
;;;
;;; Code:
(defvar yagist-github-token)
(declare-function chomp "000global" str)

(setq yagist-github-token
      (chomp
       (shell-command-to-string "gpg --no-tty -q -d $HOME/.passwords/yagist-github-oauth-token.gpg")))

(provide '37yagist)
;;; 37yagist.el ends here
