(setq ring-bell-function 'ignore)
(if (display-graphic-p)
    (progn
      (scroll-bar-mode -1)))
(scroll-bar-mode -1)
(setq-default indent-tabs-mode nil)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-c s") 'ansi-term)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(setq kill-read-only-ok 1)
(setq tramp-default-method "ssh")
(setq dired-isearch-filenames t)
(setq calendar-latitude 39.6)
(setq calendar-longitude -104.9)
(setq calendar-location-name "Greenwood Village, CO")
(setq appt-display-mode-line t)
(setq auto-mode-alist (append '(("/tmp/mutt.*" . mail-mode)) auto-mode-alist))
(appt-activate)
(setq appt-display-duration 10)
(setq require-final-newline t)
(setq org-startup-indented t)
(setq org-default-notes-file "~/org/gtd.org")
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ca" 'org-agenda)
(display-time-mode)
(global-set-key (kbd "C-c m") 'magit-status)
(global-hl-line-mode)
(global-set-key (kbd "M-`") 'other-window)
(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
  (push "/opt/local/bin" exec-path))

(defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive) (revert-buffer t t))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq backup-directory-alist '(("." . "~/.emacs_backup"))
      backup-by-copying t
      delete-old-versions t
      version-control t
)

(setq tramp-backup-directory-alist backup-directory-alist)

(setq Man-notify-method 'aggressive)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(global-auto-revert-mode)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq-default frame-title-format "%b (%f)")

(add-to-list 'auto-mode-alist '("\\.envrc$" . sh-mode))

(defun my-test ()
  "tests this file"
  (interactive)
  (let ((default-directory (git-root)))
    (async-shell-command
     (concat "bin/test "
             (replace-regexp-in-string (git-root) "" (shell-quote-argument (expand-file-name (buffer-file-name))))))))
(global-set-key (kbd "C-c C-t") 'my-test)

(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))

(defun chomp (str)
  "Chomp leading and tailing whitespace from STR."
  (replace-regexp-in-string (rx (or (: bos (* (any " \t\n")))
                                    (: (* (any " \t\n")) eos)))
                            ""
                            str))

(setq linum-format "%d ")

(windmove-default-keybindings)
(setq windmove-wrap-around t)
(setq large-file-warning-threshold 100000000)

(provide '000global)
;;; 000global.el ends here
