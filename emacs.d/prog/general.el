(require 'use-package)


(use-package flycheck
  :init (global-flycheck-mode))

;;; Repl togle
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

;;; langserver
(use-package lsp-mode
  :commands lsp
  :config (setq lsp-prefer-flymake nil))
(use-package lsp-ui
  :commands lsp-ui-mode
  :hook (lsp-mode-hook . lsp-ui-hook))
(use-package company-lsp
  :commands company-lsp
  :config (push 'company-lsp company-backends))
(use-package helm-lsp
  :straight (:repo "https://github.com/yyoncho/helm-lsp/"))
(use-package dap-mode ;; debug adapter protocol
  :config
  (progn
    (dap-mode 1)
    (dap-ui-mode 1)))

;;;
(add-hook 'prog-mode-hook
          (lambda ()
            (setq comment-auto-fill-only-comments t)
            (auto-fill-mode 1)))
