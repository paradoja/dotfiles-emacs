(require 'flycheck)

(let ((executable-path (executable-find "shellcheck")))
  (if executable-path
      (setq flycheck-sh-shellcheck-executable (executable-find "shellcheck"))))
