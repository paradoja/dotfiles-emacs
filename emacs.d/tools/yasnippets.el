(require 'use-package)
(use-package yasnippet)
(use-package yasnippet-snippets)

(add-to-list 'yas-snippet-dirs
             (f-join user-emacs-directory "tools/yasnippets/"))
(yas-global-mode 1)

(use-package auto-yasnippet
  :general
  (:prefix "C-c y"
           "c" 'aya-create
           "e" 'aya-expand
           "o" 'aya-open-line
           "p" 'aya-persist-snippet))
