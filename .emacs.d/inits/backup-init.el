(provide 'backup-init)

(require 'config)
(add-to-list 'backup-directory-alist
             (cons "." (concat emacs-dir "/backup-files")))
