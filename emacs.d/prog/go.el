(require 'use-package)

(requirements-add
 go.el
 (gopls
  (executable-find "gopls")
  "gopls"
  "https://github.com/golang/tools/blob/master/gopls/doc/user.md"
  "go get golang.org/x/tools/gopls"))

(use-package go-mode
  :hook
  (go-mode .
           (lambda ()
             ;; Use goimports instead of go-fmt
             (setq gofmt-command "goimports")
             ;; Customize compile command to run go build
             (if (not (string-match "go" compile-command))
                 (set (make-local-variable 'compile-command)
                      "go build -v && go test -v && go vet"))
             ;; Godef jump key binding
             (add-hook 'before-save-hook 'gofmt-before-save)
             (local-set-key (kbd "M-.") 'godef-jump)
             (local-set-key (kbd "M-*") 'pop-tag-mark)
             (lsp-deferred))))

(use-package go-guru)
(use-package company-go)
(use-package flycheck-golangci-lint)

(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'lsp-format-buffer t t)
            (add-hook 'before-save-hook #'lsp-organize-imports t t)))
