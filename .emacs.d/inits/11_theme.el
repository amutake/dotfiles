(el-get-bundle osener/emacs-afternoon-theme
  :features afternoon-theme)

;; use C-x C-e to customize faces
;; (list-colors-display)
;; (list-faces-display)

(defun my-custom-theme ()
  "my custom theme"
  (interactive)
  (when (and
         (not window-system)
         (eq (display-color-cells (selected-frame)) 256)) ; 256color
    (let ((background "unspecified-bg")
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

(defun set-theme ()
  "set theme"
  (load-theme 'afternoon t)
  (my-custom-theme))

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (select-frame frame)
                (set-theme)))
  (set-theme))
