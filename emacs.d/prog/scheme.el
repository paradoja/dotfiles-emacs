(use-package geiser
  :config
  (setq geiser-active-implementations '(chez racket guile))
  (setq geiser-default-implementation 'chez))

(use-package ac-geiser
  :after geiser)
