;;; config-utils --- Configuration utilities

(provide 'config-utils)

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
