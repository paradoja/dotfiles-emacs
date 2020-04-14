(require 'use-package)

;; requires haskell ide engine (hie)
;; https://github.com/haskell/haskell-ide-engine#installation

(use-package haskell-mode)
(use-package lsp-haskell
  :hook (haskell-mode))
;; (use-package shakespeare-mode) ; for Yesod's templates
