;;; merlin.el for use with ocaml, reasonml
;; requirements below!
(defun shell-cmd (cmd)
  "Returns the stdout output of a shell command or nil if the command returned
   an error"
  (car (ignore-errors (apply 'process-lines (split-string cmd)))))

(defun ocaml/reason-cmd-where (cmd)
  (let ((where (shell-cmd cmd)))
    (if (not (string-equal "unknown flag ----where" where))
        where)))

(eval-and-compile
  (let* ((refmt-bin (or (ocaml/reason-cmd-where "refmt ----where")
                        (shell-cmd "which refmt")
                        (shell-cmd "which bsrefmt")))
         (merlin-bin (or (ocaml/reason-cmd-where "ocamlmerlin ----where")
                         (shell-cmd "which ocamlmerlin")))
         (merlin-base-dir (when merlin-bin
                            (replace-regexp-in-string "bin/ocamlmerlin$" "" merlin-bin))))
    ;; Add merlin.el to the emacs load path and tell emacs where to find ocamlmerlin
    (when merlin-bin
      (add-to-list 'load-path (concat merlin-base-dir "share/emacs/site-lisp/"))
      (setq merlin-command merlin-bin))

    (when refmt-bin
      (setq refmt-command refmt-bin))))

(requirements-add
 merlin.el
 (opam
  (executable-find "opam")
  "Ocaml package manager"
  "https://opam.ocaml.org/"
  "# check https://opam.ocaml.org/doc/Install.html")
 (merlin
  (not (null merlin-command))
  "Merlin & merlin mode"
  "https://github.com/ocaml/merlin"
  "opam install merlin")
 (bucklescript-compiler
  (executable-find "bsc")
  "Bucklescript compiler
   Bucklescript is the ocaml/reason -> js compiler"
  "https://github.com/bucklescript/bucklescript"
  "yarn global add bs-platform")
 (utop
  (executable-find "utop")
  "utop - ocaml interpreter"
  "https://opam.ocaml.org/blog/about-utop/"
  "#opam install utop # this is included in reason-cli"))

(require 'opam-user-setup
         (f-join user-emacs-directory "prog" "ocaml" "opam-user-setup.el"))

(use-package utop
  :config
  (setq utop-command "opam config exec -- rtop -emacs"))

;; TODO
;; for some reason package.el insists on downloading the repo even
;; though the load-path is given and ensure is nil
(autoload 'merlin-mode "merlin" "Merlin mode" t)
(setq merlin-ac-setup t)
(dolist (mode '(tuareg-mode caml-mode reason-mode))
  (let ((hook (intern (format "%s-hook" (symbol-name mode)))))
    (add-hook hook #'merlin)))
;; (use-package merlin
;;   :ensure nil
;;   :config
;;   (setq merlin-ac-setup t)
;;   :hook
;;   (tuareg-mode caml-mode reason-mode))
