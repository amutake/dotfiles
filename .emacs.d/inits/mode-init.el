;; ghc-mod
(add-to-list 'exec-path "~/.local/bin")
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook
          (lambda ()
            (ghc-init)
            (flymake-mode)
            (turn-on-haskell-indentation)))

;; js-mode
(add-hook 'js-mode-hook
          (lambda ()
            (if (string= system-name "") ;; for part-time job
                (progn
                  (setq tab-width 4)
                  (setq indent-tabs-mode t)
                  (setq c-basic-offset 4))
              (setq tab-width 2)
              (setq indent-tabs-mode nil)
              (setq c-basic-offset 2))))

;; ProofGeneral
(add-to-list 'exec-path "/usr/local/bin") ;; coqtop
(require 'proof-site)
(add-hook 'coq-mode-hook
          (lambda ()
            (define-key coq-mode-map (kbd "C-c RET") 'proof-goto-point)))

;; scala.html
(add-to-list 'auto-mode-alist '("\\.scala.html$" . scala-mode))

;; less
(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))

;; ruby
(setq ruby-insert-encoding-magic-comment nil)

;; LaTeX
(add-to-list 'auto-mode-alist '("\\.tex$" . latex-mode))

;; golang
(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook
                      'gofmt-before-save)
            (require 'go-autocomplete)
            (require 'go-flymake)))

(provide 'mode-init)
