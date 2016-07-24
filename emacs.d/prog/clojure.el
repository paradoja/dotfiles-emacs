(require 'use-package)

(use-package clojure-mode
  :init
  (add-hook 'clojure-mode-hook
            (lambda () (paredit-mode +1))))

(use-package cider
  :init
  (add-hook 'cider-mode-hook #'eldoc-mode))


(use-package ac-cider)



;; ;; highlight expression on eval
;; (require 'highlight)
;; (require 'nrepl-eval-sexp-fu)
;; (setq nrepl-eval-sexp-fu-flash-duration 0.5)
