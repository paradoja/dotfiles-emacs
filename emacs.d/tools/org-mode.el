(require 'use-package)

(use-package org) ; should already be loaded
(use-package ox-gfm) ; Github Flavored Markdown exporter for Org Mode

;; General conf.
(add-hook 'org-mode-hook 'turn-on-auto-fill)

(setq org-directory "~/org")
(setq org-log-done t)
(setq org-special-ctrl-a/e t)
(setq org-agenda-persistent-filter t)
(add-to-list 'org-modules 'org-habit)
(add-to-list 'org-modules 'org-notmuch)
(add-to-list 'org-modules 'org-screenshot)

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
(defvar my/org-agenda-default-tags
  '("-objectives"))

;;; (all-the-icons-insert-icons-for 'faicon) inserts all faicon icons to check
(setq org-agenda-category-icon-alist
      `(("work" ,(list (all-the-icons-faicon "cogs")) nil nil :ascent center)
        ("life" ,(list (all-the-icons-faicon "smile-o")) nil nil :ascent center)
        ("emacs" ,(list (all-the-icons-fileicon "emacs")) nil nil :ascent center)
        ("journal" ,(list (all-the-icons-faicon "calendar")) nil nil :ascent center)))

(setq org-agenda-custom-commands
      '(("n" "Agenda and all TODOs"
         ((agenda my/org-agenda-default-tags)
          (alltodo my/org-agenda-default-tags)))
        ("w" "Work agenda & TODOs"
         ((tags-todo "work")))))

(defun my/org-agenda-list-exclude-tags-advice (orig-fn &rest args)
  ;; https://emacs.stackexchange.com/a/20192/1987
  "Exclude selected tags from `org-agenda-list'.
Intended as :around advice for `org-agenda-list'."
  (let ((org-agenda-tag-filter-preset my/org-agenda-default-tags))
    (funcall orig-fn args)))

(advice-add #'org-agenda-list :around #'my/org-agenda-list-exclude-tags-advice)

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
       (condition-case nil
           (cons dir
                 (f-directories dir
                                (lambda (d)
                                  ;; right now `f-hidden?` is buggy, so we have to go on
                                  ;; a workaround
                                  (-none? (lambda (part)
                                            (string= (substring part 0 1) "."))
                                          (f-split d)))
                                t))
         (file-missing (message "Warning: Org directory %s missing" dir) nil))))
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
  (org-journal-dir (f-join org-directory "journal/"))
  :general
  (:prefix "C-c d"
           "n" 'org-journal-new-entry)
  :custom
  (org-journal-file-format "%Y%m%d.org")
  (org-journal-enable-agenda-integration t)
  (org-journal-date-prefix "#+Category: journal\n\n* "))


;; Noter
(use-package org-noter
  :config
  (setq org-noter-notes-search-path (list (f-join org-directory "noter/"))))
