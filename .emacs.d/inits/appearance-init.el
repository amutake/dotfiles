;; line-number
(when (require 'linum nil t)
  (global-linum-mode t))

;; column-number
(column-number-mode t)

;; menu-bar
(menu-bar-mode -1)

;; parens highlight
(show-paren-mode t)

(provide 'appearance-init)
