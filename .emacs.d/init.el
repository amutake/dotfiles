(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; el-get
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path (locate-user-emacs-file "recipes"))

;; el-get-lock
(el-get-bundle tarao/el-get-lock)
(el-get-lock)

;; init
(el-get-bundle init-loader)
(setq-default init-loader-byte-compile nil
              init-loader-show-log-after-init nil)
(init-loader-load (locate-user-emacs-file "inits"))

;; bundle
(el-get-bundle magit)
(el-get-bundle anzu)

;; mode
(el-get-bundle markdown-mode)
