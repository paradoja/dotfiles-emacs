(require 'use-package)

(requirements-add
 pdf.el
 (imagemagick
  (executable-find "convert")
  "Imagemagick"
  "https://imagemagick.org/index.php")
 (pdf-tools-server
  (file-executable-p pdf-info-epdfinfo-program)
  "PDF tools server
   (pdf-tools-install)"
  "https://github.com/politza/pdf-tools"))

(use-package pdf-tools)
