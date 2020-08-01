(require 'use-package)

(requirements-add
 agda.el
 (agda
  (executable-find "agda-mode")
  "Agda"
  "https://github.com/agda/agda"
  "Check docs"))

(when (executable-find "agda-mode")
  (load-file (let ((coding-system-for-read 'utf-8))
                      (shell-command-to-string "agda-mode locate"))))

(setq auto-mode-alist
   (append
     '(("\\.agda\\'" . agda2-mode)
       ("\\.lagda.md\\'" . agda2-mode))
     auto-mode-alist))
