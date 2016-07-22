(require 'use-package)
(require 's) ; TODO: use-package it

;;; For downloading messages mbsync (outside emacs) is used to sync
;;; messages between IMAP accounts and a local Maildir directory. Then
;;; notmuch (also installable outside emacs) is used to index these.
;;; The notmuch emacs client provides a minimal emacs client.

;;; https://notmuchmail.org/emacstips/

;;; M-x notmuch
;;; Everywhere
;;;  `-> q go back
;;;
;;; In hello view
;;;  `-> G reload emails (mbsync gmail && notmuch new from bash)
;;;  `-> j jump to predefined places
;;;  `-> J jump to standard places
;;;  `-> m write email
;;;      `-> C-c C-C send email
;;;
;;; In an email:
;;;  `-> R reply
;;;  `-> F forward

;;; TODO: Signature, easy un-inboxing + un-unreading, easy unreading

(defun notmuch-paradojas-jump-search ()
  (interactive)
  (let ((action-map '(("u" "unread" (lambda () (notmuch-tree "is:unread")))
                      ("i" "inbox" (lambda () (notmuch-tree "is:inbox"))))))
        (notmuch-jump action-map "Search: ")))

; TODO : this should probably not be here
(defmacro run-after-process (process-list func)
  `(let ((first-process ,process-list))
     ; TODO: add (process-status process-list) check in case the process finished
     (set-process-sentinel first-process
                           (lambda (_process event)
                             (if (string= (s-trim event) "finished")
                                 ,func)))))

(defun reload-email ()
  "Reload, reindex and refresh the emails and buffer"
  (interactive)
  (run-after-process (start-process "sync email" "*Messages*" "mbsync" "gmail")
                     (run-after-process
                      (start-process "reindex email" "*Messages*" "notmuch" "new")
                      (progn
                        (notmuch-poll-and-refresh-this-buffer)
                        (message "Email updated")))))

(use-package notmuch
  :bind (:map notmuch-hello-mode-map
              ("R" . reload-email)
              ("j" . notmuch-paradojas-jump-search)
              ("J" . notmuch-jump-search)))
(require 'notmuch)
(require 'notmuch-lib)

(setq notmuch-search-oldest-first nil ; newer first
      message-citation-line-format "On %a, %d %b %Y, %f wrote:"
      message-citation-line-function 'message-insert-formatted-citation-line)
