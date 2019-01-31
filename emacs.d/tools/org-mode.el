(require 'use-package)

(use-package org) ; should already be loaded
(use-package ox-gfm) ; Github Flavored Markdown exporter for Org Mode

;; General conf.
(setq org-log-done t)

(setq org-directory "~/org")


;; Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (ruby . t)
   (ditaa . t)
   (plantuml . t)
   (shell . t)))

(use-package ob-async)

;; Key map changes
(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)

(define-key org-mode-map (kbd "C-,") 'magit-status)
(define-key org-mode-map (kbd "C-c M-RET") 'org-insert-todo-heading)

;; Source blocks
(setq-default org-confirm-babel-evaluate nil)
(setq org-src-fontify-natively t) ; set up syntax highlighting in source blocks

;; Diagrams
(setq-default org-ditaa-jar-path (locate-file "ditaa" exec-path '("" ".jar")))
(setq-default org-plantuml-jar-path (locate-file "plantuml" exec-path '("" ".jar")))


;; Agenda
(defvar org-agenda-directories
  (list "main"
        "work")
  "Has a list of directories from which new org-agenda
directories will be recursively searched")

(defun org-agenda-directories ()
  "Gets a list of directories that are subdirectories of
`org-agenda-directories`"
  (mapcan
   (lambda (directory)
     (let ((dir
            (if (f-absolute? directory) directory
              (f-join org-directory directory))))
       (f-directories dir
                      (lambda (d)
                        ;; right now `f-hidden?` is buggy, so we have to go on
                        ;; a workaround
                        (-none? (lambda (part)
                                  (string= (substring part 0 1) "."))
                                (f-split d)))
                      t)))
   org-agenda-directories))

(defun org-agenda-update-files ()
  "Updates `org-agenda-files` so that it is up-to-date with
changes in the org-agenda directories. Relies on
`org-agenda-directories`."
  (interactive)
  (setq org-agenda-files (org-agenda-directories)))

(condition-case err
    (org-agenda-update-files)
  (file-missing
   (message "Error setting org-agenda-files: %s" err)))

;; Journal
(use-package org-journal
  :custom
  (org-journal-dir (f-join org-directory "journal/")))

;; Noter
(use-package org-noter
  :config
  (setq org-noter-notes-search-path (list (f-join org-directory "noter/"))))
