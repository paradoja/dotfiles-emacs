(require 'use-package)


(use-package org-trello
  :config
  (setq org-trello--config-dir
        (f-join user-emacs-directory "tools" "trello")
        ;; normally `org-trello-config-file` will depend on the
        ;; username (with a placeholder `%s`), but that's not the case
        ;; here
        org-trello--config-file
        (f-join user-emacs-directory "tools" "trello" "conf.el"))
  :custom
  (org-trello-files
   (list (f-join org-directory "main" "trello.org"))
   org-trello con))
