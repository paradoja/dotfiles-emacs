(requirements-add
 css.el
 (css-languageserver
  (executable-find "css-languageserver")
  "css-languageserver"
  "https://github.com/vscode-langservers/vscode-css-languageserver-bin"
  "yarn global add vscode-css-languageserver-bin"))

(use-package css-mode
  :hook (css-mode . lsp))

(setq css-indent-offset 2)
