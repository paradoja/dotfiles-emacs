(require 'use-package)

(use-package go-mode
  :config
  (add-hook 'go-mode-hook
            #'(lambda ()
                ;; Use goimports instead of go-fmt
                (setq gofmt-command "goimports")
                ;; Customize compile command to run go build
                (if (not (string-match "go" compile-command))
                    (set (make-local-variable 'compile-command)
                         "go build -v && go test -v && go vet"))
                ;; Godef jump key binding
                (add-hook 'before-save-hook 'gofmt-before-save)
                (local-set-key (kbd "M-.") 'godef-jump)
                (local-set-key (kbd "M-*") 'pop-tag-mark))))

(use-package go-guru)
(use-package company-go)
(use-package flycheck-golangci-lint)
