(require 'use-package)
(use-package haskell-mode
  :init
  ;; (add-hook 'haskell-mode-hook
  ;;           (lambda ()
  ;;             (require 'haskell-indent)
  ;;             (interactive-haskell-mode)
  ;;             (turn-on-haskell-doc-mode)
  ;;             (turn-on-haskell-indent)
  ;;             (capitalized-words-mode t)
  ;;             (setf haskell-program-name "ghci")
  ;;             (define-key haskell-mode-map (kbd "C-<right>")
  ;;               (lambda ()
  ;;                 (interactive)
  ;;                 (haskell-move-nested 1)))
  ;;             ;; Same as above but backwards.
  ;;             (define-key haskell-mode-map (kbd "C-<left>")
  ;;               (lambda ()
  ;;                 (interactive)
  ;;                 (haskell-move-nested -1)))
  ;;             (structured-haskell-mode)))

  (add-hook 'inferior-haskell-mode-hook
            (lambda ()
              (capitalized-words-mode t))))

(use-package intero
  :init
  (add-hook 'haskell-mode-hook 'intero-mode))

(require 'flycheck)
(flycheck-add-next-checker 'intero '(warning . haskell-hlint))

(use-package ghci-completion)
;(use-package shm)
