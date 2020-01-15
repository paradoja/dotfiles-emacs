(require 'use-package)

(use-package clojure-mode
  :init
  (add-hook 'clojure-mode-hook
            (lambda () (paredit-mode +1)))
  (add-hook 'clojure-mode-hook
            #'aggressive-indent-mode))

(use-package cider
  :init
  (add-hook 'cider-mode-hook #'eldoc-mode))

(use-package clj-refactor)

;; ;; highlight expression on eval
;; (require 'highlight)
;; (require 'nrepl-eval-sexp-fu)
;; (setq nrepl-eval-sexp-fu-flash-duration 0.5)
