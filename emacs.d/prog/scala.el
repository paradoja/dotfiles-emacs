(require 'use-package)

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


(use-package lsp-scala
  :straight (:repo "https://github.com/rossabaker/lsp-scala")
  :after scala-mode
  :demand t
  :hook (scala-mode . lsp)
  :init (setq lsp-scala-server-command "~/bin/metals-emacs"))

(use-package sbt-mode
  :commands sbt-start sbt-command)
