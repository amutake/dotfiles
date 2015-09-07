;; scroll
(when (window-system)
  (scroll-bar-mode -1))
(setq-default scroll-conservatively 5
              scroll-margin 1
              scroll-step 2)

;; company-mode
(el-get-bundle company-mode)
(require 'company)
(with-eval-after-load 'company
  (bind-keys :map company-active-map
             ("C-n" . company-select-next)
             ("C-p" . company-select-previous))
  (setq company-idle-delay 0)
  (global-company-mode))

;; undo/redo
(el-get-bundle! undo-tree
  (global-undo-tree-mode t)
  (bind-key "C-M-/" 'undo-tree-redo)
  (bind-key "C-/" 'undo-tree-undo))

;; cua-mode
(cua-selection-mode t)
(bind-key "C-c C-SPC" 'cua-set-rectangle-mark)

;; tab is 2 space
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; backup
(add-to-list 'backup-directory-alist
             '("." . "~/.emacs.d/backup"))

;; delete trailing white space and blank line before save
(setq require-final-newline t)
(add-hook 'before-save-hook
          'delete-trailing-whitespace)

;; for cocoa emacs
(when (eq window-system 'ns)
  (setq ns-command-modifier 'meta)
  (setq ns-alternate-modifier 'super))

;; flymake-cursor
(custom-set-variables
 '(help-at-pt-timer-delay 0.5)
 '(help-at-pt-display-when-idle '(flymake-overlay)))

;; iswitch
;; (icomplete-mode t)
;; (require 'ido)
;; (ido-mode t)
(setq confirm-nonexistent-file-or-buffer nil)

(fset 'yes-or-no-p 'y-or-n-p)

;; window resizer
;; http://d.hatena.ne.jp/khiker/20100119/window_resize
(defun my-window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        action c)
    (catch 'end-flag
      (while t
        (setq action
              (read-key-sequence-vector (format "size[%dx%d]"
                                                (window-width)
                                                (window-height))))
        (setq c (aref action 0))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (let ((last-command-char (aref action 0))
                     (command (key-binding action)))
                 (when command
                   (call-interactively command)))
               (message "Quit")
               (throw 'end-flag t)))))))
(bind-key "C-c C-r" 'my-window-resizer)

;; flycheck
(el-get-bundle flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
