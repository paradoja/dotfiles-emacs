;; (require 'erc)

;; (setq erc-user-full-name "Abby Henríquez Tejera"
;;       erc-part-reason-various-alist '(("^$" "Leaving"))
;;       erc-quit-reason-various-alist '(("^$" "Leaving"))
;;       erc-quit-reason 'erc-part-reason-various
;;       erc-part-reason 'erc-quit-reason-various)

;; (add-hook 'erc-mode-hook (lambda () (auto-fill-mode 0)))
;; (add-hook 'erc-insert-post-hook 'erc-save-buffer-in-logs)

;; ;; Track channel activity in mode-line
;; (require 'erc-track)
;; (erc-track-mode t)
;; (setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
;;                                 "324" "329" "332" "333" "353" "477"))
;; (setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK")) ;; stuff to hide!

;; ;;;; Note: erc-join is not needed with ircrelay
;; ;; (require 'erc-join)
;; ;; (erc-autojoin-mode t)
;; ;; (setq erc-autojoin-channels-alist
;; ;;       '((".*\\.freenode." "#chef" "#chef-hacking")
;; ;;         (".*\\ircrelay.com")
;; ;;         )
;; ;;       )

;; ;; Highlight some keywords
;; (require 'erc-match)
;; (setq erc-keywords '("Abby" "paradoja"))

;; ;; enable an input history
;; (require 'erc-ring)
;; (erc-ring-mode t)

;; ;; wrap long lines
;; (require 'erc-fill)
;; (erc-fill-mode t)

;; ;; detect netsplits
;; ;; (require 'erc-netsplit)
;; ;; (erc-netsplit-mode t)

;; ;; spellcheck, requires local aspell
;; (erc-spelling-mode t)

;; ;; Truncate buffers so they don't hog core
;; (setq erc-max-buffer-size 40000) ;; chars to keep in buffer
;; (defvar erc-insert-post-hook)
;; (add-hook 'erc-insert-post-hook 'erc-truncate-buffer)
;; (setq erc-truncate-buffer-on-save t)

;; ;; kill buffers when leaving
;; (setq erc-kill-buffer-on-part t)

;; ;; keep input at bottom
;; (erc-scrolltobottom-mode t)

;; ;; connect function
;; (defun irc-connect ()
;;   "Connect to IRC"
;;   (interactive)
;;   (when (y-or-n-p "Connect to IRC? ")
;;     (ircrelay-connect "nickname1" "Your Name" "user_network1" "supersecretircrelaypass")
;;     (ircrelay-connect "nickname2" "Your Name" "user_network2" "supersecretircrelaypass")
;; ))

;; ;; wrapper around erc-ssl, you could probably also
;; ;; call this directly instead of using irc-connect
;; (defun ircrelay-connect (nickname fullname userid password)
;;   (let ((erc-email-userid userid))
;;     (erc-ssl :server "irc.ircrelay.com" :port 6697 :password password
;;              :nick nickname :full-name fullname)))
