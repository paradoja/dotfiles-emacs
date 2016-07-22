(require 'use-package)
(use-package magit)
(require 'magit)

(global-set-key (kbd "C-,") 'magit-status)
(defvar magit-last-seen-setup-instructions "1.4.0")

(add-hook 'git-gutter:update-hooks 'magit-revert-buffer-hook)
