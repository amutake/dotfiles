(el-get-bundle helm)
(el-get-bundle projectile)
(projectile-global-mode)

(when (require 'helm-config nil t)
  (helm-mode 1)
  ;; key bind
  (unbind-key "C-z")
  (custom-set-variables
   '(helm-command-prefix-key "C-z"))
  ;; helm-find-files
  (bind-key "C-x C-f" 'helm-find-files)
  ;; helm-M-x
  (bind-key "M-x" 'helm-M-x)
  ;; helm-buffers-list
  (bind-key "C-x C-b" 'helm-buffers-list)
  ;; helm-recentf
  (bind-key "C-x C-r" 'helm-recentf)
  ;; helm-ag
  (el-get-bundle helm-ag)
  (bind-key "g" 'helm-ag helm-command-map)
  ;; helm-ls-git
  (el-get-bundle helm-ls-git)
  (require 'helm-ls-git nil t)
  (bind-key "l" 'helm-browse-project helm-command-map)
  ;; projectile
  (setq projectile-completion-system 'helm)
  (helm-projectile-on)
  (bind-key "p" 'helm-projectile helm-command-map)
  ;; to prevent `ls does not support --dired'
  (setq dired-use-ls-dired nil)
  ;; custom-variables
  (custom-set-variables
   '(helm-ff-auto-update-initial-value nil)
   '(helm-ff-skip-boring-files t)
   '(helm-boring-file-regexp-list '("~\\'" "\\.elc\\'"))
   '(helm-mini-default-sources '(helm-source-recentf
                                 helm-source-projectile-projects
                                 helm-source-buffers-list
                                 helm-source-files-in-current-dir
                                 helm-source-projectile-files-list)))
  (bind-key "m" 'helm-mini helm-command-map)
  ;; custom faces
  (custom-set-faces
   '(helm-selection ((t (:background "color-238"))))))
