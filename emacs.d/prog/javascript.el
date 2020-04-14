(require 'use-package)

;; requirements
;; tsun for typescript interpreter


;; typescript

(use-package typescript-mode
  :config
  (progn
    (require 'ansi-color)
    (add-hook 'compilation-filter-hook
              (lambda ()
                (ansi-color-apply-on-region
                 compilation-filter-start (point-max))))))

(use-package ts-comint
  :after (repl-toggle typescript-mode)
  :general
  (typescript-mode-map
   "C-x C-e"  'ts-send-last-sexp
   "C-M-x"    'ts-send-last-sexp-and-go
   "C-c b"    'ts-send-buffer
   "C-c C-b"  'ts-send-buffer-and-go
   "C-c l"    'ts-load-file-and-go)
  :config
  (push '(typescript-mode . run-ts) rtog/mode-repl-alist))

;; ide

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :config
  (setq company-tooltip-align-annotations t)
  :hook ((typescript-mode . setup-tide-mode)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))
