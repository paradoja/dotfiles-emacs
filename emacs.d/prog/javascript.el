(require 'use-package)

(use-package js-mode-hook
  :init
  (add-hook 'js-mode-hook (lambda () (tern-mode t))))
(use-package tern)
