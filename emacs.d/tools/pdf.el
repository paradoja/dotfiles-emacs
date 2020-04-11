(require 'use-package)

;; requirements
;; poppler and imagemagick

(use-package pdf-tools)
(if (file-executable-p pdf-info-epdfinfo-program)
    (pdf-tools-install)
  ;; ⤴ execute to install too
  (message "pdf-tools NOT installed (to install please visit %s)"
           buffer-file-name))
