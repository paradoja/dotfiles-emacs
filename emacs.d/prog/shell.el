(require 'flycheck)

;; requirements
;; npm i -g bash-language-server

(let ((executable-path (executable-find "shellcheck")))
  (if executable-path
      (setq flycheck-sh-shellcheck-executable executable-path)))
(add-hook 'shell-mode-hook #'aggressive-indent-mode)
