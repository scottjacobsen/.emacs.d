;;; 30silversearcher -- search (ag) stuff
;;; Commentary:
;;; search stuff
;;; Code:
(defvar ag-highlight-search)

(setq ag-highlight-search 't)

(global-set-key (kbd "C-c g") 'ag-project-regexp)

(provide '30silversearcher)
;;; 30silversearcher.el ends here
