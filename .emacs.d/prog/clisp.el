(add-hook 'lisp-mode-hook
          (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook
          (lambda () (paredit-mode +1)))
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")
