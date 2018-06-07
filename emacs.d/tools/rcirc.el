(require 'rcirc)
(require 'f)

;; Don't print /away messages.
;; This does not require rcirc to be loaded already,
;; since rcirc doesn't define a 301 handler (yet).
; (defun rcirc-handler-301 (process cmd sender args)
; "/away message handler.")

;; Turn on spell checking.
;; (add-hook 'rcirc-mode-hook (lambda ()
;; 			     (flyspell-mode 1)))

;; Keep input line at bottom.
(add-hook 'rcirc-mode-hook
	  (lambda ()
	    (set (make-local-variable 'scroll-conservatively)
		 8192)
            (message "Disable manualy rcirc-track-minor-mode if needed")
            (rcirc-track-minor-mode 1)))

;; Turn on logging everything to a special buffer, for debugging.
;; (setq rcirc-debug-flag t)

;; Adjust the colours of one of the faces.
(set-face-foreground 'rcirc-my-nick "red" nil)

;; Include date in time stamp.
(setq rcirc-time-format "%Y-%m-%d %H:%M ")

;; Change user info
(setq rcirc-default-nick      "paradoja")
(setq rcirc-default-user-name "paradoja")
(setq rcirc-default-full-name "paradoja")

;; Join these channels at startup.
(setq rcirc-startup-channels
      '(("\\.freenode\\.net$" )
        ("\\.hispano\\.org")))

;; File with the auth. information in the following way:
;; (setq rcirc-authinfo '(("sitio" nickserv "usuario" "clave")))
;;
;; Can also include changes to rcirc-server-alist
(defvar rcirc-authinfo-file-name "~/.authinfo.el")
(if (f-file? rcirc-authinfo-file-name)
    (load-file rcirc-authinfo-file-name))
