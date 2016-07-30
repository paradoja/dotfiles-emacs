(require 'use-package)

(use-package tern)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
