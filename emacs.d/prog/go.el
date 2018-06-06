(require 'use-package)

(use-package go-mode)
(add-hook 'go-mode-hook #'aggressive-indent-mode)
