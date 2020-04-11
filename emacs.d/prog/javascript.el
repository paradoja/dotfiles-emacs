(require 'use-package)

;; requirements
;; Tern is used for flychecking.

(use-package js2-mode
  :config
  (progn (use-package js2-refactor)
         (use-package xref-js2)))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode) ; in case we load the menu
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")

;; (define-key js2-mode-map (kbd "C-k") #'js2r-kill)

(add-hook 'js2-mode-hook
          (lambda ()
            (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

(use-package tern)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

(add-hook 'js2-mode-hook #'aggressive-indent-mode)
