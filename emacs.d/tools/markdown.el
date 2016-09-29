(require 'use-package)

(use-package markdown-mode
  :init
  (add-hook 'markdown-mode-hook (lambda () (flyspell-mode))))
