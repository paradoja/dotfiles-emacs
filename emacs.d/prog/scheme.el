(add-hook 'scheme-mode-hook
           (lambda () (paredit-mode +1))
           ;(require 'quack)

           (condition-case err
               (require 'scribble "/home/paradoja/.racket/planet/300/5.3.1/cache/neil/scribble-emacs.plt/1/2/scribble")
             (error (message "Could not load Scribble Emacs: %s" err))))

(setq scheme-program-name "mzscheme")
