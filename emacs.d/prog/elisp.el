(require 'repl-toggle)

(add-to-list 'rtog/mode-repl-alist '(purescript-mode . psci))
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)

(use-package elisp-demos)
(advice-add 'helpful-update
            :after #'elisp-demos-advice-helpful-update)
