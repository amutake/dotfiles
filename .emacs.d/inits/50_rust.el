(el-get-bundle rust-mode)
(el-get-bundle racer-rust/emacs-racer)

(setq racer-cmd "~/.local/bin/racer")
(setq racer-rust-src-path "~/.local/share/rust/src/")

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(bind-key "TAB" #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)
