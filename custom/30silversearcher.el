;;; 30silversearcher -- search (ag) stuff
;;; Commentary:
;;; search stuff
;;; Code:
(defvar ag-highlight-search)

(setq ag-highlight-search 't)

(defun my-ag-regexp (string)
  "Search using ag in a given directory for a given regexp in STRING.
The regexp should be in PCRE syntax, not Emacs regexp syntax.  If
called with a prefix, prompts for flags to pass to ag."
  (interactive "sSearch regexp: ")
  (ag-regexp string (git-root)))

(global-set-key (kbd "C-c g") 'my-ag-regexp)

(provide '30silversearcher)
;;; 30silversearcher.el ends here
