(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  ;; (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-revert-avoid-polling t)
 '(column-number-mode t)
 '(custom-safe-themes
   '("b54bf2fa7c33a63a009f249958312c73ec5b368b1094e18e5953adb95ad2ec3a" default))
 '(delete-old-versions t)
 '(js-indent-level 2)
 '(js2-strict-missing-semi-warning nil)
 '(package-selected-packages
   '(restclient ligature yaml-mode js2-mode smartparens snow fireplace company-box editorconfig nix-mode vue-mode yasnippet-snippets yasnippet yas-snippets sokoban org-msg code-review mu4e ag consult-ag csv-mode embark-consult embark marginalia consult-projectile consult slim-mode doom-modeline lsp-ui lsp-mode rainbow-delimiters highlight-indentation highlight-indentation-mode feature-mode flycheck forge vterm magit robe robe-mode company which-key all-the-icons projectile-rails orderless projectile ace-window ace-jump-mode vertico dracula-theme use-package))
 '(tool-bar-mode nil)
 '(warning-suppress-types
   '(((flycheck syntax-checker))
     (lsp-mode)
     (lsp-mode)
     (comp)
     (comp)
     (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#282a36" :foreground "#f8f8f2" :inverse-video nil :box nil :strike-through nil :extend nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "FiraCode Nerd Font Mono")))))
(global-auto-revert-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(ffap-bindings)
(global-hl-line-mode)
(global-set-key "\C-xk" 'kill-this-buffer) ;; by default it prompts :(
;; (set-frame-font "DejaVu Sans Mono for Powerline 18" nil t)
(scroll-bar-mode -1)
(setq column-number-mode t
      inhibit-startup-screen t
      ring-bell-function 'ignore)
(tool-bar-mode -1)

(when (not (display-graphic-p))
  (menu-bar-mode -1))

(add-hook 'ruby-mode-hook
          (lambda () (hs-minor-mode)))

(eval-after-load "hideshow"
  '(add-to-list 'hs-special-modes-alist
              `(ruby-mode
                ,(rx (or "def" "class" "module" "do" "{" "[" "if" "else" "unless")) ; Block start
                ,(rx (or "}" "]" "end"))                       ; Block end
                ,(rx (or "#" "=begin"))                        ; Comment start
                ruby-forward-sexp nil)))


;; ORG-mode stuff
(global-set-key (kbd "C-c c") #'org-capture)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/notes.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
	("j" "Journal" entry (file+datetree "~/org/journal.org")
	 "* %?\n %i\n %a")))

;; INTERFACE ENHANCEMENT
;;
;; Look good
(use-package dracula-theme
  :ensure t
  :init
  (load-theme 'dracula t))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package all-the-icons
  :ensure t)

;;
;; COMPLETION / NAVIGATION
;;
;; helpfully show what commands can be run
(use-package which-key
  :ensure t
  :init (which-key-mode)
  :custom
  (which-key-max-description-length 50 "see long command names"))

;; smarat completion
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :ensure t
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; jump to any character or word
(use-package ace-jump-mode
  :ensure t
  :bind (("C-c SPC" . ace-jump-mode)
	 ("C-c C-SPC" . ace-jump-char-mode))
  )

;; jump to any window
(use-package ace-window
  :ensure t
  :bind ("M-o" . ace-window))

;; Projectile - easy project navigation
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind-keymap
  ("s-p" . projectile-command-map))

(use-package projectile-rails
  :ensure t
  :init
  (projectile-rails-global-mode)
  :bind-keymap
  ("C-c r" . projectile-rails-command-map))

;;
;; GIT
;;
(use-package magit
  :ensure t
  :bind
  ("C-x v s" . magit-status))

(use-package forge
  :ensure t
  :after magit)

;;
;; TERMINAL
;;
(use-package vterm
  :ensure t
  :init
  (setq vterm-buffer-name-string "vterm %s"
	vterm-always-compile-module t
	vterm-enable-manipulate-selection-data-by-osc52 t))
;;
;; PROGRAMMING
;;
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; show line numbers in the fringe
(use-package linum-mode
  :hook prog-mode)

(use-package company
  :ensure t
  :init (global-company-mode))

(use-package robe
  :ensure t
  :init
  (global-robe-mode)
  (push 'company-robe company-backends))

(use-package highlight-indentation
  :ensure t
  :config (add-hook 'prog-mode-hook 'highlight-indentation-current-column-mode))

(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package smartparens
  :ensure t
  :config (add-hook 'prog-mode-hook #'smartparens-mode))

(use-package js2-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

(use-package slim-mode :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.inky\\'" . slim-mode)))

(use-package yaml-mode
  :ensure t)

(use-package vue-mode :ensure t)
(use-package vue-html-mode :ensure t)

(use-package feature-mode :ensure t)

(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (yaml-mode . lsp)
	 (js-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally

(use-package lsp-ui :ensure t :commands lsp-ui-mode)

;;
;; CONSULT
;;
;; Example configuration for Consult
(use-package consult
  :ensure t
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :bind (;; C-c bindings (mode-specific-map)
         ("C-c h" . consult-history)
         ("C-c m" . consult-mode-command)
         ("C-c k" . consult-kmacro)
         ;; C-x bindings (ctl-x-map)
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
         ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ("<help> a" . consult-apropos)            ;; orig. apropos-command
         ;; M-g bindings (goto-map)
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings (search-map)
         ("M-s d" . consult-find)
         ("M-s D" . consult-locate)
         ("M-s G" . consult-grep)
         ("M-s g" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s m" . consult-multi-occur)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
         ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history)                 ;; orig. next-matching-history-element
         ("M-r" . consult-history))                ;; orig. previous-matching-history-element

  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key (kbd "M-."))
  ;; (setq consult-preview-key (list (kbd "<S-down>") (kbd "<S-up>")))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme
   :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-recent-file
   consult--source-project-recent-file)

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; (kbd "C-+")

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (define-key consult-narrow-map (vconcat consult-narrow-key "?") #'consult-narrow-help)

  ;; By default `consult-project-function' uses `project-root' from project.el.
  ;; Optionally configure a different project root function.
  ;; There are multiple reasonable alternatives to chose from.
  ;;;; 1. project.el (the default)
  ;; (setq consult-project-function #'consult--default-project--function)
  ;;;; 2. projectile.el (projectile-project-root)
  ;; (autoload 'projectile-project-root "projectile")
  ;; (setq consult-project-function (lambda (_) (projectile-project-root)))
  ;;;; 3. vc.el (vc-root-dir)
  ;; (setq consult-project-function (lambda (_) (vc-root-dir)))
  ;;;; 4. locate-dominating-file
  ;; (setq consult-project-function (lambda (_) (locate-dominating-file "." ".git")))
  )

(use-package consult-projectile :ensure t)

;; Enable richer annotations using the Marginalia package
(use-package marginalia
  :ensure t
  ;; Either bind `marginalia-cycle` globally or only in the minibuffer
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init configuration is always executed (Not lazy!)
  :init

  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode))

(use-package embark
  :ensure t

  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t
  :after (embark consult)
  :demand t ; only necessary if you have the hook below
  ;; if you want to have consult previews as you move around an
  ;; auto-updating embark collect buffer
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

;;
;; SEARCH
;;
(use-package consult-ag :ensure t)
(use-package ag :ensure t)
(use-package mu4e
  :config
  (setq
   mail-envelope-from 'header
   mail-specify-envelope-from t
   mail-user-agent 'mu4e-user-agent
   message-sendmail-envelope-from 'header
   mu4e-attachment-dir "~/Downloads"
   mu4e-get-mail-command "offlineimap"
   mu4e-headers-visible-lines 20
   mu4e-sent-messages-behavior 'delete
   mu4e-split-view 'single-window
   mu4e-update-interval (* 60 5)
   mu4e-use-fancy-chars t
   send-mail-function 'sendmail-send-it
   sendmail-program "/opt/homebrew/bin/msmtp"
   shr-color-visible-luminance-min 1
   )

  (setq mu4e-contexts
    `( ,(make-mu4e-context
          :name "Private"
          :enter-func (lambda () (mu4e-message "Entering Private context"))
          :leave-func (lambda () (mu4e-message "Leaving Private context"))
          :match-func (lambda (msg)
                        (when msg
                          (string-match-p "^/scottericjacobsen" (mu4e-message-field msg :maildir))))
          :vars '( ( user-mail-address	    . "scottericjacobsen@gmail.com"  )
                   ( user-full-name	    . "Scott Jacobsen" )
		   ( mu4e-trash-folder . "/scottericjacobsen/trash")
		   ( mu4e-drafts-folder . "/scottericjacobsen/drafts")
                   ( mu4e-compose-signature .
                     (concat
                       "Scott\n"
                       ))))
       ,(make-mu4e-context
          :name "Wizehive"
          :enter-func (lambda () (mu4e-message "Switch to the Wizehive context"))
          ;; no leave-func
          ;; we match based on the maildir of the message
          ;; this matches maildir /Arkham and its sub-directories
          :match-func (lambda (msg)
                        (when msg
                          (string-match-p "^/wizehive" (mu4e-message-field msg :maildir))))
          :vars '( ( user-mail-address	     . "scott.jacobsen@wizehive.com" )
                   ( user-full-name	     . "Scott Jacobsen" )
                   ( message-user-organization . "WizeHive" )
		   ( mu4e-trash-folder . "/wizehive/trash")
		   ( mu4e-drafts-folder . "/wizehive/drafts")
                   ( mu4e-compose-signature  .
                     (concat
                       "Scott Jacobsen\n"
                       ))))

       ,(make-mu4e-context
          :name "Brightfunds"
          :enter-func (lambda () (mu4e-message "Switch to the Brightfunds context"))
          ;; no leave-func
          ;; we match based on the maildir of the message
          ;; this matches maildir /Arkham and its sub-directories
          :match-func (lambda (msg)
                        (when msg
                          (string-match-p "^/brightfunds" (mu4e-message-field msg :maildir))))
          :vars '( ( user-mail-address	     . "scott@brightfunds.org" )
                   ( user-full-name	     . "Scott Jacobsen" )
                   ( message-user-organization . "Bright Funds" )
		   ( mu4e-trash-folder . "/brightfunds/trash")
		   ( mu4e-drafts-folder . "/brightfunds/drafts")
                   ( mu4e-compose-signature  .
                     (concat
                       "Scott Jacobsen\n"
                       ))))
       ))
  (add-to-list 'mu4e-bookmarks
  ;; add bookmark for recent messages on the Mu mailing list.
  '( :name "Last 3 weeks"
     :key  ?m
     :query "(maildir:/wizehive/inbox or maildir:/scottericjacobsen/inbox) and date:3w.."))
  '(:name "Work Last 3 weeks"
     :key  ?w
     :query "maildir:/wizehive/inbox and date:3w..")
  )

(use-package code-review :ensure t)
(use-package org-msg :ensure t)
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets)

(use-package dash :ensure t)
(use-package s :ensure t)
(use-package editorconfig :ensure t)

;; COPILOT
(add-to-list 'load-path (expand-file-name "lisp/copilot.el-main" user-emacs-directory))
(require 'copilot)
(add-hook 'prog-mode-hook 'copilot-mode)
(with-eval-after-load 'company
  ;; disable inline previews
  (delq 'company-preview-if-just-one-frontend company-frontends))

(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "M-n") 'copilot-next-completion)
(define-key copilot-completion-map (kbd "M-p") 'copilot-previous-completion)
(define-key copilot-completion-map (kbd "M-g") 'copilot-abort-completion)
(define-key copilot-completion-map (kbd "M-<tab>") 'copilot-accept-completion-by-word)


(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package restclient
  :ensure t)
(setq org-default-notes-file (concat org-directory "/notes.org"))
(put 'narrow-to-region 'disabled nil)

(desktop-save-mode 1)

;; Enable the www ligature in every possible major mode
(ligature-set-ligatures 't '("www"))

;; Enable ligatures in programming modes
(ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                                     ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                                     "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                                     "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                                     "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                                     "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                                     "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                                     "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                                     "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                                     "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))

(global-ligature-mode 't)
(add-hook 'text-mode-hook (lambda () (flyspell-mode)))
(add-hook 'prog-mode-hook (lambda () (flyspell-prog-mode)))
