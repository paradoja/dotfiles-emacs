(defvar key-chord-prefixes
  "Key chord combination prefixes (initial keys)"
  '("º" "<"))

(defvar key-chord-combinations
  "Key chord combinations' final key"
  '(
    ("m" universal-argument) ; C-u... for those moments
    ("u" universal-argument) ; C-u... for those moments
    ("i" indent-region)
    ("," comment-or-uncomment-region)
    ("v" evil-mode)
    ("h" toggle-hightlight-indentation-mode)
    ("l" hl-line-mode)
    ("j" ace-jump-mode)
    ("k" ace-jump-char-mode)
    ("c" ace-mc-add-multiple-cursors)
    (" " whitespace-mode)
    ("s" subword-mode)
    ("-" helm-dash)
    ("." notmuch)
    ("," magit-status)
    ))

(defun set-chords-for-key (prefix-key &optional combinations)
  "Sets key chords for given keys"

  (let ((combs (or combinations key-chord-combinations)))
    (mapc
     (lambda (value-pair)
       (pcase-let ((`(,key-combination ,supplied-function) value-pair))
         (key-chord-define-global (concat prefix-key key-combination) supplied-function)))
     combs)))

(mapc #'set-chords-for-key key-chord-prefixes)
