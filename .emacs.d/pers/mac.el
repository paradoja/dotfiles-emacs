; Garantizamos que la tecla de comandos en emacs se coge como
; Meta. Esto debería funcionar en la mayoría de Mac OS X.
(setq mac-option-key-is-meta t)
(setq ns-command-modifier 'meta)

; El alt izquierdo actúa como alt.
(setq mac-option-modifier 'nil)

; El alt derecho funciona como alt.
(setq mac-right-option-modifier nil)

; Le decimos que no abra nuevos frames para cada fichero abierto.
(setq ns-pop-uop-frames 'nil)
