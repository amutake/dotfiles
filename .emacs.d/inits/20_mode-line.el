;; depends: theme

(el-get-bundle! powerline)

(defun my-nw-powerline-theme ()
  "my custom powerline theme for no window"
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (lhs (list (powerline-raw "%*" nil 'l)
                                     (when powerline-display-mule-info
                                       (powerline-raw mode-line-mule-info nil 'l))
                                     (powerline-buffer-id nil 'l)
                                     (powerline-raw " ")
                                     (powerline-major-mode face1 'l)
                                     (powerline-process face1)
                                     (powerline-minor-modes face1 'l)
                                     (powerline-narrow face1 'l)
                                     (powerline-raw " " face1)
                                     (powerline-vc face2 'r)))
                          (rhs (list (powerline-raw global-mode-string face2 'r)
                                     (powerline-raw "%3l" face1 'l) ; line number
                                     (powerline-raw ":" face1 'l)
                                     (powerline-raw "%3c" face1 'r) ; column number
                                     (powerline-raw " ")
                                     (powerline-raw "%6p" nil 'r)))) ; page position
                     (concat (powerline-render lhs)
                             (powerline-fill mode-line (powerline-width rhs))
                             (powerline-render rhs))))))
  (custom-set-faces
   `(powerline-inactive1 ((t (:background ,(face-background 'mode-line-inactive)))))))

(if (window-system)
    (powerline-default-theme)
  (my-nw-powerline-theme))
