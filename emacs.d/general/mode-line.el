;;; Smart Mode Line
(use-package smart-mode-line)
(require 'smart-mode-line)
(require 'smart-mode-line-dark-theme)
(sml/setup)
;; I prefer to invert the colour scheme
(sml/apply-theme 'dark)
(custom-theme-set-faces
 'smart-mode-line-dark
 '(mode-line ((t :foreground "gray60" :background "#404045")))
 '(mode-line-inactive     ((t :foreground "gray60" :background "black"))))
(add-to-list 'sml/replacer-regexp-list `(,(concat "^" (abbreviate-file-name (file-truename "~/.emacs.d"))) ":ED:"))
(mapc (lambda (mode)
        (add-to-list 'sml/hidden-modes (format " %s" mode)))
      (list
       "Abbrev"     ; Abbrev
       "Arev"       ; auto-revert
       "ElDoc"      ; eldoc-mode
       "FlyC"       ; flycheck-mode
       "Guide"      ; guide-key-mode
       "Helm"       ; helm
       "Paredit"    ; paredit-mode
       "Undo-Tree"  ; undo-tree-mode
       "company"    ; company-mode
       "rt"         ; ruby-tools-mode
       "yas"        ; yas/minor-mode

                                        ; specific languages
       "Irony"      ; c-related irony-mode
       "REl"        ; ruby-electric-mode
       ))
(setq-default sml/col-number-format  "%3l")
(setq-default sml/line-number-format "%3l")
(setq-default sml/numbers-separator  "")
(setq-default sml/col-number-format  "%3c")
