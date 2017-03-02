(require 'use-package)

(use-package plantuml-mode)
(use-package flycheck-plantuml
  :config
  (with-eval-after-load 'flycheck
    (require 'flycheck-plantuml)
    (flycheck-plantuml-setup))
  (progn
    (require 'dash)
    (require 'f)
    (setq plantuml-jar-path (-first #'file-exists-p
                                    (mapcar (lambda (p) (f-join p "plantuml.jar"))
                                            (list "/usr/share/plantuml"
                                                  (getenv "HOME")))))))
