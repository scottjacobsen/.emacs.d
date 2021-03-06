(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jshintrc\\'" . json-mode))

(add-to-list 'auto-mode-alist '("\\.js.erb$" . js2-mode))
(add-hook 'js2-mode-hook (lambda ()
                     (set (make-local-variable 'compile-command)
                           (concat "~/node_modules/jslint/bin/jslint.js --terse "
                                   (buffer-file-name)))) t)
(setq js-indent-level 2)
(provide '16js2-mode)
