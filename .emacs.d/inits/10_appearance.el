;; line-number
(if (version<= "26.0.50" emacs-version)
    (global-display-line-numbers-mode)
  (when (require 'linum nil t) ;; for old emacs
  (global-linum-mode t)
  (setq linum-format "%3d ")))

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

;; utf-8
(prefer-coding-system 'utf-8)
