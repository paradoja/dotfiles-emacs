(require 'use-package)
(require 'company)

(use-package web-mode
  :mode "\\.tpl\\|\\.php|\\.erb|\\.htm|\\.html")

(use-package company-web
  :config
  (require 'company-web-html))

(use-package ac-html-csswatcher)
