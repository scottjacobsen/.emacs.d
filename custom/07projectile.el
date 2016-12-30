(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(projectile-rails-global-mode)
(global-set-key (kbd "C-c t") 'helm-browse-project)

(setq projectile-mode-line
      '(:eval (format " [%s]" (projectile-project-name))))


(setq projectile-rails-expand-snippet nil)

(provide '07projectile)
