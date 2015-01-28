;; (setq initial-major-mode 'enh-ruby-mode)
;; (setq initial-scratch-message "\
;; # This buffer is for notes you don't want to save, and for Ruby code.
;; # If you want to create a file, visit that file with C-x C-f,
;; # then enter the text in that file's own buffer.")


(add-hook 'inf-ruby-mode (lambda() (local-set-key (kbd "C-p") #'comint-previous-input)))
(add-hook 'inf-ruby-mode (lambda() (local-set-key (kbd "C-n") #'comint-next-input)))
(provide '25inf-ruby)
