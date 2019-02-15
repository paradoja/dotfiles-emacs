(require 'use-package)
(require 'repl-toggle)

(use-package ielm)
(add-to-list 'rtog/mode-repl-alist '(emacs-lisp-mode . ielm))

(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)

(use-package elisp-demos)
(advice-add 'helpful-update
            :after #'elisp-demos-advice-helpful-update)
