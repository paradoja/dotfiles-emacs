(require 'use-package)

(use-package sass-mode)
(add-hook 'sass-mode-hook #'aggressive-indent-mode)
