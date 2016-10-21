
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(appt-audible nil)
 '(coffee-tab-width 2)
 '(compilation-error-regexp-alist
   (quote
    (absoft ada aix ant bash borland python-tracebacks-and-caml comma cucumber edg-1 edg-2 epc ftnchek iar ibm irix java jikes-file maven jikes-line gcc-include ruby-Test::Unit gnu lcc makepp mips-1 mips-2 msft omake oracle perl php rxp sparc-pascal-file sparc-pascal-line sparc-pascal-example sun sun-ada watcom 4bsd gcov-file gcov-header gcov-nomark gcov-called-line gcov-never-called perl--Pod::Checker perl--Test perl--Test2 perl--Test::Harness weblint jslint)))
 '(custom-enabled-themes (quote (wheatgrass)))
 '(custom-safe-themes
   (quote
    ("0e219d63550634bc5b0c214aced55eb9528640377daf486e13fb18a32bf39856" "cdbd0a803de328a4986659d799659939d13ec01da1f482d838b68038c1bb35e8" "1fab355c4c92964546ab511838e3f9f5437f4e68d9d1d073ab8e36e51b26ca6a" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "40bc0ac47a9bd5b8db7304f8ef628d71e2798135935eb450483db0dbbfff8b11" "f3d6a49e3f4491373028eda655231ec371d79d6d2a628f08d5aa38739340540b" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "603a9c7f3ca3253cb68584cb26c408afcf4e674d7db86badcfe649dd3c538656" "20e359ef1818a838aff271a72f0f689f5551a27704bf1c9469a5c2657b417e6c" "bcc6775934c9adf5f3bd1f428326ce0dcd34d743a92df48c128e6438b815b44f" "11636897679ca534f0dec6f5e3cb12f28bf217a527755f6b9e744bd240ed47e1" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(display-time-day-and-date t)
 '(display-time-default-load-average 0)
 '(display-time-mode t)
 '(emojify-display-style (quote image))
 '(emojify-emoji-styles (quote (github unicode)))
 '(enh-ruby-check-syntax nil)
 '(erc-modules
   (quote
    (autojoin button completion irccontrols list match menu move-to-prompt netsplit networks noncommands readonly replace ring stamp spelling track)))
 '(frame-background-mode (quote dark))
 '(helm-autoresize-mode t)
 '(helm-display-header-line nil)
 '(helm-full-frame nil)
 '(helm-ls-git-show-abs-or-relative (quote relative))
 '(helm-split-window-in-side-p t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(js-enabled-frameworks (quote (javascript)))
 '(js2-basic-offset 2)
 '(magit-default-tracking-name-function (quote magit-default-tracking-name-branch-only))
 '(magit-diff-refine-hunk (quote all))
 '(magit-diff-use-overlays nil)
 '(magit-rebase-arguments nil)
 '(magit-revert-buffers nil t)
 '(newsticker-url-list
   (quote
    (("Rubygems | Latest Versions for passenger" "https://rubygems.org/gems/passenger/versions.atom" nil nil nil)
     ("News/NYT > Home Page" "http://feeds.nytimes.com/nyt/rss/HomePage" nil nil nil)
     ("News/Slashdot" "http://rss.slashdot.org/Slashdot/slashdot" nil nil nil)
     ("News/Hacker News" "http://news.ycombinator.com/rss" nil nil nil)
     ("Ruby News" "http://www.ruby-lang.org/en/feeds/news.rss" nil nil nil)
     ("cve/All National Vulnerability Database" "http://nvd.nist.gov/download/nvd-rss.xml" nil nil nil))))
 '(org-agenda-files (quote ("~/org/gtd.org")))
 '(org-babel-load-languages (quote ((awk . t) (ruby . t))))
 '(org-mobile-directory "~/Dropbox/MobileOrg")
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-gnus org-info org-jsinfo org-habit org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m)))
 '(package-selected-packages
   (quote
    (zenburn-theme yasnippet yaml-mode yagist web-mode tao-theme solarized-theme smartparens slim-mode scss-mode ruby-tools ruby-refactor ruby-hash-syntax ruby-compilation robe rainbow-mode quasi-monochrome-theme projectile-rails pallet org-present multiple-cursors monochrome-theme minimap markdown-mode magit lua-mode less-css-mode jsx-mode json-mode js2-mode iedit hlinum highlight-indentation helm-swoop helm-projectile helm-ls-git helm-google helm-flx helm-descbinds helm-ag hc-zenburn-theme haml-mode flycheck flx-ido etags-select emojify elixir-mode edit-server dockerfile-mode company column-enforce-mode coffee-mode clojure-mode chruby bundler aggressive-indent ag)))
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

;; (setq system-uses-terminfo nil)
(define-key global-map (kbd "C-x C-c") (lambda() (interactive)
                                         (message "You literally never want that.")))

(require 'package)
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)
(require 'uniquify)
(require 'iedit)

;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)

(add-to-list 'load-path "~/.emacs.d/custom")
(add-hook 'after-init-hook #'global-flycheck-mode)

(dolist (file-name (directory-files "~/.emacs.d/custom" t "^[0-9].*.elc?$"))
  (require (intern (file-name-base file-name)))
  )

;;;
;;; tags
;;;
(setq tags-revert-without-query t)

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

(defun spec-for-buffer-name ()
  "Given a buffer named like foo_bar_spec return FooBar."
  (substring (classify-buffer-name) 0 -4))

;;;
;;; Flyspell mode
;;;
(dolist (hook '(ruby-mode-hook markdown-mode-hook haml-mode-hook js-mode js2-mode))
  (add-hook hook (lambda () (flyspell-prog-mode)))
  )

(dolist (hook '(diary-mode-hook text-mode-hook message-mode-hook org-mode-hook rcirc-mode-hook))
  (add-hook hook (lambda () (flyspell-mode)))
  )

;;;
;;; indent magic
;;;
(dolist (hook '(ruby-mode-hook markdown-mode-hook js-mode js2-mode))
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
 '(column-enforce-face ((t (:background "black"))))
 '(diff-added ((t (:foreground "green"))))
 '(diff-file-header ((t (:foreground "cyan" :box (:line-width 1 :color "deep sky blue") :weight bold))))
 '(diff-header ((t nil)))
 '(diff-indicator-removed ((t (:foreground "red"))))
 '(diff-refine-added ((t (:inherit diff-refine-change :background "black" :foreground "#00bb00" :inverse-video t))))
 '(diff-refine-removed ((t (:inherit diff-refine-change :background "#660000" :foreground "black" :inverse-video nil))))
 '(diff-removed ((t (:foreground "red"))))
 '(erm-syn-errline ((t nil)))
 '(erm-syn-warnline ((t nil)))
 '(helm-match ((t (:background "#252525" :foreground "dark cyan" :weight bold))))
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
     (start-process-shell-command "zeus" "*zeus*" (concat "~/.rvm/gems/ruby-2.0.0-p353/bin/zeus " command))
     (set-window-buffer nil "*zeus*"))
    ))

;; Calendar
(setq view-diary-entries-initially t
      mark-diary-entries-in-calendar t
      number-of-diary-entries 7)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)
(put 'erase-buffer 'disabled nil)

(add-to-list 'load-path "/usr/local/Cellar/mu/0.9.16/share/emacs/site-lisp/mu/mu4e")
(require 'mu4e)
