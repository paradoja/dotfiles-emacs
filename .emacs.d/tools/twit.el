(setq twittering-use-master-password t)
(setq twittering-icon-mode t)
;; (add-hook 'twittering-new-tweets-hook
;;           (lambda ()
;;             (let ((n twittering-new-tweets-count))
;;               (start-process "twittering-notify" nil "notify-send"
;;                              "-i" "/usr/share/pixmaps/gnome-emacs.png"
;;                              "New tweets"
;;                              (format "You have %d new tweet%s"
;;                                      n (if (> n 1) "s" ""))))))
