(require 'use-package)
(use-package window-jump)
(use-package window-numbering)
(use-package rotate)
(require 'dash)

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
  (interactive "c[o] other window [0-9] go to window 0-9 [hjkl]/[bnpf] move point ←↑↓→ [R] change window size [r] Rotate\nP")
  (let ((case-fold-search nil))
    (cl-flet* ((char-in (char list)
                        (-any? (lambda (current-char) (char-equal char current-char))
                               list))
               (move-point-towards (char)
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
            ((move-point-towards option)
             (window-jump (move-point-towards option)))
            ((char-equal ?R option)
             (hydra-increase-window-size/body))
            ((char-equal ?r option)
             (call-interactively #'do-window-rotation))))))


(defhydra hydra-increase-window-size ()
  "Increase window size"
  ("h" (enlarge-window -1 t) "narrower")
  ("j" (enlarge-window +1 nil) "taller")
  ("k" (enlarge-window -1 nil) "shorter")
  ("l" (enlarge-window +1 t) "wider"))

(global-set-key "\C-co" 'other-window-directed)

;; We remove the default keybindings for window-numbering-mode
(-dotimes 10
  (lambda (n)
    (define-key window-numbering-keymap
      (kbd (concat "M-" (number-to-string n))) nil)))
