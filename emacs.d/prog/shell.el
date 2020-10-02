(require 'flycheck)

(requirements-add
 shell.el
 (shellcheck
  (executable-find "shellcheck")
  "Shellcheck"
  "https://www.shellcheck.net/")
 (bash-language-server
  (executable-find "bash-language-server")
  "Bash language server"
  "https://github.com/bash-lsp/bash-language-server"
  "yarn global add bash-language-server"))

(-when-let ((shellcheck-location (executable-find "shellcheck")))
  (setq flycheck-sh-shellcheck-executable shellcheck-location))

(when (executable-find "bash-language-server")
  (add-hook 'sh-mode #'lsp))

(use-package fish-mode)
