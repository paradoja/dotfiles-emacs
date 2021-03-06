;;; config-utils --- Configuration utilities

(provide 'config-utils)
(require 'f)

(add-to-list 'load-path (file-truename "."))

(defmacro relativize-function (func)
  `(defun ,(intern (concat (symbol-name func) "-relative")) (&rest args)
     (,func (apply #'relative-file args))))

(relativize-function load)
(relativize-function load-file)

(defun load-file-list (file-list)
  (mapc #'load-relative file-list))

(defun load-configurations (configurations)
  "From a list of symbols, loads local conf files"
  (load-file-list (mapcar #'symbol-name configurations)))

(defun relative-file (path &rest args)
  (file-truename (f-join (f-dirname (f-this-file))
                         path)
                 args))

(defun if-exists-load-file (file)
  "Loads a file if it exists"
  (if (file-exists-p file)
      (load-file file)))

(defmacro use-packages (&rest packages)
  "Use/install a list of packages `use-package'."
  (declare (indent defun))
  (macroexp-progn
   (mapcar (lambda (package)
             `(use-package ,package))
           packages)))

(defun load-emacs-conf-file (file)
  "Loads a local emacs configuration file"
  (load (f-join user-emacs-directory file)))

(defmacro with-warning-level (level &rest body)
  "Runs the body with the given warning level"
  `(let ((warning-minimum-level ,level)
         (result (ignore-errors "Error: %S" ,@body)))
     result))

(defmacro without-warnings (&rest body)
  "Runs the body only showing emergencies"
  `(with-warning-level :emergency ,@body))
