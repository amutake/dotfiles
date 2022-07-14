;; tab is 2 space
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; backup
(add-to-list 'backup-directory-alist
             `("." . ,(locate-user-emacs-file "backup")))

;; delete trailing white space and blank line before save
(setq require-final-newline t)
(add-hook 'before-save-hook
          'delete-trailing-whitespace)

;; rectangle
(bind-key "C-c C-SPC" 'rectangle-mark-mode)

;; misc
(setq confirm-nonexistent-file-or-buffer nil)
(fset 'yes-or-no-p 'y-or-n-p)
(custom-set-variables '(vc-follow-symlinks t))
(setq scroll-error-top-bottom t)
