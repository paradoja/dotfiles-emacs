(require 'use-package)

(use-package helm-flyspell)

(ispell-change-dictionary "en_GB" t) ; default dict

(define-key global-map (kbd "C-.") 'helm-flyspell-correct)
(define-key flyspell-mode-map (kbd "C-.") 'helm-flyspell-correct)
(define-key flyspell-mode-map (kbd "C-M-i") 'helm-flyspell-correct)
(define-key flyspell-mode-map (kbd "C-,") nil)
(define-key flyspell-mode-map (kbd "C-M-,") 'flyspell-goto-next-error)
