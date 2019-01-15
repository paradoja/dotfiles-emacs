(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(require 'package)
(setq package-enable-at-startup nil)

;; Bootstrap `use-package'
(straight-use-package 'use-package)

(require 'straight)
(setq straight-use-package-by-default t)

;;; Cosas generales
(load-file "~/.emacs.d/general/general.el")

;;; Programas, herramientas y aplicaciones
(load-file "~/.emacs.d/tools/tools.el")

;;; Programación, lenguajes y herramientos
(load-file "~/.emacs.d/prog/prog.el")

;;; Cosas específicas de algunos sistemas
(load-file "~/.emacs.d/pers/pers.el")
