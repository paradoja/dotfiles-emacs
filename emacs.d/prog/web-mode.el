(require 'use-package)
(require 'company)

(use-package web-mode
  :mode "\\.tpl\\|\\.php\\|\\.erb\\|\\.htm\\|\\.html"
  :config
  (progn
    (setq-default web-mode-markup-indent-offset 2) ; HTML
    (setq-default web-mode-css-indent-offset 2)    ; CSS
    (setq-default web-mode-code-indent-offset 2)))

(use-package company-web
  :config
  (require 'company-web-html))

(use-package ac-html-csswatcher)
