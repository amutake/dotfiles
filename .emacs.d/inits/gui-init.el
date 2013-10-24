(if window-system
    (progn
      ;; meta-key cocoa
      (setq ns-command-modifier 'meta)
      (setq ns-alternate-modifier 'super)
      ;; tool-bar
      (tool-bar-mode 0)
      ;; appearance
      (set-foreground-color "black")
      (set-background-color "white")
      (set-cursor-color "#666666")
      (set-face-attribute 'default nil
                          :family "Dejavu Sans Mono"
                          :height 130)
      (set-fontset-font
       nil 'japanese-jisx0208
       (font-spec :family "Hiragino Mincho Pro"))
      (setq face-font-rescale-alist
            '((".*Hiragino_Mincho_pro.*" . 1.2)))
      (set-face-background hl-line-face "#eeeeff")))

(provide 'gui-init)
