(require 'use-package)

(requirements-add
 ruby.el
 (robe ;; not sure if useful together with solargraph
  (executable-find "pry")
  "Code navigation and completion"
  "https://github.com/dgutov/robe"
  "gem install pry")
 (solargraph
  (executable-find "solargraph")
  "Ruby lsp server"
  "https://github.com/castwide/solargraph"
  "gem install solargraph")
 (rbenv
  (f-dir? (f-join (getenv "HOME") ".rbenv"))
  "rbenv"
  "https://github.com/rbenv/rbenv"
  "# check https://github.com/rbenv/rbenv-installer; or install manually"))

(use-package ruby-mode
  :mode
  ("\\.rake$" "Rakefile$" "\\.gemspec$" "Gemfile$")
  :init
  (add-to-list 'rtog/mode-repl-alist '(ruby-mode . inf-ruby))
  :hook
  ((ruby-mode . (lambda () (ruby-electric-mode t)))
   (ruby-mode . (lambda () (flyspell-mode)))
   (ruby-mode . lsp)))
(use-package ruby-electric)

(use-package rspec-mode
  :config
  (rspec-install-snippets))
(use-package inf-ruby)
(use-package ruby-tools)

(use-package robe
  :init
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-robe))
  (defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
    (rvm-activate-corresponding-ruby)))
(use-package ruby-hash-syntax)
(use-package rbenv
  :hook (ruby-mode . rbenv-mode))
