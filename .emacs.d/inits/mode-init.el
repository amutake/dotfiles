(provide 'mode-init)

;; ghc-mod
(require 'config)
(add-to-list 'load-path (concat elisp-dir "/ghc-mod"))
(add-to-list 'exec-path
             (concat (getenv "HOME") "/.cabal-dev/bin"))
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook
          (lambda ()
            (ghc-init)
            (flymake-mode)
            (turn-on-haskell-indentation)))

;; ProofGeneral
(require 'proof-site)
(add-hook 'coq-mode-hook
          (lambda ()
            (define-key holes-mode-map (kbd "C-c C-j") nil)
            (define-key coq-mode-map (kbd "C-c C-j") 'proof-goto-point)
            ;; (define-key coq-mode-map (kbd "C-c C-n") 'newline)
            ))

;; seminar-mode
(defvar seminar-mode nil)
(defun seminar-mode (&optional arg)
  "seminar minor-mode"
  (interactive)
  (cond
   ((< (prefix-numeric-value arg) 0) (setq seminar-mode nil))
   (arg (setq seminar-mode t))
   (t (setq seminar-mode (not seminar-mode))))
  (if seminar-mode
      (progn
        (set-foreground-color "black")
        (set-background-color "white")
        (set-cursor-color "grey13")
        (set-face-attribute 'default nil
                            :family "Ubuntu Mono"
                            :height 130)
        (set-face-background hl-line-face "#eeeeff"))
    (set-foreground-color "white")
    (set-background-color "black")
    (set-cursor-color "white")
    (set-face-attribute 'default nil
                        :family "Ubuntu Mono"
                        :height 118)
    (set-face-background hl-line-face "gray13")))
