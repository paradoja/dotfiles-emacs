(require 'use-package)

(defvar local-slack-team-configurations nil)

(use-package slack
  :init
  (progn
    (require 'slack)
    (setq slack-buffer-emojify t)
    (setq slack-prefer-current-team t))
  :config
  (mapc (lambda (conf) (apply #'slack-register-team conf))
        local-slack-team-configurations))
