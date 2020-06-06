(require 'use-package)

(requirements-add
 c.el
 (ccls
  (executable-find "ccls")
  "C/++ lsp server"
  "https://github.com/MaskRay/ccls/wiki/Build"))

(-when-let (ccls (executable-find "ccls"))
  (use-package ccls
    :init
    (setq ccls-executable ccls)))
