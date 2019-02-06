(require 'use-package)

(use-package lua-mode)
(use-package company-lua
  :config
  (add-to-list 'company-backends 'company-lua))
(use-package flymake-lua)

(use-package love-minor-mode)
