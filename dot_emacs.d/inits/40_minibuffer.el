(use-package vertico
  :init
  (vertico-mode))
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))
(use-package marginalia
  :init
  (marginalia-mode))
(use-package consult)
(use-package embark)
