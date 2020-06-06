(require 'flycheck)

(requirements-add
 shell.el
 (shellcheck
  (executable-find "shellcheck")
  "Shellcheck"
  "https://www.shellcheck.net/")
 (bash-language-server
  (executable-find "bash-language-server")
  "Bash language server
   yarn global add bash-language-server"
  "https://github.com/bash-lsp/bash-language-server"))

;; requirements
;; npm i -g bash-language-server

(-when-let ((executable-find (executable-find "shellcheck")))
  (setq flycheck-sh-shellcheck-executable executable-find))

(when (executable-find "bash-language-server")
  (add-hook 'sh-mode #'lsp))
