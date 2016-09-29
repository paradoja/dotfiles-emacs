(require 'use-package)

(use-package helm-flyspell)

(define-key flyspell-mode-map (kbd "C-.") 'helm-flyspell-correct)
(define-key flyspell-mode-map (kbd "C-M-i") 'helm-flyspell-correct)
(define-key flyspell-mode-map (kbd "C-,") nil)
(define-key flyspell-mode-map (kbd "C-M-,") 'flyspell-goto-next-error)
