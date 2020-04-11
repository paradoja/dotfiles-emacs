## Required steps on installation

```lisp
(progn
  (use-package all-the-icons)
  (all-the-icons-install-fonts))
```

## Required programs

- [the-silver-searcher](https://github.com/ggreer/the_silver_searcher) is used for fast grep

### Spell checking

- For spelling checks, we need `aspell`.


## Other requirements

`~/.authinfo.el` is expected to have identity information. At least,
the following or similar is needed:
```lisp
(setq rcirc-authinfo '(("server" nickserv "nick" "password")))
```
