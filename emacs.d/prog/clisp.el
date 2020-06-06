(add-hook 'lisp-mode-hook
          (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook
          (lambda () (paredit-mode +1)))

(require 'mode-local)
(use-package slime)

(setq inferior-lisp-program "sbcl")
