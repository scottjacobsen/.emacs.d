(setq auto-mode-alist (cons '("\\.haml" . haml-mode) auto-mode-alist))
(add-hook 'haml-mode (lambda() (tab-width 4)))
(add-hook 'haml-mode-hook
          (lambda ()
            (set (make-local-variable 'electric-indent-functions)
                 (list (lambda (arg) 'no-indent)))))
