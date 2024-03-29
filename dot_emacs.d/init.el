;; straight.el
;; See https://github.com/radian-software/straight.el for more details
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Setup use-package
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; init
(use-package init-loader
  :config
  (init-loader-load (locate-user-emacs-file "inits")))
