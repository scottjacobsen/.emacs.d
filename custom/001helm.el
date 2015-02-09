;;; 001helm -- webmode stuff
;;; Commentary:
;;; Helm stuff
;;; Code:
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t)
(provide '001helm)
;;; 001helm.el ends here
