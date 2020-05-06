(require 'use-package)

(use-package zoom)
(use-package eyebrowse
  :config (setq eyebrowse-keymap-prefix (kbd "C-c C-e")))
(eyebrowse-mode t)
