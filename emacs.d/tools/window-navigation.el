(require 'use-package)
(use-package window-jump)
(use-package window-numbering)
(use-package rotate)
(require 'dash)
(require 'window-jump)
(require 'window-numbering)

(window-numbering-mode)

(defun do-window-rotation (option)
  "Rotates the window or layout, or sets a layout."
  (interactive "crotate: [w] window [l] layout [h] horiz. [v] vert. [j] main-horiz. [b] main-vert. [t] tiled\n")
  (call-interactively (cond ((char-equal ?w option) #'rotate-window)
                            ((char-equal ?l option) #'rotate-layout)
                            ((char-equal ?h option) #'rotate:even-horizontal)
                            ((char-equal ?v option) #'rotate:even-vertical)
                            ((char-equal ?j option) #'rotate:main-vertical)
                            ((char-equal ?b option) #'rotate:main-horizontal)
                            ((char-equal ?t option) #'rotate:tiled))))

(defun other-window-directed (option arg)
  "Changes the point to the selected window."
  (interactive "c[o] other window [0-9] go to window 0-9 [hjkl]/[bnpf] go left/bottom/top/right [r] Rotate\nP")
  (cl-flet* ((char-in (char list)
                      (-any? (lambda (current-char) (char-equal char current-char))
                             list))
             (get-direction (char)
                            (cond ((char-in char '(?h ?b)) wj-vec-left)
                                  ((char-in char '(?j ?n)) wj-vec-down)
                                  ((char-in char '(?k ?p)) wj-vec-up)
                                  ((char-in char '(?l ?f)) wj-vec-right))))
    (cond ((char-equal ?o option)
           (call-interactively #'other-window))
          ((and (<= ?0 option)
                (>= ?9 option))
           (select-window-by-number (string-to-number (char-to-string option))
                                    arg))
          ((get-direction option)
           (window-jump (get-direction option)))
          ((char-equal ?r option)
           (call-interactively #'do-window-rotation)))))


(global-set-key "\C-co" 'other-window-directed)

;; We remove the default keybindings for window-numbering-mode
(-dotimes 10
  (lambda (n)
    (define-key window-numbering-keymap
      (kbd (concat "M-" (number-to-string n))) nil)))
