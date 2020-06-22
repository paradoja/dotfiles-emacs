(requirements-add
 reason.el
 (reason-language-server
  (executable-find "reason-language-server")
  "ReasonML language server"
  "https://github.com/jaredly/reason-language-server"
  "# check https://github.com/jaredly/reason-language-server/releases")
 (reason-cli
  (executable-find "ocamlmerlin-reason")
  "ReasonML toolchain"
  "https://github.com/reasonml/reason-cli"
  "yarn global add reason-cli@latest-linux"))

(use-package reason-mode
  :hook
  ((reason-mode . emmet-mode)
   (reason-mode . lsp)
   (before-save . refmt-before-save)
   (reason-mode . (lambda ()
                   (setq utop-command "rtop -emacs")
                   (setq utop-prompt
                         (lambda ()
                           (let ((prompt (format "rtop[%d]> " utop-command-number)))
                             (add-text-properties 0 (length prompt) '(face utop-prompt) prompt)
                             prompt)))
                   (utop-minor-mode))))
  :hook merlin-mode)


(-when-let (rls (executable-find "reason-language-server"))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection rls)
                    :major-modes '(reason-mode)
                    :notification-handlers (ht ("client/registerCapability" 'ignore))
                    :priority 1
                    :server-id 'reason-ls)))
