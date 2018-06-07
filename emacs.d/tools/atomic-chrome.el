(require 'use-package)

(use-package atomic-chrome)
(atomic-chrome-start-server)

(setq atomic-chrome-url-major-mode-alist
      '(("github\\.com" . gfm-mode)
        ("redmine" . textile-mode)))

(setq atomic-chrome-buffer-open-style 'frame)
