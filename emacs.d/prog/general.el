(require 'use-package)


;; TAGS
(setq tags-revert-without-query t) ; emacs a bit less annoying with
                                   ; tags, but can be problematic on
                                   ; big projects

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
(setq lsp-keymap-prefix "C-c C-l")
(use-package lsp-mode
  :commands lsp
  :config (setq lsp-prefer-flymake nil))
(use-package lsp-ui
  :commands lsp-ui-mode
  :hook (lsp-mode-hook . lsp-ui-hook)
  :config
  (setq lsp-ui-sideline-show-hover t
        lsp-ui-sideline-delay 0.1
        lsp-ui-doc-position 'top
        lsp-ui-doc-delay 0.1
        lsp-ui-doc-use-webkit nil))
(use-package company-lsp
  :commands company-lsp
  :config (push 'company-lsp company-backends))
(use-package helm-lsp)

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

(use-package treemacs
  :config
  (treemacs-git-mode 'extended)
  (with-eval-after-load 'treemacs
    (add-to-list 'treemacs-pre-file-insert-predicates #'treemacs-is-file-git-ignored?)))
(use-package treemacs-projectile)
(use-package treemacs-magit)
(use-package treemacs-icons-dired) ; this is more for dired

;; Use the Tree View Protocol for viewing the project structure and triggering compilation
(use-package lsp-treemacs
  :after treemacs
  :config
  (lsp-metals-treeview-enable t)
  (setq lsp-metals-treeview-show-when-views-received t))

;;;
(add-hook 'prog-mode-hook
          (lambda ()
            (setq-mode-local comment-auto-fill-only-comments t)))
(auto-fill-mode 1)

;;; autoformatter
(use-package format-all)

;;; origamy / code folder
(use-package origami)
