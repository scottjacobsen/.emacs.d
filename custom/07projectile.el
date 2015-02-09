(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(global-set-key (kbd "C-c t") 'projectile-find-file)


(provide '07projectile)
