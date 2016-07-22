(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

; While I am using Cask
(if (file-exists-p "~/.cask/cask.el")
    (require 'cask "~/.cask/cask.el")
  (require 'cask "/usr/local/share/emacs/site-lisp/cask.el"))
(cask-initialize)

(setq standard-emacs-dir (file-name-as-directory "~/.emacs.d/"))

;;; Cosas generales
(load-file "~/.emacs.d/general/general.el")

;;; Programas, herramientas y aplicaciones
(load-file "~/.emacs.d/tools/tools.el")

;;; Programación, lenguajes y herramientos
(load-file "~/.emacs.d/prog/prog.el")

;;; Cosas específicas de algunos sistemas
(load-file "~/.emacs.d/pers/pers.el")
