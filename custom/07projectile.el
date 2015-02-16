(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(global-set-key (kbd "C-c t") 'projectile-find-file)

;;; Override
(defun projectile-rails-zeus-p ()
  (file-exists-p "/tmp/zeus.sock"))

(provide '07projectile)
