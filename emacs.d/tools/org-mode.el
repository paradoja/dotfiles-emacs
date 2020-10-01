(require 'use-package)

(requirements-add
 org-mode.el
 (scrot
  (executable-find "scrot")
  "scrot - cli screenshot util"
  "https://github.com/dreamer/scrot"
  "nix-env -i scrot"))

(use-package org
  :hook
  (org-mode .
            (lambda ()
              (setq-mode-local org-mode
                               comment-auto-fill-only-comments nil)))) ; should already be loaded
(use-package ox-gfm) ; Github Flavored Markdown exporter for Org Mode

;; General conf.
(add-hook 'org-mode-hook 'turn-on-auto-fill)

(setq org-directory "~/org")
(setq org-log-done t)
(setq org-special-ctrl-a/e t)
(setq org-enforce-todo-dependencies t)
(setq org-agenda-persistent-filter t)
(setq org-deadline-warning-days 5)
(add-to-list 'org-modules 'org-habit)
;;(add-to-list 'org-modules 'org-notmuch)
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
(general-def
  :prefix "C-c"
  "l" 'org-store-link
  "a" 'org-agenda)

(general-def org-mode-map
  "C-," 'magit-status ; avoid the automatic rebinding here
  )

(general-def org-mode-map
  :prefix "C-c"
  "!" nil ; C-c ! is taken by flycheck
  "." nil ; unload C-c .
  ". ." 'org-time-stamp
  ". d" 'org-time-stamp-inactive
  "M-RET" 'org-insert-todo-heading)

;; Source blocks
(setq-default org-confirm-babel-evaluate nil)
(setq org-src-fontify-natively t) ; set up syntax highlighting in source blocks

;; Diagrams
(setq-default org-ditaa-jar-path (locate-file "ditaa" exec-path '("" ".jar")))
(setq-default org-plantuml-jar-path (locate-file "plantuml" exec-path '("" ".jar")))

;; Agenda
(defvar my/org-agenda-default-tags
  '("-objectives"))
(setq org-agenda-skip-deadline-if-done t
      org-agenda-skip-scheduled-if-done t)

;;; (all-the-icons-insert-icons-for 'faicon) inserts all faicon icons to check
(setq org-agenda-category-icon-alist
      `(("work" ,(list (all-the-icons-faicon "cogs")) nil nil :ascent center)
        ("life" ,(list (all-the-icons-faicon "smile-o")) nil nil :ascent center)
        ("social" ,(list (all-the-icons-faicon "users")) nil nil :ascent center)
        ("emacs" ,(list (all-the-icons-fileicon "emacs")) nil nil :ascent center)
        ("journal" ,(list (all-the-icons-faicon "calendar")) nil nil :ascent center)
        ("education" ,(list (all-the-icons-faicon "book")) nil nil :ascent center)))

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

(defvar org-agenda-directories-exclude
  (list (f-join "main" "notes"))
  "Has a list of directories to eventually be excluded from the
org-agenda directories")

(defun paradoja/org-absolute-dir (dir)
  (if (f-absolute? dir) dir
    (f-join org-directory dir)))

(defun org-agenda-directories ()
  "Gets a list of directories that are subdirectories of
`org-agenda-directories`"
  (let ((excludes (mapcar #'paradoja/org-absolute-dir
                          org-agenda-directories-exclude)))
    (mapcan
     (lambda (directory)
       (let ((dir (paradoja/org-absolute-dir directory)))
         (condition-case nil
             (cons dir
                   (f-directories dir
                                  (lambda (d)
                                    (and
                                     (-none? (lambda (exclude)
                                               (or (f-parent-of? exclude d)
                                                   (f-same? exclude d)))
                                             excludes)
                                     ;; right now `f-hidden?` is buggy, so we have to go on
                                     ;; a workaround
                                     (-none? (lambda (part)
                                               (string= (substring part 0 1) "."))
                                             (f-split d))))
                                  t))
           (file-missing (message "Warning: Org directory %s missing" dir) nil))))
     org-agenda-directories)))

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

(use-package org-pretty-tags
  :custom
  (org-pretty-tags-surrogate-strings '()))

;; Journal
(use-package org-journal
  :custom
  (org-journal-dir (f-join org-directory "journal/"))
  :general
  (:prefix "C-c d"
           "n" 'org-journal-new-entry)
  :config
  (add-hook 'org-journal-mode-hook (lambda () (visual-line-mode 'disable)))
  :custom
  (org-journal-file-format "%Y%m%d.org")
  (org-journal-enable-agenda-integration t)
  (org-journal-date-prefix "#+Category: journal\n\n* ")
  (org-journal-carryover-items nil))


;; Noter
(use-package org-noter
  :config
  (setq org-noter-notes-search-path (list (f-join org-directory "noter/"))))

;; org-roam

(use-package org-roam
  :after org
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory (f-join org-directory "main" "notes"))
  :general
  (:prefix "C-c n"
           "l" 'org-roam
           "t" 'org-roam-today
           "f" 'org-roam-find-file
           "g" 'org-roam-graph)
  (:keymaps 'org-mode-map
            "C-c n i" 'org-roam-insert)
  :config
  (setq
   org-roam-capture-templates
   (cl-flet ((mh (header) (apply #'concat
                                 (mapcar (lambda (a) (s-append "\n" a))
                                         header))))
     `(("d" "default" plain #'org-roam-capture--get-point
        "%?"
        :file-name "${slug}"
        :head ,(mh
                '("#+TITLE: ${title}"
                  "#+CREATED: %<%Y%m%d%H%M%S>"
                  "#+TAGS: :note:"))
        :unnarrowed t)
       ("e" "exercise" plain #'org-roam-capture--get-point
        "%?"
        :file-name "exercises/${slug}"
        :head ,(mh
                '("#+TITLE: ${title}"
                  "#+CREATED: %<%Y%m%d%H%M%S>"
                  "#+CATEGORY: exercises"
                  "#+TAGS: :note:fitness:exercises:"))
        :unnarrowed t)))))

;; deft

(use-package deft
  :after org
  :bind
  ("C-c n d" . deft)
  :custom
  (deft-recursive t)
  (deft-use-filter-string-for-filename t)
  (deft-default-extension "org")
  (deft-directory org-roam-directory)
  (deft-use-filename-as-title t))
