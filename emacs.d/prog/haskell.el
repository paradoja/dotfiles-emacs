(require 'use-package)

;; requires haskell ide engine (hie)
;; https://github.com/haskell/haskell-ide-engine#installation
;; requires hastags for tags

(use-package haskell-mode
  :hook
  ((interactive-haskell-mode)
   (haskell-mode .
                 (lambda ()
                   (set (make-local-variable 'company-backends)
                        (append '((company-capf company-dabbrev-code))
                                company-backends)))))
  :config
  (when (executable-find "brittany")
    (add-hook 'haskell-mode-hook #'format-all-mode))
  :custom
  ((haskell-tags-on-save  t)
   (haskell-compile-cabal-build-command "stack build")
   (haskell-process-suggest-remove-import-lines t)
   (haskell-process-auto-import-loaded-modules t)
   (haskell-process-log t))
  :general
  (:prefix "C-c C-p"
           "C-l" 'haskell-process-load-file
           "i" 'haskell-interactive-bring
           "C-t" 'haskell-process-do-type
           "C-i" 'haskell-process-do-info
           "C-c" 'haskell-process-cabal-build
           "C-k" 'haskell-interactive-mode-clear
           "c" 'haskell-process-cabal))
(use-package lsp-haskell
  :hook (haskell-mode))
;; (use-package shakespeare-mode) ; for Yesod's templates
