(require 'repl-toggle)

(add-to-list 'rtog/mode-repl-alist '(purescript-mode . psci))
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))
