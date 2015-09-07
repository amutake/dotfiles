;; shell-string : string -> option string
(defun shell-string (exe)
  "Simple wrapper of `shell-command-to-string'."
  (when (executable-find (car (s-split " " exe)))
    (s-chomp (shell-command-to-string exe))))

;; opam-package-enabled : string -> boolean
(defun opam-package-enabled (name)
  "Return `t' if the package is enabled"
  (s-equals?
   (shell-string (concat "opam config var " name ":enable"))
   "enable"))

;; opam-package-bin-dir : string -> option string
(defun opam-package-bin-dir (name)
  "Find bin directory of opam package. If it is not found or opam is not installed, it returns `nil'."
  (when (opam-package-enabled name)
    (let ((path (shell-string (concat "opam config var " name ":bin"))))
      (unless (s-equals? path "#undefined")
        path))))
