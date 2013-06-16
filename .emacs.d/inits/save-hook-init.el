(provide 'save-hook-init)

(setq require-final-newline t)
(add-hook 'before-save-hook
          'delete-trailing-whitespace)
