(require 'ido)
(require 'flx-ido)
(flx-ido-mode 1)

(defun my-ido-find-tag ()
  "Find a tag using ido"
  (interactive)
  (tags-completion-table)
  (let (tag-names)
    (mapatoms (lambda (x)
                (push (prin1-to-string x t) tag-names))
              tags-completion-table)
    (tags-apropos (ido-completing-read "Tag: " tag-names))))

(global-set-key "\M-?" 'my-ido-find-tag)

(provide '08ido)
