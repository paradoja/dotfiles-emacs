(require 'use-package)

(use-package projectile) ; further config in projectile config file
(use-package helm-projectile)

(use-package swiper-helm)

(use-package helm-ag)

(use-package helm-ls-git)

;;; authentication
(setq auth-sources
      '((:source "~/.authinfo.gpg")))

;;; "localization"
(setq calendar-date-display-form
      '((if dayname (concat dayname ", ")) day " " monthname " " year))

;;; Key combination changes
(use-package browse-kill-ring)
(general-def
  "C-w" 'backward-kill-word
  "C-x C-k" 'kill-region
  "RET" 'newline-and-indent)

;;; Improvements on help
(use-package helpful
  :general
  (:prefix
   "C-h"
   "f" #'helpful-callable
   "v" #'helpful-variable
   "k" #'helpful-key))

(use-package discover-my-major)
(global-set-key (kbd "C-h C-m") 'discover-my-major)

;;; General use
(use-package evil)
(use-package zone-nyan) ; Nyan cat zone

(use-package visual-regexp
  :config
  (setq vr/match-separator-string ">>")
  :general
  (:prefix
   "C-c r"
   "r" 'vr/replace
   "q" 'vr/query-replace
   "m" 'vr/mc-mark))
(use-package visual-regexp-steroids
  :after '('visual-regexp 'pcre2el)
  :config
  (let ((py (or (executable-find "python2")
                (executable-find "python")))
        (py-regexp (f-expand
                    (f-join user-emacs-directory
                            "straight"
                            "repos"
                            "visual-regexp-steroids.el"
                            "regexp.py"))))
    (if py
        (progn
          (setq vr/engine 'python
                vr/command-python
                (format "%s %s" py py-regexp)))
      (setq vr/engine 'pcre2el)))
  :general
  (:prefix
   "C-c r"
   "s" 'vr/isearch-forward
   "i" 'vr/isearch-backward)
  ("C-M-s" 'vr/isearch-forward
   "C-M-i" 'vr/isearch-backward))

(use-package iedit
  :general
  ("C-c i" 'iedit-mode))

;;; Server
(setenv "EDITOR" "/usr/bin/emacsclient")
(require 'server)
(unless(server-running-p)
  (server-start))

;;; Behaviour and editing changes
(use-package keyfreq
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1)
  (setq keyfreq-excluded-commands
        '(self-insert-command
          forward-char
          backward-char
          previous-line
          next-line)))

(require 'iso-transl)
(setq-default indent-tabs-mode nil) ; no tabs
(global-font-lock-mode 1)
(show-paren-mode)
(column-number-mode 1)
(add-hook 'before-save-hook 'delete-trailing-whitespace) ; no whitespace
(use-package undo-tree)
(global-undo-tree-mode)
(use-package key-chord)
(key-chord-mode 1)
(setq-default truncate-lines t)
(use-package expand-region)
(use-package alert
  :commands (alert)
  :init
  (setq alert-default-style 'notifications))
(use-package selectric-mode)

(use-package hydra)

(use-package company)
(add-hook 'after-init-hook 'global-company-mode)
(use-package company-quickhelp)
(company-quickhelp-mode t)

(cua-selection-mode t) ; Enhanced rectangle edition, global mark mode and easy register use
(setq-default cua-delete-selection nil)
(delete-selection-mode -1)
(winner-mode 1) ; C-c ←, C-c →
(setq visual-line-fringe-indicators ; Arrows in visual-line-mode
      '(left-curly-arrow right-curly-arrow))
(use-package guide-key)
(require 'guide-key)
(setq guide-key/guide-key-sequence t) ; Everything
(guide-key-mode 1)
(setq set-mark-command-repeat-pop t) ; C-u C-Space C-Space... C-Space

(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)


;;; Advanced commands
(put 'set-goal-column  'disabled nil); C-x C-n
(put 'narrow-to-region 'disabled nil); C-x n n
(put 'upcase-region    'disabled nil); C-x C-u;; M-u upcases word
(put 'downcase-region  'disabled nil); C-x C-l;; M-l downcases word
(put 'dired-find-alternate-file 'disabled nil); dired a
(use-package zone-nyan)

;;; Uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "|")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;;; Cambios en paquetes generales
(use-package ace-jump-mode)
(load-emacs-conf-file "general/key-chords")
