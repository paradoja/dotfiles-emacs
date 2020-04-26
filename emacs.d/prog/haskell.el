(require 'use-package)

;; requires haskell ide engine (hie)
;; https://github.com/haskell/haskell-ide-engine#installation

(use-package haskell-mode
  :hook (interactive-haskell-mode)
  :config
  (when (executable-find "brittany")
    (add-hook 'haskell-mode-hook #'format-all-mode)))
(use-package lsp-haskell
  :hook (haskell-mode))
;; (use-package shakespeare-mode) ; for Yesod's templates
