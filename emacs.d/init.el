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

;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-trello-current-prefix-keybinding "C-c o")
 '(safe-local-variable-values
   (quote
    ((ispell-dictionary . "es")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 89)) (:foreground "#d3d3d3" :background "#000000")))))
