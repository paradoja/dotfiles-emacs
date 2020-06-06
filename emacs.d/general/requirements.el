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
     (-when-let (missing-dependencies
                 (mapcan
                  (lambda (dep)
                    (-let [(dep-name f desc url)
                           dep]
                      (unless (eval f)
                        (list dep-name desc url))))
                  (quote ,deps)))
       (push
        (cons ',unit
              missing-dependencies)
        requirements-unmet-requirements))))

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
