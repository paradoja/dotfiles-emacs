(use-package reftex
  :hook
  (markdown-mode .
                 (lambda ()
                   (setq-local reftex-cite-format
                               "[@%l]")))
  (markdown-mode .
                 (lambda ()
                   (when reftex-default-bibliography
                              (reftex-mode)))))
;; variable reftex-default-bibliography is a list of bibliography
;; files
