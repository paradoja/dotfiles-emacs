(require 'use-package)

(add-hook 'ruby-mode-hook
          (lambda ()
            (require 'ruby-electric)
            (ruby-electric-mode t)
            (require 'rspec-mode)
            (ruby-tools-mode)
            (defun ruby-insert-end ()
              "Insert \"end\" at point and reindent current line."
              (interactive)
              (insert "end")
              (ruby-indent-line t)
              (end-of-line))))

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'rtog/mode-repl-alist '(ruby-mode . inf-ruby))

(add-hook 'feature-mode
           (lambda ()
             (require 'ruby-electric)
             (ruby-electric-mode t)))

(add-hook 'robe-mode-hook 'robe-ac-setup)

(use-package rvm)
(rvm-use-default)
(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

(use-package rspec-mode)
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))
