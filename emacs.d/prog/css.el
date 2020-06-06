(requirements-add
 css.el
 (css-languageserver
  (executable-find "css-languageserver")
  "css-languageserver
   yarn global add vscode-css-languageserver-bin"
  "https://github.com/vscode-langservers/vscode-css-languageserver-bin"))

(use-package css-mode
  :hook (css-mode . lsp))

(setq css-indent-offset 2)
