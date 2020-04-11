(require 'use-package)
(use-package elpy)

;; requirements
;; pip install jedi flake8 importmagic autopep8 pyflakes
;; Make sure that `pyflake` is in the path.

(elpy-enable)
(add-hook 'python-mode-hook #'aggressive-indent-mode)
