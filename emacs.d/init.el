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

;;; Custom conf.
(mapc
 (lambda (filename)
   (load (concat user-emacs-directory "general/" filename ".el")))
 '("general-libraries" "config-utils"))

;;; Cosas generales
(load-emacs-conf-file "general/general.el")

;;; Programas, herramientas y aplicaciones
(load-emacs-conf-file "tools/tools.el")

;;; Programación, lenguajes y herramientas
(load-emacs-conf-file "prog/prog.el")

;;; Cosas específicas de algunos sistemas
(load-emacs-conf-file "pers/pers.el")
