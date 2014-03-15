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
          json-reformat
          ;; Haskell
          haskell-mode
          haskell-style
          ;; structured-haskell-mode
          ghc-mod
          ;; Ruby
          ruby-mode
          ;; Scala
          scala-mode2
          ;; Go
          go-mode
          ;; Theorem prover
          proof-general-latest
          idris-mode))

;; to avoid errors...
(require 'auto-complete)
(require 'flymake)
(el-get 'sync
        '(go-autocomplete ;; ac-modes
          go-flymake ;; flymake-allowed-file-name-masks
          ))

;; inits
(add-to-list 'load-path "~/.emacs.d/inits")
(require 'action-init)
(require 'appearance-init)
(require 'mode-init)
