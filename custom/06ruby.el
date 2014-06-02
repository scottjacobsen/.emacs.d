;;; 06ruby --- Provides ruby settings.
;;; Commentary:
;;; This file is not part of GNU Emacs.

;;; Code:

(add-to-list 'load-path "~/.emacs.d/enhanced-ruby-mode") ; must be added after any path containing old ruby-mode
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

(require 'ruby-tools)

(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.god$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("^Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("^config.ru$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("^.autotest$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("^Guardfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . enh-ruby-mode))
(add-hook 'enh-ruby-mode-hook (lambda() (local-set-key "k" 'self-insert-command))) ; WTF sometimes k isn't k in ruby mode?
(add-hook 'enh-ruby-mode-hook (lambda() (local-set-key (kbd "M-SPC") 'completion-at-point)))
(add-hook 'enh-ruby-mode-hook (lambda() (setq tab-width 2)))
(add-hook 'enh-ruby-mode-hook (lambda() (local-set-key "\C-cd" 'yari)))
(add-hook 'enh-ruby-mode-hook (lambda() (flycheck-mode)))
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'ruby-tools-mode)

(provide '06ruby)
;;; 06ruby.el ends here
