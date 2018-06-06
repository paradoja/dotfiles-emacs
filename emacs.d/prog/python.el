(require 'use-package)
(use-package elpy)

(elpy-enable)
(add-hook 'python-mode-hook #'aggressive-indent-mode)
