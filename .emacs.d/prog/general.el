(require 'use-package)

(use-package repl-toggle
  :init
  (setq rtog/fullscreen t)
  :config
  (setq rtog/mode-repl-alist '()))

(defun pdox-new-line-and-indent (&optional arg)
  (interactive "p")
  (newline arg)
  (indent-according-to-mode))

;;; Ediff
(setq-default ediff-window-setup-function 'ediff-setup-windows-plain)
(setq-default ediff-split-window-function 'split-window-horizontally)
(setq-default ediff-auto-refine 'on)

;;; Lisps
(use-package paredit)
(use-package rainbow-delimiters)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
