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
    (let ((background-1 "color-16")
          (background "color-232")
          (background+1 "color-233")
          (comment "color-245"))
      (custom-set-faces
       `(default ((t (:background ,background))))
       `(linum ((t (:background ,background :foreground "color-107"))))
       `(mode-line ((t (:background ,background+1))))
       `(mode-line-buffer-id ((t (:foreground "color-154"))))
       `(mode-line-inactive ((t (:background ,background-1))))
       `(font-lock-comment-face ((t (:foreground ,comment))))
       `(font-lock-comment-delimiter-face ((t (:foreground ,comment))))
       `(hl-line ((t (:background ,background+1))))))))

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
