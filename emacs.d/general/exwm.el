(when (not (or (display-graphic-p)
               (getenv "DISPLAY")))
  (use-package xelb)
  (use-package exwm
    :config (exwm-config-default)))
