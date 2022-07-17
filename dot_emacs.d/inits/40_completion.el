(use-package corfu
  :custom
  (corfu-auto t)
  :init
  (global-corfu-mode))

(use-package popon
  :straight (:type git :repo "https://codeberg.org/akib/emacs-popon.git"))
(use-package corfu-terminal
  :straight (:type git :repo "https://codeberg.org/akib/emacs-corfu-terminal.git")
  :config (corfu-terminal-mode +1))

(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-keyword))

(use-package corfu-doc
  :hook (corfu-mode-hook . corfu-doc-mode))
(use-package corfu-doc-terminal
  :straight (:type git :repo "https://codeberg.org/akib/emacs-corfu-doc-terminal.git")
  :config (corfu-doc-terminal-mode +1))
