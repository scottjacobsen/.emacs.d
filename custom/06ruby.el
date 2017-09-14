;;; 06ruby --- Provides ruby settings.
;;; Commentary:
;;; This file is not part of GNU Emacs.

;;; Code:
(require 'ruby-tools)

(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.god$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("^Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("^config.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("^.autotest$" . ruby-mode))
(add-to-list 'auto-mode-alist '("^Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-hook 'ruby-mode-hook (lambda() (local-set-key "k" 'self-insert-command))) ; WTF sometimes k isn't k in ruby mode?
(add-hook 'ruby-mode-hook (lambda() (local-set-key (kbd "M-SPC") 'completion-at-point)))
(add-hook 'ruby-mode-hook (lambda() (setq tab-width 2)))
(add-hook 'ruby-mode-hook (lambda() (flycheck-mode)))
(add-hook 'ruby-mode-hook 'ruby-tools-mode)

(add-to-list 'hs-special-modes-alist
	     '(ruby-mode
	       "\\(def\\|do\\|{\\)" "\\(end\\|end\\|}\\)" "#"
	       (lambda (arg) (ruby-end-of-block)) nil))

(setq ruby-insert-encoding-magic-comment nil)

(provide '06ruby)
;;; 06ruby.el ends here
