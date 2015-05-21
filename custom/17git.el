;;; 17git -- git stuff
;;; Commentary:
;;; git stuff
;;; Code:
(defun git-root ()
  "Return GIT_ROOT if this file is a part of a git rep,
else return nil"
  (let ((curdir default-directory)
        (max 10)
        (found nil))
    (while (and (not found) (> max 0))
      (progn
        (if (file-directory-p (concat curdir ".git"))
            (progn
              (setq found t))
          (progn
            (setq curdir (concat curdir "../"))
            (setq max (- max 1))))))
    (if found (expand-file-name curdir))))

(global-set-key (kbd "C-x v s") 'magit-status)
(setq magit-last-seen-setup-instructions "1.4.0")
(provide '17git)

;;; 17git.el ends here
