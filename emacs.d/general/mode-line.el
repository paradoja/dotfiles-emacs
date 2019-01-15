(require 'use-package)
(use-package doom-modeline
  :defer t
  :hook (after-init . doom-modeline-init))

;; Themes
(use-package doom-themes)

;;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)
;;; or for treemacs users
(doom-themes-treemacs-config)

;;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; Solaire
(use-package solaire-mode
  :hook ((change-major-mode after-revert ediff-prepare-buffer) . turn-on-solaire-mode)
  :config
  (add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer)
  (progn
    (defvar have-we-swapped-solaire-yet-p nil
      "Stores whether we have called the solaire mode swap to
       make calling this file idempotent")
    (if (not have-we-swapped-solaire-yet-p)
        (progn
          (setq have-we-swapped-solaire-yet-p 't)
          (solaire-mode-swap-bg)))))

;; Minions
(use-package minions
  :config (minions-mode 1))
