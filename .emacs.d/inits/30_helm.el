(el-get-bundle helm)

(when (require 'helm-config nil t)
  (helm-mode 1)
  (el-get-bundle helm-swoop)
  (bind-key "C-s" 'helm-swoop)
  (el-get-bundle helm-ag)
  (bind-key "C-c C-s" 'helm-ag)
  ;; to prevent ls does not support --dired
  (setq dired-use-ls-dired nil))
