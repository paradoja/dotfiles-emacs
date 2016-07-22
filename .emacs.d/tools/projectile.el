(require 'projectile)
(projectile-global-mode)

(require 'helm-projectile)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

; Removing Projectile from the mode line
(setq-default projectile-mode-line "")
(defun projectile-update-mode-line ())

; Change default switch-project to select open buffers if there are
; any, instead of find-file
(defun custom-projectile-open-project-buffer-or-file (&optional arg)
  "If the project has any open buffers, it will try to open one
  of them. Otherwise it will prompt to open a project file."
  (interactive "P")
  (if (eq (projectile-project-buffer-names) '())
      (projectile-find-file arg)
    (projectile-switch-to-buffer)))

(setq projectile-switch-project-action
      'custom-projectile-open-project-buffer-or-file)
