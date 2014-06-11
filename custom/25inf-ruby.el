(add-hook 'inf-ruby-mode (lambda() (local-set-key (kbd "C-p") #'comint-previous-input)))
(add-hook 'inf-ruby-mode (lambda() (local-set-key (kbd "C-n") #'comint-next-input)))
(provide '25inf-ruby)
