;;; package --- Checks Maildir for new mail and displays an icon in the mode line
;;; Commentary:
;;; Checks mail
;;; Code:

(make-face 'my-mail-face)
(set-face-attribute 'my-mail-face nil
                    :inherit 'mode-line :foreground "white" :background "black")

(defvar my-mail-icon
  (find-image '((:type xpm :file "letter.xpm" :ascent center)
                (:type pbm :file "letter.pbm" :ascent center))))

(defvar my-have-mail-p nil)

(defun my-check-mail()
  (catch 'have-mail
    (dolist (folder
             (file-expand-wildcards "~/Maildir/*/inbox/new")
             (throw 'have-mail nil))
      (if (not (= (length (directory-files folder nil "[^.]")) 0))
          (throw 'have-mail t)))))

(defun my-check-mail-timer()
  (setq my-have-mail-p (my-check-mail))
  (if my-have-mail-p
      (run-at-time "5 sec" nil 'my-check-mail-timer)
    (run-at-time "60 sec" nil 'my-check-mail-timer)))

(my-check-mail-timer)

(add-to-list 'global-mode-string
             '(:eval (propertize (if my-have-mail-p " ^| " "")
                                 'face 'my-mail-face 'display my-mail-icon)))
(provide '34my_checkmail)
;;; 34my_checkmail.el ends here
