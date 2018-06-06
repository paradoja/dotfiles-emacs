(require 'use-package)

(mapc (lambda (language)
        (let ((language-mode (intern (concat (symbol-name language) "-mode-hook"))))
          (add-hook language-mode
                    '(lambda ()
                       (c-set-style "stroustrup")
                       (c-toggle-hungry-state 1)
                       (set-default c-auto-newline 1)
                       (auto-fill-mode 1)
                       (define-key c-mode-map (kbd "<return>")
                       'pdox-new-line-and-indent))
          (add-hook language-mode #'aggressive-indent-mode)))
      (list 'c 'c++))

;; Requires clang & cmake
(use-package irony
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))


(use-package company-irony
  :config
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-irony)))

(use-package flycheck-irony
  :config
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))

(use-package irony-eldoc
  :config
  (add-hook 'irony-mode-hook 'irony-eldoc))

(use-package rtags
  :config
  (setq rtags-completions-enabled t)
  (setq rtags-autostart-diagnostics t)
  (rtags-enable-standard-keybindings))

(use-package company-rtags
  :config
  (eval-after-load 'company
    '(add-to-list
      'company-backends 'company-rtags)))

(use-package rtags)
(use-package helm-rtags
  :config
  (setq rtags-use-helm t))
