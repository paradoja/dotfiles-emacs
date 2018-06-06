(require 'use-package)

(use-package rust-mode
  :mode "\\.rs\\'")
(use-package flycheck-rust)
(use-package racer
  :config
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  (add-hook 'rust-mode-hook #'aggressive-indent-mode))

; (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
; (setq company-tooltip-align-annotations t)
