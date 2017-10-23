(el-get-bundle tuareg-mode)

;; ocamlspot
(-when-let (ocamlspot-bin-dir (opam-package-bin-dir "ocamlspot"))
  (el-get-bundle ocamlspot
    :url "https://bitbucket.org/camlspotter/ocamlspot"
    :type hg
    :features ocamlspot)
  (require 'ocamlspot)
  (add-hook 'tuareg-mode-hook
            (lambda ()
              (bind-keys :map tuareg-mode-map
                         ("C-c ;" . ocamlspot-query)
                         ("C-c :" . ocamlspot-query-interface)
                         ("C-c '" . ocamlspot-query-uses)
                         ("C-c C-t" . ocamlspot-type)
                         ("C-c C-i" . ocamlspot-xtype)
                         ("C-c C-y" . ocamlspot-type-and-copy)
                         ("C-c t" . caml-types-show-type)
                         ("C-c p" . ocamlspot-pop-jump-stack))))
  (setq ocamlspot-command ocamlspot-bin-dir))

(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var"
                                                     "share")))))
  (when (and opam-share (file-directory-p opam-share))
    ;; Register Merlin
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (autoload 'merlin-mode "merlin" nil t nil)
    ;; Automatically start it in OCaml buffers
    (add-hook 'tuareg-mode-hook 'merlin-mode t)
    (add-hook 'caml-mode-hook 'merlin-mode t)
    ;; Use opam switch to lookup ocamlmerlin binary
    (setq merlin-command 'opam)))
