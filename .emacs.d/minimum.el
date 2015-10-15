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

;; line-number
(when (require 'linum nil t)
  (global-linum-mode t)
  (setq linum-format "%3d "))

;; line highlight
(global-hl-line-mode)

;; column-number
(column-number-mode t)

;; menu-bar
(menu-bar-mode -1)

;; parens highlight
(show-paren-mode t)

;; sh-mode
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.bash\\'" . sh-mode))

(add-hook 'sh-mode-hook
          (lambda ()
            (setq sh-basic-offset 2
                  sh-indentation 2
                  tab-width 2)))
