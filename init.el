(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(appt-audible nil)
 '(compilation-error-regexp-alist (quote (absoft ada aix ant bash borland python-tracebacks-and-caml comma cucumber edg-1 edg-2 epc ftnchek iar ibm irix java jikes-file maven jikes-line gcc-include ruby-Test::Unit gnu lcc makepp mips-1 mips-2 msft omake oracle perl php rxp sparc-pascal-file sparc-pascal-line sparc-pascal-example sun sun-ada watcom 4bsd gcov-file gcov-header gcov-nomark gcov-called-line gcov-never-called perl--Pod::Checker perl--Test perl--Test2 perl--Test::Harness weblint jslint)))
 '(custom-enabled-themes (quote (wheatgrass)))
 '(display-time-day-and-date t)
 '(display-time-default-load-average 0)
 '(display-time-mode t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(js-enabled-frameworks (quote (javascript)))
 '(js2-basic-offset 2)
 '(org-agenda-files (quote ("~/org/gtd.org")))
 '(org-mobile-directory "~/Dropbox/MobileOrg")
 '(org-modules (quote (org-bbdb org-bibtex org-gnus org-info org-jsinfo org-habit org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m)))
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

(require 'package)
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'pallet)
(require 'uniquify)
(require 'fliptext)
(require 'iedit)

(add-to-list 'load-path "~/.emacs.d/custom")
(load "00global.el")
(load "01markdown.el")
(load "02haml.el")
(load "03lua.el")
(load "04yaml.el")
(load "05rvm.el")
(load "06ruby.el")
(load "07projectile.el")
(load "08ido.el")
(load "09highlight-indentation.el")
(load "10yasnippet.el")
(load "12smartparens.el")
(load "14dash-at-point.el")
(load "15zenburn-theme.el")
(load "16js2-mode.el")

;;;
;;; tags
;;;
(setq tags-revert-without-query t)
(require 'etags-select)
(global-set-key "\M-." 'etags-select-find-tag-at-point)

(defun camelize (string)
  "CamelCase an underscore_delimited_string"
  (reduce
   (lambda (m o) (concat m "" o))
   (split-string (capitalize string) "_" t))
  )

(defun camelize-file (name)
  "Given a string like 'foo/bar/hello_world.rb' returns HelloWorld"
  (camelize
   (file-name-nondirectory (file-name-sans-extension name))))

(defun classify-buffer-name ()
  "Converts the name of the buffer to a Ruby class name."
  (or (and buffer-file-name (camelize-file buffer-file-name))
      (and buffer-name (camelize-file buffer-name))
      ("Class")))

;;;
;;; css
;;;
(add-hook 'css-mode-hook (lambda() (setq tab-width 4)))

;;;
;;; Hide Show setup
;;;
(add-to-list 'hs-special-modes-alist
	     '(ruby-mode
	       "\\(def\\|do\\|{\\)" "\\(end\\|end\\|}\\)" "#"
	       (lambda (arg) (ruby-end-of-block)) nil)

             '(enh-ruby-mode
	       "\\(def\\|do\\|{\\)" "\\(end\\|end\\|}\\)" "#"
	       (lambda (arg) (ruby-end-of-block)) nil))

(add-hook 'ruby-mode-hook 'hs-minor-mode)
(add-hook 'enh-ruby-mode-hook 'hs-minor-mode)
(add-hook 'lisp-mode-hook 'hs-minor-mode)
(add-hook 'js-mode-hook 'hs-minor-mode)
(global-set-key (kbd "M-+") 'hs-toggle-hiding)

;;;
;;; Flyspell mode
;;;
(dolist (hook '(enh-ruby-mode-hook ruby-mode-hook markdown-mode-hook haml-mode-hook js-mode js2-mode))
  (add-hook hook (lambda () (flyspell-prog-mode)))
  )

(dolist (hook '(diary-mode-hook text-mode-hook mail-mode-hook org-mode-hook rcirc-mode-hook))
  (add-hook hook (lambda () (flyspell-mode)))
  )

;;;
;;; indent magic
;;;
(dolist (hook '(enh-ruby-mode-hook ruby-mode-hook markdown-mode-hook js-mode js2-mode))
  (add-hook hook (lambda () (electric-indent-mode)))
  )

;;
;; org mode
;;
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-file (list "~/org/gtd.org"))
(put 'narrow-to-region 'disabled nil)

;;
;; SSH
;;
(add-to-list 'load-path "~/.emacs.d/ssh-config-mode-el")
(autoload 'ssh-config-mode "ssh-config-mode" t)
(add-to-list 'auto-mode-alist '(".ssh/config\\'"  . ssh-config-mode))
(add-to-list 'auto-mode-alist '("sshd?_config\\'" . ssh-config-mode))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((t (:foreground "green"))))
 '(diff-file-header ((t (:foreground "cyan" :box (:line-width 1 :color "deep sky blue") :weight bold))))
 '(diff-header ((t nil)))
 '(diff-indicator-removed ((t (:foreground "red"))))
 '(diff-refine-added ((t (:inherit diff-refine-change :background "black" :foreground "#00bb00" :inverse-video t))))
 '(diff-refine-removed ((t (:inherit diff-refine-change :background "#660000" :foreground "black" :inverse-video nil))))
 '(diff-removed ((t (:foreground "red"))))
 '(log-view-message ((t nil))))

;;;
;;; Zeus
;;;
(defun zeus-root ()
  "Return parent directory with zeus socket, else return nil"
  (let ((curdir default-directory)
        (max 10)
        (found nil))
    (while (and (not found) (> max 0))
      (progn
        (if (file-exists-p (concat curdir ".zeus.sock"))
            (progn
              (setq found t))
          (progn
            (setq curdir (concat curdir "../"))
            (setq max (- max 1))))))
    (if found (expand-file-name curdir))))



(defun zeus-exec (command)
  "Run a zeus with command COMMAND and PROGRAM-ARGS"
  (interactive "sZeus: ")
  (let ((default-directory (zeus-root)))
    (set-process-sentinel
     (start-process-shell-command "zeus" "*zeus*" (concat "zeus " command))
     (set-window-buffer nil "*zeus*"))
    ))

;;;
;;; Git!
;;;

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

;; Derived from `vc-git-grep'.
(defun git-grep (regexp &optional dir)
  "Run git grep, searching for REGEXP in directory DIR.

DIR defaults to the root directory of the git project.

With \\[universal-argument] prefix, you can edit the constructed shell command line
before it is executed.
With two \\[universal-argument] prefixes, directly edit and run `grep-command'.

Collect output in a buffer.  While git grep runs asynchronously, you
can use \\[next-error] (M-x next-error), or \\<grep-mode-map>\\[compile-goto-error] \
in the grep output buffer,
to go to the lines where grep found matches.

This command shares argument histories with \\[rgrep] and \\[grep]."
  (interactive
   (progn
     (grep-compute-defaults)
     (cond
      ((equal current-prefix-arg '(16))
       (list (read-from-minibuffer "Run: " "git grep"
				   nil nil 'grep-history)
	     nil))
      (t (let* ((regexp (grep-read-regexp))
		(dir (read-directory-name "In directory: "
					  (git-root) default-directory t)))
	   (list regexp dir))))))
  (require 'grep)
  (when (and (stringp regexp) (> (length regexp) 0))
    (let ((command regexp))
      (if (string= command "git grep")
          (setq command nil))
      (setq dir (file-name-as-directory (expand-file-name dir)))
      (setq command
            (grep-expand-template "git grep -n -e <R>"
                                  regexp))
      (when command
        (if (equal current-prefix-arg '(4))
            (setq command
                  (read-from-minibuffer "Confirm: "
                                        command nil nil 'grep-history))
          (add-to-history 'grep-history command)))
      (when command
	(let ((default-directory dir)
	      (compilation-environment (cons "PAGER=" compilation-environment)))
	  ;; Setting process-setup-function makes exit-message-function work
	  ;; even when async processes aren't supported.
	  (compilation-start command 'grep-mode))
	(if (eq next-error-last-buffer (current-buffer))
	    (setq default-directory dir))))))

(global-set-key (kbd "C-c g") 'git-grep)

;; Calendar
(setq view-diary-entries-initially t
      mark-diary-entries-in-calendar t
      number-of-diary-entries 7)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)
