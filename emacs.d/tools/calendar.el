(require 'use-package)

;; emacs calendar
(setq calendar-week-start-day 1)

;; calfw
(use-package calfw)

(use-package calfw-org
  :bind ("C-c c" . cfw:open-org-calendar))


(defun my/open-calendar ()
  (interactive)
  (cfw:open-calendar-buffer
   :contents-sources
   (list
    (cfw:org-create-source "Green")  ; orgmode source
    )))
