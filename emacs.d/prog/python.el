(require 'use-package)
(use-package elpy)

(requirements-add
 python.el
 (pyflakes
  (executable-find "pyflakes")
  "Python language linter, and some extras
   pip install jedi flake8 importmagic pyflakes"
  "https://pypi.org/project/pyflakes/")
 (yapf
  (executable-find "yapf")
  "Python code formatter
   pip install yapf"
  "https://github.com/google/yapf")
 (pycodestyle
  (executable-find "pycodestyle")
  "Python style lintern
   pip install pycodestyle"
  "https://github.com/PyCQA/pycodestyle")
 (python-lsp
  (executable-find "pyls")
  "Python lsp server
   pip install 'python-language-server[all]'"
  "https://github.com/palantir/python-language-server"))

(setq python-indent-guess-indent-offset-verbose nil)
(setq elpy-rpc-python-command (or (executable-find "python3")
                                  (executable-find "python")))
(add-hook 'python-mode-hook #'lsp)
(elpy-enable)
