(require 'dash)

(setq browse-kill-ring-highlight-current-entry t
      browse-kill-ring-highlight-inserted-item 'pulse)

(defun custom-yank-pop (arg)
  (interactive "*p")
  (if (-contains? '(yank cua--paste-rectangle) last-command)
      (progn
        (delete-region (point) (mark))
        (browse-kill-ring))
    (browse-kill-ring)))
