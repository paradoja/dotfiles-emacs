(require 'use-package)


(use-package org-trello
  :config
  (setq org-trello--config-dir
        (f-join user-emacs-directory "tools" "trello")
        org-trello--config-file
        (f-join user-emacs-directory "tools" "trello" "%s.el"))
  :custom
  (org-trello-files
   (list (f-join org-directory "main" "trello.org"))
   org-trello con))
