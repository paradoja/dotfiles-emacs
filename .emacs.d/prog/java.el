(require 'use-package)
(use-package emacs-eclim)

(require 'eclim)
(require 'eclimd)
(defvar eclim-possible-workspaces '("~/curro"))

(add-to-list 'eclim-eclipse-dirs "~/opt/eclipse")

(require 'f)
(require 'dash)
(let ((valid-paths (-filter #'f-exists?
                            eclim-possible-workspaces)))
  (when (not (null valid-paths))
    (setq-default eclimd-default-workspace
                  (car valid-paths))))

(require 'ac-emacs-eclim-source)

(require 'eclim-problems)
(defun eclim-start ()
  "Starts the eclim daemon and modes"
  (interactive)
  (ac-emacs-eclim-config)
  (start-eclimd eclimd-default-workspace)
  (global-eclim-mode))
