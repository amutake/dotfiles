(el-get-bundle proof-general-latest)
(el-get-bundle company-math)
(el-get-bundle cpitclaudel/company-coq)

(-when-let (coq-bin-dir (opam-package-bin-dir "coq"))
  (add-to-list 'exec-path coq-bin-dir)
  (require 'proof-site)
  (add-hook 'coq-mode-hook
            (lambda ()
              (company-coq-initialize)
              (bind-key "C-c RET" 'proof-goto-point coq-mode-map))))
