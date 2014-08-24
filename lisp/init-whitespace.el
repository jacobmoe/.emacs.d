;; make whitespace-mode use just basic coloring

;; (setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))
(setq whitespace-display-mappings
  '(
    (space-mark 32 [183] [46]) 
    (newline-mark 10 [182 10])
    (tab-mark 9 [9655 9] [92 9])
    ))

;; (set-face-attribute 'whitespace-space nil :background nil :foreground "gray30")

(provide 'init-whitespace)
