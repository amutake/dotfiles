(el-get-bundle helm)

(when (require 'helm-config nil t)
  (helm-mode 1)
  (custom-set-faces
   '(helm-selection ((t (:background "color-238")))))
  ;; helm-swoop
  (el-get-bundle helm-swoop)
  (bind-key "C-s" 'helm-swoop)
  ;; helm-ag
  (el-get-bundle helm-ag)
  (bind-key "C-c C-s" 'helm-ag)
  ;; helm-ls-git
  (el-get-bundle helm-ls-git)
  (bind-key "C-x C-d" 'helm-browse-project)
  ;; to prevent `ls does not support --dired'
  (setq dired-use-ls-dired nil))
