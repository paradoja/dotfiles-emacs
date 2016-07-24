(require 'use-package)

;;; Custom conf.
(require 'f)
(load (file-truename (f-join (f-dirname (f-this-file))
                             "config-utils")))
(defconst custom-file (file-truename "custom"))
(load custom-file 'noerror)

;;; Cambios de configuraciones de teclas
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-x\C-f" 'helm-find-files)
(global-set-key "\M-x" 'helm-M-x)
(global-set-key "\C-xm" 'helm-M-x)
(global-set-key "\C-x\C-m" 'helm-M-x)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ; M-x estándar
(global-set-key (kbd "C-c C-o") 'helm-occur) ; tb. M-s o durante isearch
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(define-key global-map (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-h C-m") 'discover-my-major)
(use-package helm) ; TODO move to helm conf?
(use-package helm-projectile)
(use-package helm-ag)
(use-package helm-ls-git)
(use-package swiper-helm)
(require 'helm-mode)
(setq helm-completion-in-region-fuzzy-match t)
(helm-mode 1)
(use-package visual-regexp)
(require 'visual-regexp)
(setq vr/match-separator-string ">>")
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
(define-key global-map (kbd "C-c m") 'vr/mc-mark)
(use-package iedit)
(define-key global-map (kbd "C-c i") 'iedit-mode)
(define-key global-map (kbd "C-s") 'swiper-helm)

;;; Servidor
(setenv "EDITOR" "/usr/bin/emacsclient")

;;; Cambios específicos propios de comportamiento y edición
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
(use-package auto-complete)
(global-auto-complete-mode 1)
; Enhanced rectangle edition, global mark mode and easy register use
(cua-selection-mode t)
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

;; Automáticamente marcar como ejecutable scripts
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;;; Cambios visuales
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq custom-theme-directory "~/.emacs.d/themes/")
(load-theme 'tango-2-modified t)
; (set-default-font "Inconsolata-13")
(set-frame-font "Ubuntu Mono-13")
(set-fontset-font
 t 'symbol
 (font-spec :family "Symbola") nil 'prepend) ; emojis!

;;; Dired + similar
(require 'dired-x)
(setq dired-omit-mode t)
(define-key dired-mode-map (kbd "C-c C-d i") 'dired-subtree-insert)
(define-key dired-mode-map (kbd "C-c C-d C-i") 'dired-subtree-insert)
(define-key dired-mode-map (kbd "C-c C-d -") 'dired-subtree-remove)
(define-key dired-mode-map (kbd "C-c C-d o") 'dired-subtree-remove)
(define-key dired-mode-map (kbd "C-c C-d C-o") 'dired-subtree-remove)
(define-key dired-mode-map (kbd "C-c C-d x") 'direx:jump-to-directory)
(require 'projectile)
(define-key projectile-mode-map (kbd "C-c p x") 'direx-project:jump-to-project-root)

;;; Comandos avanzados habilitados
(put 'set-goal-column  'disabled nil); C-x C-n
(put 'narrow-to-region 'disabled nil); C-x n n
(put 'upcase-region    'disabled nil); C-x C-u;; M-u upcases word
(put 'downcase-region  'disabled nil); C-x C-l;; M-l downcases word
(put 'dired-find-alternate-file 'disabled nil); dired a

;;; Uniquify, cambios en cómo mostrar los buffers http://trey-jackson.blogspot.com.es/2008/01/emacs-tip-11-uniquify.html
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "|")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;;; Smart Mode Line
(use-package smart-mode-line)
(require 'smart-mode-line)
(require 'smart-mode-line-dark-theme)
(sml/setup)
;; I prefer to invert the colour scheme
(sml/apply-theme 'dark)
(custom-theme-set-faces
 'smart-mode-line-dark
 '(mode-line ((t :foreground "gray60" :background "#404045")))
 '(mode-line-inactive     ((t :foreground "gray60" :background "black"))))
(add-to-list 'sml/replacer-regexp-list '("^~/.homesick/repos/emacs-files.git/home/.emacs.d/" ":ED:"))
(mapc (lambda (mode)
        (add-to-list 'sml/hidden-modes (format " %s" mode)))
      (list "Paredit"    ; paredit-mode
            "FlyC"       ; flycheck-mode
            "Undo-Tree"  ; undo-tree-mode
            "AC"         ; auto-complete-mode
            "yas"        ; yas/minor-mode
            "rt"         ; ruby-tools-mode
            "REl"        ; ruby-electric-mode
            "Guide"      ; guide-key-mode
            "Helm"       ; helm
            ))
(setq-default sml/col-number-format  "%3l")
(setq-default sml/line-number-format "%3l")
(setq-default sml/numbers-separator  "")
(setq-default sml/col-number-format  "%3c")

;;; Cambios en paquetes generales
(use-package ace-jump-mode)
(load "~/.emacs.d/general/key-chords")
(load "~/.emacs.d/general/browse-kill-ring")

(global-set-key "\C-\M-y" 'custom-yank-pop)
