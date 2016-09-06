(require 'use-package)

(use-package elm-mode
  :config
  (add-hook 'elm-mode-hook #'elm-oracle-setup-ac))

(use-package flycheck-elm
  :config
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-elm-setup)))
