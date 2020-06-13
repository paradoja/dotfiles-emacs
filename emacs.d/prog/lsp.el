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

;; Use the Tree View Protocol for viewing the project structure and
;; triggering compilation
(use-package lsp-treemacs
  :after treemacs
  :config
  (setq lsp-metals-treeview-enable t)
  (setq lsp-metals-treeview-show-when-views-received t))

(use-package lsp-origami
  :hook (lsp-after-open . lsp-origami-try-enable))
