(require 'use-package)
(require 'auto-complete)

(use-package web-mode
  :mode "\\.tpl\\|\\.php|\\.erb|\\.htm|\\.html"
  :init
  (add-to-list 'ac-modes 'web-mode))
