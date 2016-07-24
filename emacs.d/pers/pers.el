;;; MacOSX
(if (or (string-match "i386-apple-darwin.*" system-configuration)
        (string-match "x86_64-apple-darwin.*" system-configuration))
    (load-file "~/.emacs.d/pers/mac.el"))
