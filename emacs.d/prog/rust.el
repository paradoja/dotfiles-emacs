(require 'use-package)

(requirements-add
 rust.el
 (rustup
  (executable-find "rustup")
  "Rustup (& rust)"
  "https://rustup.rs/")
 (clippy
  ()
  "Clippy - rust linter"
  "https://github.com/rust-lang/rust-clippy"
  "rustup component add clippy")
 (rls
  (executable-find "rls")
  "Rust Language Server"
  "https://github.com/rust-lang/rls"
  "rustup component add rls rust-analysis rust-src")
 (racer
  (executable-find "racer")
  "Racer for Rust"
  "rustup toolchain add nightly
   rustup component add rust-src
   cargo +nightly install racer"))

(use-package rust-mode
  :mode "\\.rs\\'"
  :init  (setq rust-format-on-save t))
(use-package flycheck-rust)
(use-package racer
  :hook
  ((rust-mode . racer-mode)
   (racer-mode . eldoc-mode)
   (racer-mode . company-mode)))
(use-package cargo
  :hook
  (rust-mode . cargo-minor-mode))

;; (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
;; (setq company-tooltip-align-annotations t)
