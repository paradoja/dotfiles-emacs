(require 'use-package)
(use-package elpy)

(requirements-add
 python.el
 (pyflakes
  (executable-find "pyflakes")
  "Python language linter
   pip install jedi flake8 importmagic autopep8 pyflakes"
  "https://pypi.org/project/pyflakes/"))

(elpy-enable)
