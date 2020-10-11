(require 'use-package)

(use-package evil
  :config
  (setq evil-default-state 'emacs))

(use-package evil-magit
  :after magit)

(use-package evil-org
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package evil-lispy)

(use-package evil-mc)

(use-package evil-snipe
  :hook
  (magit-mode-hook . 'turn-off-evil-snipe-override-mode))
