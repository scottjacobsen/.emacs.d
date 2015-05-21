;;; package --- Modeline
;;; Commentary:
;;; Code:
(setq-default mode-line-format
              (list
               ;; the buffer name; the file name as a tool tip
               '(:eval (propertize "%b" 'face 'font-lock-keyword-face
                                   'help-echo (buffer-file-name)))

               '(:eval (when (buffer-modified-p) (propertize "*" 'face 'font-lock-warning-face)))

               " "
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
               "]"

               '(:eval projectile-mode-line)
               " "
               ;; i don't want to see minor-modes; but if you want, uncomment this:
               ;; minor-mode-alist  ;; list of minor modes
               '(:eval global-mode-string)
               "%-" ;; fill with '-'
               ))

(provide '38modeline)
;;; 38modeline.el ends here
