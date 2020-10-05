(require 'use-package)

(requirements-add
 spelling-check.el
 ((executable-find "aspell")
  "Aspell"
  "http://aspell.net/"))

(let ((shell-aspell-conf (shell-command-to-string "echo -n $ASPELL_CONF")))
  (if (and (not (getenv "ASPELL_CONF"))
           (not (string= "" shell-aspell-conf)))
     (setenv "ASPELL_CONF" shell-aspell-conf)))

(use-package helm-flyspell)

(ispell-change-dictionary "british" t) ; default dict

(define-key global-map (kbd "C-.") 'helm-flyspell-correct)
(define-key flyspell-mode-map (kbd "C-.") 'helm-flyspell-correct)
(define-key flyspell-mode-map (kbd "C-M-i") 'helm-flyspell-correct)
(define-key flyspell-mode-map (kbd "C-,") nil)
(define-key flyspell-mode-map (kbd "C-M-,") 'flyspell-goto-next-error)
