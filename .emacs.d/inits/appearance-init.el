;; line-number
(when (require 'linum nil t)
  (global-linum-mode t))

;; column-number
(column-number-mode t)

;; menu-bar
(menu-bar-mode -1)

;; parens highlight
(show-paren-mode t)

;; for X
(when (window-system)
  ;; tool-bar
  (tool-bar-mode 0)
  ;; font
  (set-face-attribute 'default nil
                      :family "Dejavu Sans Mono"
                      :height 130)
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "IPAGothic"))
  (setq face-font-rescale-alist
        '(("IPA.*" . 1.3)))
  ;; hl-mode
  (global-hl-line-mode))

;; color-theme
(require 'color-theme)
(color-theme-initialize)
(if (window-system)
    (color-theme-solarized-light)
  (color-theme-solarized-dark))

(provide 'appearance-init)
