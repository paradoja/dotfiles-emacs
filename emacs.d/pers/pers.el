(require 'config-utils)

;;; Computer specific
(if-exists-load-file (f-join user-emacs-directory "pers" "emacs-local.el"))

;;; MacOSX
(if (or (string-match "i386-apple-darwin.*" system-configuration)
        (string-match "x86_64-apple-darwin.*" system-configuration))
    (load-file (f-join user-emacs-directory "pers/mac.el")))
