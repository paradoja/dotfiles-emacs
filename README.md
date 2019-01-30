## Required steps on installation

```lisp
(progn
  (use-package all-the-icons)
  (all-the-icons-install-fonts))
```

## Required programs

- [the-silver-searcher](https://github.com/ggreer/the_silver_searcher) is used for fast grep

### Programming languages and tools

#### Spell checking

- For spelling checks, we need `aspell`.

#### Haskell
- SHM executable is needed if SHM is to be used

#### Scala
- [Ensime](https://github.com/ensime/ensime-server/wiki/Quick-Start-Guide)

#### C/C++
- [Irony](https://github.com/Sarcasm/irony-mode) requires CMake and Clang

#### Rust
- [Racer](https://github.com/phildawes/racer)

#### Python
```bash
pip install jedi flake8 importmagic autopep8 pyflakes
```
Make sure that `pyflake` is in the path.

#### Javascript
Tern is used for flychecking.

#### Ocaml/ReasonML
- Opam
```bash
opam update
opam switch 4.02.3+buckle-1
```
- bucklescript compiler
  ```bash
  yarn global add bs-platform
  ```
- [Utop](https://github.com/ocaml-community/utop#integration-with-emacs)
  ```bash
  opam install utop # this is included in reason-cli
  ```
- reason-cli
  ```bash
  yarn global add reason-cli
  ```
- ocaml/reason language server
```bash
npm install -g ocaml-language-server
```

#### PDF
[pdf-tools](https://github.com/politza/pdf-tools) requires poppler and imagemagick


#### bash
```bash
npm i -g bash-language-server
```

## Other requirements

`~/.authinfo.el` is expected to have identity information. At least,
the following or similar is needed:
```lisp
(setq rcirc-authinfo '(("server" nickserv "nick" "password")))
```
