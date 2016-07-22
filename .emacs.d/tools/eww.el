(defun open-point-in-eww ()
  (interactive)
  (let ((url (thing-at-point 'url)))
    (when url (eww-browse-url url))))
