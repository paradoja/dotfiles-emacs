(require 'use-package)

(require 'config-utils)

;;; fix for org-mode with straight.el
(load-emacs-conf-file "general/org-fix.el")

(load-configurations
 '(helm
   visuals
   exwm

   rest
   shortcuts)) ; rest & shortcuts should go last
