(require 'use-package)

(add-hook 'ledger-mode-hook 'auto-revert-tail-mode)

(use-package ledger-mode
  :config
  (setq ledger-binary-path (executable-find "hledger")
        ledger-mode-should-check-version nil
        ledger-init-file-name " "
        ;; ledger-post-amount-alignment-column 64
        ;;  ; disable distracting highlight
        ;; ledger-highlight-xact-under-point nil
        ))
