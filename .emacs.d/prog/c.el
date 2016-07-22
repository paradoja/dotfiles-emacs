(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "k&r")
             (c-toggle-hungry-state 1)
             (setq c-auto-newline 1)
             (auto-fill-mode 1)
             (define-key c-mode-map (kbd "<return>")
               'pdox-new-line-and-indent)))
