(require 'use-package)

(use-package geiser)
(use-package quack)
(add-hook 'racket-mode-hook #'aggressive-indent-mode)
