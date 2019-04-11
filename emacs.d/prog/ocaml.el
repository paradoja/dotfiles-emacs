(require 'use-package)
(require 'opam-user-setup
         (f-join user-emacs-directory "prog" "ocaml" "opam-user-setup.el"))

(use-package tuareg
  :init
  (add-to-list 'rtog/mode-repl-alist '(tuareg-mode . utop))
  :general
  (tuareg-mode-map
   "f12" 'next-error
   "f11" 'previous-error)
  :config
  (progn
    (setq tuareg-indent-align-with-first-arg nil)
    (add-hook
     'tuareg-mode-hook
     (lambda()
       (setq show-trailing-whitespace t)
       (setq indicate-empty-lines t)

       ;; Enable the representation of some keywords using fonts
       (when (functionp 'prettify-symbols-mode)
         (prettify-symbols-mode))

       (when (functionp 'flyspell-prog-mode)
         (flyspell-prog-mode))

       (setq tuareg-match-patterns-aligned t)
       ;;(electric-indent-mode 0)
       ))
    (when (require 'merlin nil t)
      (setq merlin-command 'opam)
      (add-to-list 'auto-mode-alist '("/\\.merlin\\'" . conf-mode))

      (when (functionp 'merlin-document)
        (define-key tuareg-mode-map (kbd "\C-c\C-h") 'merlin-document))

      ;; Run Merlin if a .merlin file in the parent dirs is detected
      (add-hook 'tuareg-mode-hook
                (lambda()
                  (let ((fn (buffer-file-name)))
                    (if (and fn (locate-dominating-file fn ".merlin"))
                        (merlin-mode))))))
    (setq auto-mode-alist
          (append '(("_oasis\\'" . conf-mode)
		    ("_tags\\'" . conf-mode)
		    ("_log\\'" . conf-mode))
                  auto-mode-alist))))

(use-package utop
  :config
  (setq utop-command "utop -emacs"))
