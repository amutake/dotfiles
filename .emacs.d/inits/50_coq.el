(el-get-bundle proof-general-latest)
(el-get-bundle company-math)
(el-get-bundle cpitclaudel/company-coq)

(-when-let (coq-bin-dir (opam-package-bin-dir "coq"))
  (add-to-list 'exec-path coq-bin-dir)
  (require 'proof-site)
  (add-hook 'coq-mode-hook
            (lambda ()
              (company-coq-initialize)
              (bind-key "C-c RET" 'proof-goto-point coq-mode-map)))
  (unless (window-system)
    (custom-set-faces
     '(proof-locked-face ((t (:background "color-17")))) ;; success
     '(proof-queue-face ((t (:background "color-22")))) ;; wating
     '(proof-warning-face ((t (:background "color-58")))) ;; warning
     '(proof-error-face ((t (:background "color-52"))))))) ;; error
