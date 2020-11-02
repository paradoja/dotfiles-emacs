(require 'use-package)
(use-package elpy)

(requirements-add
 python.el
 (pyflakes
  (executable-find "pyflakes")
  "Python language linter, and some extras"
  "https://pypi.org/project/pyflakes/"
  "pip install jedi flake8 importmagic pyflakes")
 (yapf
  (executable-find "yapf")
  "Python code formatter"
  "https://github.com/google/yapf"
  "pip install yapf")
 (pycodestyle
  (executable-find "pycodestyle")
  "Python style lintern"
  "https://github.com/PyCQA/pycodestyle"
  "pip install pycodestyle")
 (python-lsp
  (executable-find "pyls")
  "Python lsp server"
  "https://github.com/palantir/python-language-server"
  "pip install 'python-language-server[all]'"))

(setq python-indent-guess-indent-offset-verbose nil)
(setq elpy-rpc-python-command (or (executable-find "python3")
                                  (executable-find "python")))
(add-hook 'python-mode-hook #'lsp)
(elpy-enable)
(use-package poetry)
