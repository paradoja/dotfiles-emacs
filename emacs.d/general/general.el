(use-package use-package)

;;; libraries
(use-package f)    ; Directory and file api
(use-package dash) ; Modern list library
(use-package dash-functional) ; combinators

;;; Custom conf.
(load (file-truename (f-join (f-dirname (f-this-file))
                             "config-utils")))
(defconst custom-file (file-truename "custom"))
(load custom-file 'noerror)

(require 'config-utils)
(load-configurations
 '(helm
   rest))
