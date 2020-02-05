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
  ;; Maybe this shouldn't be here?
  (setq org-pretty-tags-surrogate-strings
        (append org-pretty-tags-surrogate-strings
                '(("sky" . "Non-fiction")
                  ("blue" . "Fiction")
                  ("green" . "UOC")
                  ("orange" . "Tech")
                  ("red" . "Science/Maths")
                  ("purple" . "Creative")
                  ("yellow" . "Exercise"))))
  :hook
  org-pretty-tags-global-mode
  (org-mode .
            (lambda ()
              (let ((filename (buffer-file-name (current-buffer))))
                (when (and filename (string= "trello" (file-name-extension filename)))
                  (org-trello-mode)))))
  :custom
  (org-trello-files
   (list (f-join org-directory "main" "global.trello")))
  (org-trello-current-prefix-keybinding "C-c t")
  :mode
  ("\\.trello$" . org-mode))
