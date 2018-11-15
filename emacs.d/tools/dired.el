(require 'use-package)

(use-package dired-filter)
(use-package dired-subtree)
(use-package dired-narrow)
(use-package direx)

(setq dired-omit-mode t)
(define-key dired-mode-map (kbd "C-c C-d i") 'dired-subtree-insert)
(define-key dired-mode-map (kbd "C-c C-d C-i") 'dired-subtree-insert)
(define-key dired-mode-map (kbd "C-c C-d -") 'dired-subtree-remove)
(define-key dired-mode-map (kbd "C-c C-d o") 'dired-subtree-remove)
(define-key dired-mode-map (kbd "C-c C-d C-o") 'dired-subtree-remove)
(define-key dired-mode-map (kbd "C-c C-d x") 'direx:jump-to-directory)

(require 'projectile)
(define-key projectile-mode-map (kbd "C-c p d") 'direx-project:jump-to-project-root)
