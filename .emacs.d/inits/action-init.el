;; scroll
(when (window-system)
  (scroll-bar-mode -1))
(setq-default scroll-conservatively 5
              scroll-margin 1
              scroll-step 2)

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

;; undo/redo
(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "C-M-/") 'undo-tree-redo)
(global-set-key (kbd "C-/") 'undo-tree-undo)

;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)
(global-set-key (kbd "C-RET") 'cua-set-rectangle-mark)

;; tab is space
(setq-default indent-tabs-mode nil)

;; backup
(add-to-list 'backup-directory-alist
             '("." . "~/.emacs.d/backup"))

;; delete trailing white space and blank line before save
(setq require-final-newline t)
(add-hook 'before-save-hook
          'delete-trailing-whitespace)

(provide 'action-init)
