(add-hook 'prog-mode-hook (lambda () (highlight-indentation-current-column-mode)))
(add-hook 'haml-mode-hook (lambda () (highlight-indentation-current-column-mode)))
(add-hook 'yaml-mode-hook (lambda () (highlight-indentation-current-column-mode)))

(provide '09highlight-indentation)
