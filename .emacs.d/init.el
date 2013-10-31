;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)
(add-to-list 'el-get-recipe-path "~/.emacs.d/recipes")
(el-get 'sync
        '(auto-complete
          org-mode
          undo-tree
          color-theme
          color-theme-solarized
          color-theme-tangotango
          markdown-mode
          ;; Haskell
          haskell-mode
          ghc-mod
          ;; Ruby
          ruby-mode
          ;; Scala
          scala-mode2
          ;; Theorem prover
          proof-general-latest
          idris-mode))

;; inits
(add-to-list 'load-path "~/.emacs.d/inits")
(require 'action-init)
(require 'appearance-init)
(require 'mode-init)
