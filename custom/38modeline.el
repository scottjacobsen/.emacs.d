;; use setq-default to set it for /all/ modes
(setq-default mode-line-format
      (list
       ;; the buffer name; the file name as a tool tip
       '(:eval (propertize "%b " 'face 'font-lock-keyword-face
                           'help-echo (buffer-file-name)))

       ;; line and column
       "(" ;; '%02' to set to 2 chars at least; prevents flickering
       (propertize "%02l" 'face 'font-lock-type-face) ","
       (propertize "%02c" 'face 'font-lock-type-face)
       ") "

       ;; relative position, size of file
       "["
       (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
       "/"
       (propertize "%I" 'face 'font-lock-constant-face) ;; size
       "] "

       ;; the current major mode for the buffer.
       "["

       '(:eval (propertize "%m" 'face 'font-lock-string-face
                           'help-echo buffer-file-coding-system))
       "] "


       "[" ;; read only or read  write
       '(:eval (propertize (if buffer-read-only "RO" "RW")
                           'face 'font-lock-preprocessor-face))

       ;; '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
       ;;                     'face 'font-lock-preprocessor-face
       ;;                     'help-echo (concat "Buffer is in "
       ;;                                        (if overwrite-mode "overwrite" "insert") " mode")))

       ;; was this buffer modified since the last save?
       '(:eval (when (buffer-modified-p)
                 (concat ","  (propertize "Mod"
                                          'face 'font-lock-warning-face
                                          'help-echo "Buffer has been modified"))))

       ;; is this buffer read-only?
       ;; '(:eval (when buffer-read-only
       ;;           (concat ","  (propertize "RO"
       ;;                                    'face 'font-lock-type-face
       ;;                                    'help-echo "Buffer is read-only"))))
       "] "

       ;; add the time, with the date and the emacs uptime in the tooltip
       '(:eval (propertize (format-time-string "%H:%M")
                           'help-echo
                           (concat (format-time-string "%c; ")
                                   (emacs-uptime "Uptime:%hh"))))

       " "

       '(:eval (propertize (if my-have-mail-p " ^| " "")
                           'face 'my-mail-face 'display my-mail-icon))
       " "
       '(:eval org-mode-line-string)

       '(:eval projectile-mode-line)
       ;; i don't want to see minor-modes; but if you want, uncomment this:
       ;; minor-mode-alist  ;; list of minor modes
       "%-" ;; fill with '-'
       ))
