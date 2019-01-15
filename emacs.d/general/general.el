(require 'use-package)

;;; libraries
(use-package f)    ; Directory and file api
(use-package dash) ; Modern list library
(use-package dash-functional) ; combinators

;;; Custom conf.
(load (file-truename (f-join (f-dirname (f-this-file))
                             "config-utils")))

(require 'config-utils)

;;; fix for org-mode with straight.el
(load-file "~/.emacs.d/general/org-fix.el")

(load-configurations
 '(helm
   mode-line
   rest))
