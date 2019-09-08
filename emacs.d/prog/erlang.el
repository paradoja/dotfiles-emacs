(require 'use-package)

(when (executable-find "erl")
  (use-package erlang
    :init
    (let* ((exec (f-canonical (executable-find "erl")))
           (bin-dir (f-dirname exec))
           (root-dir (f-dirname bin-dir))
           (man-dir (f-join root-dir "man")))
      (setq erlang-root-dir root-dir)
      (add-to-list 'exec-path bin-dir)
      (setq erlang-man-root-dir man-dir))))
