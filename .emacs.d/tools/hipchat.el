(require 'use-package)
(use-package jabber)
(require 'jabber)
(require 'notifications)

; These would go in jabber.el configuration... if it existed
(define-key jabber-chat-mode-map (kbd "RET") 'newline)
(define-key jabber-chat-mode-map [M-return] 'jabber-chat-buffer-send)
(add-hook 'jabber-chat-mode-hook 'goto-address)

(defvar hipchat-number "number")
(defvar hipchat-username "number_another")
(defvar hipchat-nick "my-nick")
(defvar hipchat-server "server")
(defvar hipchat-nickname "name")
(defvar hipchat-password nil)
(defvar hipchat-auto-join '())

;; Load conf.
(defvar hipchat-configuration "~/.hipchat.el")
(with-temp-buffer
  (insert-file-contents-literally hipchat-configuration)
  (eval-buffer))

(setq jabber-history-enabled t
      jabber-use-global-history nil
      jabber-backlog-number 40
      jabber-backlog-days 30)

;; Removing presence hooks
(setq jabber-alert-presence-hooks
      (delete 'jabber-presence-echo jabber-alert-presence-hooks))

;; Adding to global Jabber conf. to be a good citizen
(defun hipchat-login-info ()
  (list (format "%s@%s" hipchat-username hipchat-server)
        (cons :password hipchat-password)))

(add-to-list 'jabber-account-list (hipchat-login-info))

(defun hipchat-join (room)
  (interactive "sRoom name: ")
  (jabber-groupchat-join
   (jabber-read-account)
   (concat hipchat-number "_" room "@conf.hipchat.com")
   hipchat-nickname
   t))

(defun hipchat-mention (nickname)
  "Mention nicknames in a way that HipChat clients will pickup"
  (interactive
   (list (jabber-muc-read-nickname jabber-group "Nickname: ")))
  (insert (concat "@\"" nickname "\" ")))

(defun hipchat-alert-mentioned (from buffer text proposed-alert)
  (if (or (string-match hipchat-nick text)
          (string-match "@here" text))
      (progn
        (let ((title (format "[HC] %s:"
                             (jabber-jid-rostername from))))
         (notifications-notify :title title :body text)))))

(add-to-list 'jabber-alert-message-hooks 'hipchat-alert-mentioned)

;; We connect to default places
(defun hipchat (&optional _connection)
  (interactive)
  (ignore-errors (jabber-disconnect (hipchat-login-info)))
  (jabber-connect hipchat-username hipchat-server nil nil hipchat-password))

(defun hipchat-auto (&optional _connection)
  (interactive)
  (mapc (lambda (room) (hipchat-join room))
        hipchat-auto-join))

(add-hook 'jabber-post-connect-hooks 'hipchat-auto t)
(add-hook 'jabber-lost-connection-hooks 'hipchat t)
