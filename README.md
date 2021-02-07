Unsupported, using https://gitlab.com/paradoja-dotfiles/emacs-doom-dotfiles now.

## ...

```lisp
(progn
  (use-package all-the-icons)
  (all-the-icons-install-fonts))
```

## Other requirements

`~/.authinfo.el` is expected to have identity information. At least,
the following or similar is needed:
```lisp
(setq rcirc-authinfo '(("server" nickserv "nick" "password")))
```
