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
    ("cdb4ffdecc682978da78700a461cdc77456c3a6df1c1803ae2dd55c59fa703e3" "a7051d761a713aaf5b893c90eaba27463c791cd75d7257d3a8e66b0c8c346e77" "c82d24bfba431e8104219bfd8e90d47f1ad6b80a504a7900cbee002a8f04392f" "54f2d1fcc9bcadedd50398697618f7c34aceb9966a6cbaa99829eb64c0c1f3ca" "04232a0bfc50eac64c12471607090ecac9d7fd2d79e388f8543d1c5439ed81f5" "d057f0430ba54f813a5d60c1d18f28cf97d271fd35a36be478e20924ea9451bd" "ec5f697561eaf87b1d3b087dd28e61a2fc9860e4c862ea8e6b0b77bd4967d0ba" "0c32e4f0789f567a560be625f239ee9ec651e524e46a4708eb4aba3b9cdc89c5" "3f44e2d33b9deb2da947523e2169031d3707eec0426e78c7b8a646ef773a2077" "aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" "a4df5d4a4c343b2712a8ed16bc1488807cd71b25e3108e648d4a26b02bc990b3" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "a0dc0c1805398db495ecda1994c744ad1a91a9455f2a17b59b716f72d3585dde" "f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" "3d47d88c86c30150c9a993cc14c808c769dad2d4e9d0388a24fee1fbf61f0971" "14f0fbf6f7851bfa60bf1f30347003e2348bf7a1005570fd758133c87dafe08f" "4e753673a37c71b07e3026be75dc6af3efbac5ce335f3707b7d6a110ecb636a3" "0e219d63550634bc5b0c214aced55eb9528640377daf486e13fb18a32bf39856" "cdbd0a803de328a4986659d799659939d13ec01da1f482d838b68038c1bb35e8" "1fab355c4c92964546ab511838e3f9f5437f4e68d9d1d073ab8e36e51b26ca6a" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "40bc0ac47a9bd5b8db7304f8ef628d71e2798135935eb450483db0dbbfff8b11" "f3d6a49e3f4491373028eda655231ec371d79d6d2a628f08d5aa38739340540b" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "603a9c7f3ca3253cb68584cb26c408afcf4e674d7db86badcfe649dd3c538656" "20e359ef1818a838aff271a72f0f689f5551a27704bf1c9469a5c2657b417e6c" "bcc6775934c9adf5f3bd1f428326ce0dcd34d743a92df48c128e6438b815b44f" "11636897679ca534f0dec6f5e3cb12f28bf217a527755f6b9e744bd240ed47e1" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
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
    (github-review weechat-alert weechat robe csv-mode forge ghub+ dracula-theme zenburn-theme vagrant-tramp rjsx-mode w3m powerline helm-projectile dash-at-point projectile-rails multi-term helm-c-yasnippet inf-ruby feature-mode yasnippet yaml-mode yagist web-mode slim-mode scss-mode ruby-tools ruby-refactor ruby-hash-syntax rainbow-mode pallet org-present multiple-cursors markdown-mode magit jsx-mode json-mode js2-mode highlight-indentation helm-swoop helm-ls-git helm-google helm-flx helm-descbinds helm-ag flycheck emojify edit-server company column-enforce-mode chruby ag)))
 '(projectile-completion-system (quote helm))
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(show-paren-mode t)
 '(show-paren-style (quote mixed))
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

;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)

(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'load-path "/opt/share/emacs/site-lisp/mu4e")
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
(dolist (hook '(prog-mode-hook))
  (add-hook hook (lambda () (electric-indent-mode)))
  )

(dolist (hook '(prog-mode-hook))
  (add-hook hook (lambda () (show-paren-mode)))
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

;; Calendar
(setq view-diary-entries-initially t
      mark-diary-entries-in-calendar t
      number-of-diary-entries 7)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)
(put 'erase-buffer 'disabled nil)


(defun cmus-pp ()
  "Play or pause cmus"
  (interactive)
  (shell-command "cmus-remote -u"))

(defun seeing-is-believing ()
  "Replace the current region (or the whole buffer, if none) with the output
of seeing_is_believing."
  (interactive)
  (let ((beg (if (region-active-p) (region-beginning) (point-min)))
        (end (if (region-active-p) (region-end) (point-max)))
        (origin (point)))
    (shell-command-on-region beg end "seeing_is_believing" nil 'replace)
    (goto-char origin)))

;;Slack in emacs!
(add-to-list 'load-path "~/dev/emacs-slack/")
(setq dired-listing-switches "-alh")
(add-hook 'dired-load-hook
            (function (lambda () (load "dired-x"))))
(set-default-font "-*-Hack-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1")
(setq default-frame-alist '((font . "-*-Hack-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(require 're-builder)
(setq reb-re-syntax 'string)
(winner-mode 1)
