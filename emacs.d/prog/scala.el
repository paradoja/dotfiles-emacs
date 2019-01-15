(use-package scala-mode
  :config
  (add-hook 'scala-mode-hook #'aggressive-indent-mode))

(straight-use-package 'ensime :branch "2.0")
(use-package ensime
  :config
  (progn (setq ensime-startup-notification nil
             ;;; TODO check following vars
               ensime-startup-snapshot-notification nil
               ensime-use-helm t)))
