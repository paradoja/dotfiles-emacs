(require 'use-package)

;;;;;;;;;;;;;;;;
;; doom-modeline

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

;; Minions
(use-package minions
  :config (minions-mode 1))


;;;;;;;;;;;;;;;;
;; Theme

(use-package cyberpunk-theme)
(load-theme 'cyberpunk t)

(use-package rainbow-delimiters
  :hook
  (prog-mode-hook . rainbow-delimiters-mode)
  :config
  (-dotimes 9
    (lambda (index)
      (let ((step (/ 255 9)))
        (set-face-foreground
         (intern (concat "rainbow-delimiters-depth-" (number-to-string (1+ index)) "-face"))
         (format "#%02x%02x%02x"
                 (- 255 (* index step))
                 (- 255 (* index step))
                 (* index step)))))))

;;;;;;;;;;;;;;;;
;; Solaire

(use-package solaire-mode
  :hook
  ((change-major-mode after-revert ediff-prepare-buffer) . turn-on-solaire-mode)
  :init
  (solaire-global-mode +1)
  :config
  (progn
    (add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer)
    (defvar have-we-swapped-solaire-yet-p nil
      "Stores whether we have called the solaire mode swap to
       make calling this file idempotent")
    (if (not have-we-swapped-solaire-yet-p)
        (progn
          (setq have-we-swapped-solaire-yet-p 't)
          (solaire-mode-swap-bg)))))

;;;;;;;;;;;;;;;;
;; Other
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(set-frame-font "Ubuntu Mono-14" t t)
(use-package emojify)
