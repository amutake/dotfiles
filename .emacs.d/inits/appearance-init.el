(provide 'appearance-init)

;; line-number, column-number
(when (require 'linum nil t)
  (global-linum-mode t))
(column-number-mode t)

;; tool-bar
(tool-bar-mode -1)

;; menu-bar
(menu-bar-mode -1)

;; color
;; (set-foreground-color "white")
;; (set-background-color "black")
;; (set-cursor-color "white")
;; (add-to-list 'default-frame-alist '(alpha . 92))

;; font
(set-face-attribute 'default nil
                    :family "Ubuntu Mono"
                    :height 118)

;; hl-mode
(when (window-system)
  (global-hl-line-mode)
  (set-face-background hl-line-face "grey13"))

;; parens highlight
(show-paren-mode t)
