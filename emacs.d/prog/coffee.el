(use-package coffee-mode
  :config
  (setq coffee-tab-width 2)
  (add-hook 'coffee-mode-hook #'aggressive-indent-mode))
