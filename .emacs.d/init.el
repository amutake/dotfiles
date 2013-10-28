;; (require 'package-init)
;; (require 'indent-init)
;; (require 'backup-init)
;; (require 'appearance-init)
;; (require 'mode-init)
;; (require 'gui-init)

;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)
(el-get 'sync
	'(auto-complete
	  org-mode
	  undo-tree
	  ;; Haskell
	  haskell-mode
	  ghc-mod
	  ;; Ruby
	  ruby-mode
	  ;; Scala
	  scala-mode2))

;; inits
(add-to-list 'load-path "~/.emacs.d/inits")
(require 'save-hook-init)
(require 'action-init)
(require 'backup-init)
