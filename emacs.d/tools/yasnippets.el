(require 'use-package)
(use-package yasnippet)
(require 'yasnippet)

(add-to-list 'yas-snippet-dirs
             (f-join user-emacs-directory "tools/yasnippets/"))
(yas-global-mode 1)

(require 'use-package)

(use-package auto-yasnippet
  :bind (("<backtab> w" . aya-create)
         ("<backtab> y" . aya-expand)
         ("<backtab> o" . aya-open-line)))
