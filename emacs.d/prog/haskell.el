(require 'use-package)

(requirements-add
 haskell.el
 (haskell-language-server
  (executable-find "haskell-language-server-wrapper")
  "Haskell lsp server"
  "https://github.com/haskell/haskell-language-server"
  "Install wrapper and versions from
   https://github.com/haskell/haskell-language-server/releases")
 (hlint
  (executable-find "hlint")
  "Haskell linter"
  "https://github.com/ndmitchell/hlint"
  "stack install hlint"))

(defun haskell-narrow-to-defun ()
  (interactive)
  (let* ((pos (point))
         (start (haskell-ds-backward-decl))
         (end (haskell-ds-forward-decl)))
    (narrow-to-region start end)
    (goto-char pos)))

(use-package haskell-mode
  :hook
  ((before-save . lsp-format-buffer)
   (haskell-mode . lsp))
  ;; TODO: clean this, it doesn't really make sense
  (haskell-mode . (lambda ()
                    (flycheck-add-next-checker 'lsp 'haskell-hlint)))
  ((interactive-haskell-mode)
   (haskell-mode .
                 (lambda ()
                   (set (make-local-variable 'company-backends)
                        (append '((company-capf company-dabbrev-code))
                                company-backends)))))
  :config
  (add-to-list 'magic-mode-alist
               '("#!/usr/bin/env +stack" . haskell-mode))
  :custom
  ((haskell-tags-on-save  t)
   (haskell-compile-cabal-build-command "stack build")
   (haskell-process-suggest-remove-import-lines t)
   (haskell-process-auto-import-loaded-modules t)
   (haskell-process-log t))
  :general
  (haskell-mode-map
   :prefix "C-c C-p"
   "C-l" 'haskell-process-load-file
   "i"   'haskell-interactive-bring
   "C-t" 'haskell-process-do-type
   "C-i" 'haskell-process-do-info
   "C-c" 'haskell-process-cabal-build
   "C-k" 'haskell-interactive-mode-clear
   "c"   'haskell-process-cabal)
  (haskell-mode-map
   "C-x n d" 'haskell-narrow-to-defun))
(use-package lsp-haskell
  :config
  (setq lsp-haskell-process-path-hie "haskell-language-server-wrapper")
  ;; Comment/uncomment this line to see interactions between lsp client/server.
  ;;(setq lsp-log-io t)
  )

;; (use-package shakespeare-mode) ; for Yesod's templates
