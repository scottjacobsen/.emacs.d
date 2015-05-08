(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(global-set-key (kbd "C-c t") 'projectile-find-file)

(setq projectile-mode-line
      '(:eval (format " [%s]" (projectile-project-name))))

;;; Override
(defun projectile-rails-zeus-p ()
  (file-exists-p "/tmp/zeus.sock"))

(setq projectile-rails-expand-snippet nil)

(provide '07projectile)
