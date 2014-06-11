(setq auto-mode-alist (cons '("\\.haml" . haml-mode) auto-mode-alist))
(add-hook 'haml-mode-hook 'robe-mode)
(add-hook 'haml-mode-hook 'ruby-tools-mode)
(add-hook 'haml-mode-hook
          (lambda ()
            (set (make-local-variable 'electric-indent-functions)
                 (list (lambda (arg) 'no-indent)))))

(provide '02haml)
;;; 02haml.el ends here
