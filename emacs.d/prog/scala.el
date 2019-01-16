(use-package scala-mode
  :config
  (add-hook 'scala-mode-hook #'aggressive-indent-mode))

(use-package ensime
  :straight (:repo "https://github.com/ensime/ensime-emacs" :branch "2.0")
  :config
  (progn (setq ensime-startup-notification nil
             ;;; TODO check following vars
               ensime-startup-snapshot-notification nil
               ensime-use-helm t)))
