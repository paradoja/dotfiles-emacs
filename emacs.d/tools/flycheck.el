(require 'use-package)
(use-package flycheck)

(eval-after-load 'flycheck
  (progn
    '(add-hook 'flycheck-mode-hook #'flycheck-cask-setup)
    '(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))))

(add-hook 'after-init-hook #'global-flycheck-mode)
