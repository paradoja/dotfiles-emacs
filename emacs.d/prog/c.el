(require 'use-package)

(requirements-add
 c.el
 (ccls
  (executable-find "ccls")
  "C/++ lsp server"
  "https://github.com/MaskRay/ccls/wiki/Build"
  "nix-env -i ccls"))

(-when-let (ccls (executable-find "ccls"))
  (add-hook 'c-mode-hook #'lsp)
  (use-package ccls
    :init
    (setq ccls-executable ccls)))
