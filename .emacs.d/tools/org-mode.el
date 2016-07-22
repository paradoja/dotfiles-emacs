(require 'use-package)

(require 'org)
(use-package ox-gfm)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (ruby . t)
   (ditaa . t)
   (plantuml . t)
   (sh . t)))

; Key map changes
(define-key org-mode-map (kbd "C-,") 'magit-status)

; Source blocks
(setq-default org-confirm-babel-evaluate nil)
(setq org-src-fontify-natively t) ; set up syntax highlighting in source blocks

; Diagrams
(setq-default org-ditaa-jar-path (locate-file "ditaa" exec-path '("" ".jar")))
(setq-default org-plantuml-jar-path (locate-file "plantuml" exec-path '("" ".jar")))
