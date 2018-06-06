(require 'use-package)

(use-package scala-mode
  :config
  (add-hook 'scala-mode-hook #'aggressive-indent-mode))
(use-package ensime
  :ensure t
  :config
  (progn (setq ensime-startup-notification nil
               ensime-startup-snapshot-notification nil
               ensime-use-helm t)))
