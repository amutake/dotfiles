;; undo/redo
(use-package undo-fu
  :config
  (global-unset-key (kbd "C-/"))
  (global-set-key (kbd "C-/") 'undo-fu-only-undo)
  (global-set-key (kbd "C-M-/") 'undo-fu-only-redo))

;; cua-mode
(cua-selection-mode t)
(bind-key "C-c C-SPC" 'cua-set-rectangle-mark)

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

;; misc
(setq confirm-nonexistent-file-or-buffer nil)
(fset 'yes-or-no-p 'y-or-n-p)
(custom-set-variables '(vc-follow-symlinks t))
