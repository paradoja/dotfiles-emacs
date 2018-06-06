(require 'use-package)

(use-package repl-toggle
  :init
  (setq rtog/fullscreen t)
  :config
  (setq rtog/mode-repl-alist '()))

;;; Indentation
(defun pdox-new-line-and-indent (&optional arg)
  (interactive "p")
  (newline arg)
  (indent-according-to-mode))

(use-package aggressive-indent)
;; (global-aggressive-indent-mode 1)
;; (add-to-list 'aggressive-indent-excluded-modes 'html-mode)

(use-package haml-mode)
(use-package yaml-mode)
(use-package highlight-indentation)

(use-package feature-mode)

;; TODO: allow use of this + (or besides) helm
(use-package wgrep)
(use-package wgrep-ag)

;;; Ediff
(setq-default ediff-window-setup-function 'ediff-setup-windows-plain)
(setq-default ediff-split-window-function 'split-window-horizontally)
(setq-default ediff-auto-refine 'on)

;;; Lisps
(use-package paredit)
(use-package rainbow-delimiters)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
