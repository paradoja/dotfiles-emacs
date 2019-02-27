(require 'use-package)
(require 'repl-toggle)

(use-package racket-mode
  :general
  (racket-mode-map
   "C-c z" 'racket-run
   "C-c C-z" 'rtog/toggle-repl
   "{"  'paredit-open-curly
   "}" 'paredit-close-curly
   "M-[" 'paredit-wrap-square
   "M-{" 'paredit-wrap-curly)
  :hook
  ((racket-mode . paredit-mode)
   (racket-mode . racket-unicode-input-method-enable)
   (racket-repl-mode . racket-unicode-input-method-enable))
  :config
  (progn
    (add-to-list 'rtog/mode-repl-alist '(racket-mode . racket-run-and-switch-to-repl))
    (add-hook 'racket-mode-hook #'aggressive-indent-mode)))

;; future custom build step:
;; (racket-mode-start-faster)
