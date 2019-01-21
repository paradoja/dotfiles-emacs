(require 'use-package)

(require 'config-utils)

;;; fix for org-mode with straight.el
(load-emacs-conf-file "general/org-fix.el")

(load-configurations
 '(helm
   visuals
   rest)) ; rest should go last
