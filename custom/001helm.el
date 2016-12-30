;;; 001helm -- webmode stuff
;;; Commentary:
;;; Helm stuff
;;; Code:
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-mode-fuzzy-match t)
;; (setq helm-M-x-fuzzy-match t)
;; (setq helm-buffers-fuzzy-matching t)
(setq helm-buffer-max-length 50)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-s o") 'helm-swoop)
(helm-flx-mode +1)
(provide '001helm)
;;; 001helm.el ends here
