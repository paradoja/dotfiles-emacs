(require 'use-package)

;; requirements below

(use-package pdf-tools)

(requirements-add
 pdf.el
 (imagemagick
  (executable-find "convert")
  "Imagemagick"
  "https://imagemagick.org/index.php"
  "nix-env -i imagemagick")
 (pdf-tools-server
  (file-executable-p pdf-info-epdfinfo-program)
  "PDF tools server"
  "https://github.com/politza/pdf-tools"
  "emacs --eval '(pdf-tools-install)'"))
