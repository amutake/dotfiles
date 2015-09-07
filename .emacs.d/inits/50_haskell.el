(el-get-bundle haskell-mode)
(el-get-bundle hi2)
(el-get-bundle ghc-mod)

(add-to-list 'exec-path "~/.cabal/bin")
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook
          (lambda ()
            (ghc-init)
            (turn-on-hi2)
            (bind-key "C-c t" 'ghc-show-type haskell-mode-map)))
