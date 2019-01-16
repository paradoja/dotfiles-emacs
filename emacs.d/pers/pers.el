(require 'config-utils)

;;; Computer specific
(if-exists-load-file "~/.emacs-local")

;;; Work related org
(if-exists-load-file "~/org/.emacs-work")

;;; MacOSX
(if (or (string-match "i386-apple-darwin.*" system-configuration)
        (string-match "x86_64-apple-darwin.*" system-configuration))
    (load-file (f-join user-emacs-directory "pers/mac.el")))
