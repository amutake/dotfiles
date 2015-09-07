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

;; for X
(when (window-system)
  ;; tool-bar
  (tool-bar-mode 0)
  ;; font
  (set-face-attribute 'default nil
                      :family "Monaco"
                      :height 160)
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "IPAGothic"))
  (setq face-font-rescale-alist
        '(("IPA.*" . 1.3))))
