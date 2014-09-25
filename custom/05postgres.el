;;; 05postgres --- Postgres shell settings
;;; Commentary:
;;;  Guess what. Settings.
;;;
;;; Code:

(defvar sql-database)
(defvar sql-server)

(setq sql-database (getenv "PGDATABASE"))
(setq sql-server (getenv "PGHOST"))

(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))

(provide '05postgres)
;;; 05postgres.el ends here
