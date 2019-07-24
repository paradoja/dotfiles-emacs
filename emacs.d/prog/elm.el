(require 'use-package)
(use-package company)

(use-package elm-mode
  :config
  (add-hook 'elm-mode-hook #'elm-oracle-setup-completion)
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-elm)))

(use-package flycheck-elm
  :config
  (progn
    (eval-after-load 'flycheck
      '(add-hook 'flycheck-mode-hook #'flycheck-elm-setup))))
