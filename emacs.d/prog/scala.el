(require 'use-package)

(use-package ensime
  :ensure t
  :config (setq ensime-startup-notification nil
                ensime-startup-snapshot-notification nil
                ensime-use-helm t))
