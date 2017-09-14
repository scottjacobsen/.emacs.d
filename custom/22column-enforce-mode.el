(setq column-enforce-column 120)
(add-hook 'prog-mode-hook 'column-enforce-mode)
(add-hook 'yaml-mode-hook 'column-number-mode)
(provide '22column-enforce-mode)
