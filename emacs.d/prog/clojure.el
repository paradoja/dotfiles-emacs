(require 'use-package)

(requirements-add
 clojure.el
 (lein
  (executable-find "lein")
  "Leiningen"
  "https://github.com/technomancy/leiningen")
 (clojure-lsp
  (executable-find "clojure-lsp")
  "Clojure LSP"
  "https://github.com/technomancy/leiningen"))

(use-package clojure-mode
  :hook
  (((clojure-mode
     clojurec-mode
     clojurescipt-mode) . lsp)
   ((clojure-mode
     clojurec-mode
     clojurescipt-mode) . paredit-mode))
  :config
  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode))
    (add-to-list 'lsp-language-id-configuration `(,m . "clojure")))
  (setq lsp-enable-indentation nil
        lsp-clojure-server-command '("bash" "-c" "clojure-lsp")))

(use-package cider
  :hook
  (cider-mode . eldoc-mode))


(use-package clj-refactor
  :hook
  (clojure-mode .
                (lambda ()
                  (clj-refactor-mode 1)
                  (cljr-add-keybindings-with-prefix "C-c C-m"))))

;; ;; highlight expression on eval
;; (require 'highlight)
;; (require 'nrepl-eval-sexp-fu)
;; (setq nrepl-eval-sexp-fu-flash-duration 0.5)
