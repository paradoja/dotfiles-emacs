(require 'org-trello)

(let* ((secrets (car
                 (auth-source-search :host "trello.com"
                                     :requires '(user secret))))
       (consumer-key (plist-get secrets :user))
       (token (funcall (plist-get secrets :secret))))
  (setq org-trello-consumer-key consumer-key)
  (setq org-trello-access-token token))
