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
(use-package feature-mode)

(use-package highlight-indentation)
(use-package vline)


;; TODO: allow use of this + (or besides) helm
(use-package wgrep)
(use-package wgrep-ag)

;;; Ediff
(setq-default ediff-window-setup-function 'ediff-setup-windows-plain)
(setq-default ediff-split-window-function 'split-window-horizontally)
(setq-default ediff-auto-refine 'on)

;;; Lisps
(use-package paredit)


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
(use-package treemacs-icons-dired) ; this is for dired


;;;
(add-hook 'prog-mode-hook
          (lambda ()
            (setq-mode-local comment-auto-fill-only-comments t)))
(auto-fill-mode 1)

;;; autoformatter
(use-package format-all)

;;; origamy / code folder
(use-package origami
  :general
  (lsp-mode-map
   :prefix "C-c C-l o"
   "t" 'origami-recursively-toggle-node
   "o" 'origami-show-only-node
   "u" 'origami-undo
   "r" 'origami-redo
   "a" 'origami-open-all-nodes
   "O" 'origami-open-node-recursively
   "c" 'origami-close-node-recursively))
(global-origami-mode)
