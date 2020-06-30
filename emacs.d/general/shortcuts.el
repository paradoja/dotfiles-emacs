(require 'hydra)
(require 'f)

(defun shortcuts/open-emacs-path (&rest file)
  (find-file (apply #'f-join user-emacs-directory file)))

(defun shortcuts/open-org-path (&rest file)
  (find-file (apply #'f-join org-directory file)))

(defhydra hydra-shortcuts (global-map "C-c C-f"
                                      :color blue)
  ("e" hydra-shortcuts/emacs/body "emacs")
  ("o" hydra-shortcuts/org/body "org")
  ("s" hydra-shortcuts/scratch "scratch")
  ("d" hydra-shortcuts/dotfiles/body "dotfiles"))

(defun hydra-shortcuts/scratch (arg)
  (interactive "P")
  (switch-to-buffer "*scratch*")
  (if arg
      (delete-other-windows)))

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

(eval-and-compile
  (let* ((dirs (mapcar #'f-slash (f-directories (f-join (getenv "HOME") "dotfiles"))))
         (options (mapcar (lambda (p)
                            (let ((name (f-filename p)))
                              (list
                               ;; TODO: avoid repetitions
                               (substring name 0 1)
                               `(let ((default-directory ,p))
                                  (helm-projectile-find-file))
                               name)))
                          dirs)))
    (eval `(defhydra hydra-shortcuts/dotfiles (:color blue)
             ,@options))))
