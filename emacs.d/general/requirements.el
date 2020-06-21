;;; requirements.el -- simple interface to track requirements


;; Copyright (C) 2020 Abby Henríquez Tejera

;; Author: Abby Henríquez Tejera <abby@blulaktuko.net>
;; Version: 0.1
;; Package-Requires: ((dash))
;; Keywords: util, configuration
;; URL: -

;;; Commentary:

;; This package provides a simple way of tracking required external
;; dependencies on emacs load. To use it...

;;;; TODO: Calls to requirements-add should not be immediately
;;;; evaluated, but stored and evaluated on requirement, and possibly
;;;; updated then (so that all system requirements, or module
;;;; requirements are evaluated when needed).

;;;; TODO: Have interactive calls to get a module unmet
;;;; requirements. It would ideally default to the current one.

(provide 'requirements)

(defvar requirements-unmet-requirements '()
  "Stores a list of the unmet requirements as an assoc. list,
  with the first element the loading package/unit and the second
  a list with the unmet requirements.")

(defvar requirements-required-unit '()
  "Stores a list of the units/packages that indicate requirements
  in an assoc list. The first element will be the symbol
  associated with package unit, and the second, an alist with
  information about the unit.")

(require 'dash)
(defmacro requirements-add (unit &rest deps)
  `(progn
     (push
      (cons ',unit
            `((file . ,(buffer-file-name))
              (date . ,(current-time-string))))
      requirements-required-unit)
     (let ((missing-dependencies
            (mapcan
             (lambda (dep)
               (-let [(dep-name f desc url install-inst)
                      dep]
                 (unless (eval f)
                   (list dep-name desc url))))
             (quote ,deps)))
           (unmet-requirements-list
            (assoc-delete-all ',unit
                              requirements-unmet-requirements)))
       (setq requirements-unmet-requirements
             (if missing-dependencies
                 (sort (cons
                        (cons ',unit
                              missing-dependencies)
                        unmet-requirements-list)
                       (lambda (a b) (let ((sa (symbol-name (car a)))
                                           (sb (symbol-name (car b))))
                                       (if (string= sa sb)
                                           (string< (symbol-name (car (cdr a)))
                                                    (symbol-name (car (cdr b))))
                                         (string< sa sb)))))
               unmet-requirements-list)))))

(defun requirements-units-missing-dependencies ()
  (interactive)
  (let ((units-without-deps
         (apply #'concat
                (-interpose ", "
                            (mapcar (lambda (dep)
                                      (symbol-name (car dep)))
                                    requirements-unmet-requirements)))))
    (if units-without-deps
        (message (concat "The following units have unmet dependencies: " units-without-deps))
      (message "No unit has unmet dependencies"))))
