(use-package reason-mode
  :config
  (progn
    (use-package utop)
    (setq utop-command "utop -emacs")
    (add-hook 'reason-mode-hook #'utop-minor-mode) ;; can be included in the hook above as well
    (add-hook 'reason-mode-hook
              (lambda ()
                (add-hook 'before-save-hook #'refmt-before-save)))))
