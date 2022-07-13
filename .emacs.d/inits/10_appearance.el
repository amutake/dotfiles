(global-display-line-numbers-mode)
(global-hl-line-mode)
(column-number-mode t)
(menu-bar-mode -1)
(show-paren-mode t)
(prefer-coding-system 'utf-8)

(use-package emacs
  :ensure t
  :config
  (load-theme 'modus-vivendi))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package all-the-icons
  :ensure t)
