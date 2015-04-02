;;; 30silversearcher -- search (ag) stuff
;;; Commentary:
;;; search stuff
;;; Code:

(defvar ag-highlight-search)
(defvar ag-reuse-window)

(setq ag-highlight-search 't)
(setq ag-reuse-window 't)
(global-set-key (kbd "C-c g") 'ag-project-regexp)

(provide '30silversearcher)
;;; 30silversearcher.el ends here
