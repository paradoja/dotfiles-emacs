(require 'use-package)

(use-package pdf-tools)
(if (file-executable-p pdf-info-epdfinfo-program)
    (pdf-tools-install)
  (message "pdf-tools NOT installed (please install manually)"))
