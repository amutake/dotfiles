;; el-get

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

;; el-get-lock
(el-get-bundle tarao/el-get-lock)
(el-get-lock)

;; init
(el-get-bundle init-loader)
(setq-default init-loader-byte-compile t
	      init-loader-show-log-after-init nil)
(init-loader-load (locate-user-emacs-file "inits"))

;; bundle
(el-get-bundle magit)
(bind-key "C-c m" 'magit-status)
(el-get-bundle git-gutter)
(global-git-gutter-mode +1)

;; mode
(el-get-bundle markdown-mode)
(el-get-bundle emacsmirror:csv-mode)
(autoload 'csv-mode "csv-mode" nil t)
(el-get-bundle yaml-mode)
(el-get-bundle toml-mode)
