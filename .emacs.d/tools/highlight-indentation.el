(add-hook 'highlight-indentation-mode-hook
          (lambda ()
            (set-face-background 'highlight-indentation-face "#11aa11")
            (set-face-background 'highlight-indentation-current-column-face "#44ff44")))

(defun toggle-hightlight-indentation-mode ()
  (interactive)
  (if (and (boundp 'highlight-indentation-mode)
           highlight-indentation-mode)
      (progn
        (message "Disabling highlight-indentation-mode")
        (highlight-indentation-mode -1)
        (highlight-indentation-current-column-mode -1))
    (progn
        (message "Enabling highlight-indentation-mode")
        (highlight-indentation-mode 1)
        (highlight-indentation-current-column-mode 1))))
