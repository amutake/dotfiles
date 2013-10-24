(provide 'action-init)

;; scroll
;; (set-scroll-bar-mode 'right)
(setq-default scroll-conservatively 5
              scroll-margin 1
              scroll-step 2)

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

;; undo/redo
(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "C-M-/") 'undo-tree-redo)
(global-set-key (kbd "C-/") 'undo-tree-undo)

;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)
(global-set-key (kbd "C-RET") 'cua-set-rectangle-mark)

;; meta, super
(setq ns-command-modifier 'meta)
(setq ns-alternate-modifier 'super)
