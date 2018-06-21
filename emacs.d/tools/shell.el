;;;; eshell

(require 'eshell)
(require 'helm-eshell)

(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "C-c C-l")  'helm-eshell-history)))


;;;; M-x shell

(require 'shell)

(define-key shell-mode-map (kbd "C-c C-l") 'helm-comint-input-ring)
