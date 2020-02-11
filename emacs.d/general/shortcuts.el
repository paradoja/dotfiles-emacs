(require 'hydra)

(defun shortcuts/open-emacs-path (&rest file)
  (find-file (apply #'f-join user-emacs-directory file)))

(defun shortcuts/open-org-path (&rest file)
  (find-file (apply #'f-join org-directory file)))

(defhydra hydra-shortcuts (global-map "C-c C-f"
                                      :color blue)
  ("e" hydra-shortcuts/emacs/body "emacs")
  ("o" hydra-shortcuts/org/body "org"))

(defhydra hydra-shortcuts/emacs (:color blue)
  ("i" (shortcuts/open-emacs-path "init.el") "init.el")
  ("g" (shortcuts/open-emacs-path "general" "general.el") "general.el")
  ("p" (shortcuts/open-emacs-path "prog" "prog.el") "prog.el")
  ("t" (shortcuts/open-emacs-path "tools" "tools.el") "tools.el")
  ("o" (shortcuts/open-emacs-path "tools" "org-mode.el") "org-mode.el"))

;; TODO: maybe have this dependent on the org structure itself?
(defhydra hydra-shortcuts/org (:color blue)
  ("m" (shortcuts/open-org-path "main" "main.org") "main.org")
  ("g" (shortcuts/open-org-path "main" "global.trello") "global.trello")
  ("t" (shortcuts/open-org-path "main" "thematic.org") "thematic.org")
  ("p" (shortcuts/open-org-path "main" "periodic.org") "periodic.org")
  ("c" (shortcuts/open-org-path "main" "chores.org") "chores.el")
  ("e" (shortcuts/open-org-path "main" "emacs.org") "emacs.org"))
