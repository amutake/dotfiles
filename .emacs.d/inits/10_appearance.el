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

;; color-theme
(el-get-bundle osener/emacs-afternoon-theme
  :features afternoon-theme)
;; (require 'afternoon-theme)
(load-theme 'afternoon t)

;; custom
(when nil
  "use C-x C-e to customize faces"
  (list-colors-display)
  (list-faces-display))

(defun my-custom-theme ()
  "my custom theme"
  (interactive)
  (when (and
         (not window-system)
         (eq (display-color-cells (selected-frame)) 256)) ; 256color
    (let ((background "color-232")
          (comment "color-245"))
      (custom-set-faces
       `(default ((t (:background ,background))))
       `(linum ((t (:background "color-16"))))
       `(mode-line ((t (:background "color-233"))))
       `(mode-line-buffer-id ((t (:foreground "color-154"))))
       `(mode-line-inactive ((t (:background "color-16"))))
       `(font-lock-comment-face ((t (:foreground ,comment))))
       `(font-lock-comment-delimiter-face ((t (:foreground ,comment))))
       `(hl-line ((t (:background "color-16"))))))))

(my-custom-theme)
