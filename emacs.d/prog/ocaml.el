(require 'use-package)

;; ocaml and reason, for now


;; requirements
;; - Opam
;; ```bash
;; opam update
;; opam switch create 4.06.1
;; ```
;; - bucklescript compiler
;; ```bash
;; yarn global add bs-platform
;; ```
;; - [Utop](https://github.com/ocaml-community/utop#integration-with-emacs)
;; ```bash
;; opam install utop # this is included in reason-cli
;; ```
;; - reason-cli
;; ```bash
;; yarn global add reason-cli@latest-linux
;; ```
;; - ocaml/reason language server
;; ```bash
;; yarn global add ocaml-language-server
;; ```


(require 'opam-user-setup
         (f-join user-emacs-directory "prog" "ocaml" "opam-user-setup.el"))

;; (use-package tuareg
;;   :init
;;   (add-to-list 'rtog/mode-repl-alist '(tuareg-mode . utop))
;;   :general
;;   (tuareg-mode-map
;;    "f12" 'next-error
;;    "f11" 'previous-error)
;;   :config
;;   (progn
;;     (setq tuareg-indent-align-with-first-arg nil)
;;     (add-hook
;;      'tuareg-mode-hook
;;      (lambda()
;;        (setq show-trailing-whitespace t)
;;        (setq indicate-empty-lines t)

;;        ;; Enable the representation of some keywords using fonts
;;        (when (functionp 'prettify-symbols-mode)
;;          (prettify-symbols-mode))

;;        (when (functionp 'flyspell-prog-mode)
;;          (flyspell-prog-mode))

;;        (setq tuareg-match-patterns-aligned t)
;;        ;;(electric-indent-mode 0)
;;        ))
;;     (when (require 'merlin nil t)
;;       (setq merlin-command 'opam)
;;       (add-to-list 'auto-mode-alist '("/\\.merlin\\'" . conf-mode))

;;       (when (functionp 'merlin-document)
;;         (define-key tuareg-mode-map (kbd "\C-c\C-h") 'merlin-document))

;;       ;; Run Merlin if a .merlin file in the parent dirs is detected
;;       (add-hook 'tuareg-mode-hook
;;                 (lambda()
;;                   (let ((fn (buffer-file-name)))
;;                     (if (and fn (locate-dominating-file fn ".merlin"))
;;                         (merlin-mode))))))
;;     (setq auto-mode-alist
;;           (append '(("_oasis\\'" . conf-mode)
;; 		    ("_tags\\'" . conf-mode)
;; 		    ("_log\\'" . conf-mode))
;;                   auto-mode-alist))))

(use-package utop
  :config
  (setq utop-command "opam config exec -- rtop -emacs")
  :hook reason-mode)

(defun shell-cmd (cmd)
  "Returns the stdout output of a shell command or nil if the command returned
   an error"
  (car (ignore-errors (apply 'process-lines (split-string cmd)))))

(defun reason-cmd-where (cmd)
  (let ((where (shell-cmd cmd)))
    (if (not (string-equal "unknown flag ----where" where))
        where)))

(eval-and-compile
  (let* ((refmt-bin (or (reason-cmd-where "refmt ----where")
                        (shell-cmd "which refmt")
                        (shell-cmd "which bsrefmt")))
         (merlin-bin (or (reason-cmd-where "ocamlmerlin ----where")
                         (shell-cmd "which ocamlmerlin")))
         (merlin-base-dir (when merlin-bin
                            (replace-regexp-in-string "bin/ocamlmerlin$" "" merlin-bin))))
    ;; Add merlin.el to the emacs load path and tell emacs where to find ocamlmerlin
    (when merlin-bin
      (add-to-list 'load-path (concat merlin-base-dir "share/emacs/site-lisp/"))
      ;; (setq merlin-load-path (concat merlin-base-dir "share/emacs/site-lisp/"))
      (setq merlin-command merlin-bin))

    (when refmt-bin
      (setq refmt-command refmt-bin))))

(require 'merlin)

(use-package reason-mode
  :init
  (add-hook 'before-save-hook 'refmt-before-save)
  :hook merlin-mode)

(defun evil-custom-merlin-iedit ()
  (interactive)
  (if iedit-mode (iedit-mode)
    (merlin-iedit-occurrences)))

;; TODO
;; for some reason package.el insists on downloading the repo even
;; though the load-path is given and ensure is nil

(autoload 'merlin-mode "merlin" "Merlin mode" t)
(setq merlin-ac-setup t)
(dolist (hook '(tuareg-mode-hook caml-mode-hook))
  (add-hook hook 'merlin-mode))
(general-def merlin-mode-map
  "C-c i" 'evil-custom-merlin-iedit)
;; (use-package merlin
;;   :ensure nil
;;   :load-path merlin-load-path
;;   :config
;;   (setq merlin-ac-setup t)
;;   :hook
;;   (tuareg-mode caml-mode reason-mode)
;;   :general
;;   (merlin-mode-map
;;    "C-c i" 'evil-custom-merlin-iedit))
