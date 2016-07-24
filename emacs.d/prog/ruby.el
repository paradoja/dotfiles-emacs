(require 'use-package)

(use-package ruby-mode
  :mode
  ("\\.rake$" "Rakefile$" "\\.gemspec$" "Gemfile$")
  :init
  (add-to-list 'rtog/mode-repl-alist '(ruby-mode . inf-ruby))
  :config
  (add-hook 'ruby-mode-hook
            (lambda () (ruby-electric-mode t))))
(use-package ruby-electric)

(use-package rspec-mode
  :config
  (rspec-install-snippets))
(use-package inf-ruby)
(use-package ruby-tools)
(use-package robe
  :init
  (add-hook 'robe-mode-hook 'robe-ac-setup)
  (defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
    (rvm-activate-corresponding-ruby)))
(use-package ruby-hash-syntax)
(use-package rvm
  :config
  (rvm-use-default))
