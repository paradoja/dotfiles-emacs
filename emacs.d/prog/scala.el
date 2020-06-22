(require 'use-package)

(requirements-add
 scala.el
 (metals
  (executable-find "metals-emacs")
  "Metals (scala)"
  "https://github.com/scalameta/metals"
  "# check https://scalameta.org/metals/docs/editors/emacs.html"))

(use-package scala-mode
  :mode "\\.s\\(cala\\|bt\\)$")

(use-package lsp-scala
  :after scala-mode
  :demand t
  :hook (scala-mode . lsp)
  :init (setq lsp-scala-server-command (executable-find "metals-emacs")))

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)
  ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
  (setq sbt:program-options '("-Dsbt.supershell=false")))
