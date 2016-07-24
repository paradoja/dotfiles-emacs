(require 'use-package)
(require 'repl-toggle)

(use-package purescript-mode
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
(use-package psci
  :init
  (add-to-list 'rtog/mode-repl-alist '(purescript-mode . psci)))
