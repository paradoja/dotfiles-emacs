(require 'use-package)

(use-package helm)
(require 'helm-config)

(require 'helm)
(require 'helm-mode)
;; help from http://tuhdo.github.io/helm-intro.html
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "C-c h") 'helm-command-prefix)

(global-unset-key (kbd "C-z"))
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(setq helm-split-window-inside-p            nil ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line        t)

;; (setq helm-autoresize-max-height 0)
;; (setq helm-autoresize-min-height 20)
;; (helm-autoresize-mode 1)

(setq helm-completion-in-region-fuzzy-match t)
(helm-mode 1)


;; Other helm things

(use-package helm)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-M-y") 'helm-show-kill-ring)

(global-set-key (kbd "M-s o") 'helm-occur)

(global-set-key (kbd "C-c SPC") 'helm-all-mark-rings)

(global-set-key (kbd "C-c h M-:") 'helm-eval-expression-with-eldoc)

(define-key minibuffer-local-map (kbd "C-c C-l") 'helm-minibuffer-history)

;; Other changes
(global-set-key "\C-x\C-f" 'helm-find-files)
(global-set-key (kbd "C-c C-o") 'helm-occur) ; tb. M-s o durante isearch
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(define-key global-map (kbd "C-c C-s") 'swiper-helm)

;;; M-x
(global-set-key "\M-x" 'helm-M-x)
(global-set-key "\C-xm" 'helm-M-x)
(global-set-key "\C-x\C-m" 'helm-M-x)
(setq helm-move-to-line-cycle-in-source nil) ; allow to scroll through the M-x list
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ; M-x estándar
