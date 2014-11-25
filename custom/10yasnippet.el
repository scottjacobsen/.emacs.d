;;; Package --- YAS settings
;;; Commentary:
;;; Setup yer yas
;;; code:
(require 'yasnippet)
(setq yas-snippet-dirs "~/.emacs.d/snippets")
(yas-reload-all)
(add-hook 'prog-mode-hook
          '(lambda ()
             (yas-minor-mode)))
(provide '10yasnippet)
;;; 10yasnippet.el ends here
