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
  :config (setq lsp-prefer-flymake nil)
  :hook (lsp-mode . lsp-lens-mode))
(use-package lsp-ui
  :commands lsp-ui-mode
  :hook (lsp-mode-hook . lsp-ui-hook))
(use-package company-lsp
  :commands company-lsp
  :config (push 'company-lsp company-backends))
(use-package helm-lsp
  :straight (:repo "https://github.com/yyoncho/helm-lsp/"))

;;; DAP ;; debug adapter protocol

;;;; Posframe is a pop-up tool that must be manually installed for dap-mode
(use-package posframe)
(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode)
  :config
  (progn
    (dap-mode 1)
    (dap-ui-mode 1)))

;; Use the Tree View Protocol for viewing the project structure and triggering compilation
(use-package lsp-treemacs
  :config
  (lsp-metals-treeview-enable t)
  (setq lsp-metals-treeview-show-when-views-received t))

;;;
(add-hook 'prog-mode-hook
          (lambda ()
            (setq-mode-local comment-auto-fill-only-comments t)))
(auto-fill-mode 1)
