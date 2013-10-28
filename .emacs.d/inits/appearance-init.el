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
  ;; color
  (set-background-color "#ddddcc")
  (set-foreground-color "black")
  (set-cursor-color "#666666")
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
  (global-hl-line-mode)
  (set-face-background hl-line-face "#cccccc"))

(provide 'appearance-init)
