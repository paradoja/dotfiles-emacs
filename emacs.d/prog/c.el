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
                        'pdox-new-line-and-indent)))))
      (list 'c 'c++))

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

;; Requires clang & cmake
(use-package irony
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

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
(require 'company-rtags)

(eval-after-load 'company
  '(add-to-list
    'company-backends 'company-rtags))

(require 'rtags-helm)
(setq rtags-use-helm t)
