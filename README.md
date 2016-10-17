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

#### PDF
[pdf-tools](https://github.com/politza/pdf-tools) requires poppler and imagemagick

## Other requirements

`~/.authinfo.el` is expected to have identity information. At least,
the following or similar is needed:
```lisp
(setq rcirc-authinfo '(("server" nickserv "nick" "password")))
```
