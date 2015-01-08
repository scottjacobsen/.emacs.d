(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))

(add-hook 'markdown-mode-hook (lambda () (auto-fill-mode)))

(provide '01markdown)
