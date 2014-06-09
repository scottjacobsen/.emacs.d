(if (and (fboundp 'server-running-p)
         (not (server-running-p)))
    (server-start))
(setq ring-bell-function 'ignore)
(scroll-bar-mode -1)
(setq-default indent-tabs-mode nil)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-c s") 'ansi-term)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(setq tramp-default-mthod "ssh")
(setq kill-read-only-ok 1)
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


(defun touch ()
     "updates mtime on the file for the current buffer"
     (interactive)
     (shell-command (concat "touch " (shell-quote-argument (buffer-file-name))))
     (clear-visited-file-modtime))
(global-set-key (kbd "C-c C-t") 'touch)

(provide '00global)
