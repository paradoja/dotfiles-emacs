(defvar key-chord-prefixes '("º" "<"))

(defun set-chords-for-key (key)
  "Sets key chords for given keys"

  (key-chord-define-global (concat key "m") 'universal-argument) ; C-u... for those moments
  (key-chord-define-global (concat key "u") 'universal-argument) ; C-u... for those moments
  (key-chord-define-global (concat key "i") 'indent-region)
  (key-chord-define-global (concat key ",") 'comment-or-uncomment-region)
  (key-chord-define-global (concat key "v") 'evil-mode)
  (key-chord-define-global (concat key "h") 'toggle-hightlight-indentation-mode)
  (key-chord-define-global (concat key "l") 'hl-line-mode)
  (key-chord-define-global (concat key "j") 'ace-jump-mode)
  (key-chord-define-global (concat key "k") 'ace-jump-char-mode)
  (key-chord-define-global (concat key "c") 'ace-mc-add-multiple-cursors)
  (key-chord-define-global (concat key " ") 'whitespace-mode)
  (key-chord-define-global (concat key "s") 'subword-mode)
  (key-chord-define-global (concat key "-") 'notmuch))

(mapc #'set-chords-for-key key-chord-prefixes)
