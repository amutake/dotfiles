(el-get-bundle scala-mode2)
(el-get-bundle ensime)
(global-auto-complete-mode 0) ; ensime loads auto-complete
(add-to-list 'auto-mode-alist '("\\.scala.html\\'" . scala-mode))
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
