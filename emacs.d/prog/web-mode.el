(require 'use-package)
(require 'company)

(requirements-add
 web-mode.el
 (html-languageserver
  (executable-find "html-languageserver")
  "html-languageserver
   yarn global add vscode-html-languageserver-bin"
  "https://github.com/vscode-langservers/vscode-css-languageserver-bin"))

(use-package emmet-mode)

(use-package web-mode
  :mode "\\.tpl\\|\\.php\\|\\.erb\\|\\.htm\\|\\.html"
  :hook ((web-mode . emmet-mode)
         (web-mode . lsp))
  :config
  (progn
    (setq-default web-mode-markup-indent-offset 2) ; HTML
    (setq-default web-mode-css-indent-offset 2)    ; CSS
    (setq-default web-mode-code-indent-offset 2)
    (setq-default web-mode-script-padding 2)))


(use-package company-web
  :config
  (require 'company-web-html))

(use-package ac-html-csswatcher)
