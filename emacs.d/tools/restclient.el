(require 'use-package)

(use-package restclient)
(use-package restclient-helm)

(use-package ob-restclient)
(org-babel-do-load-languages
 'org-babel-load-languages
 (append org-babel-load-languages
         '((restclient . t))))
