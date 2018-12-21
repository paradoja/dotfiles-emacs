(require 'use-package)
(use-package magit)
(require 'magit)
(require 'config-utils)

(global-set-key (kbd "C-,") 'magit-status)
(defvar magit-last-seen-setup-instructions "1.4.0")

(add-hook 'git-gutter:update-hooks 'magit-revert-buffer-hook)
(add-hook 'git-commit-mode-hook 'git-commit-turn-on-flyspell)

(use-packages
  git-link
  git-gutter
  forge
  git
  gitattributes-mode
  gitconfig-mode
  gitignore-mode)
