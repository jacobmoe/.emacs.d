;; show column and line in the modeline
(column-number-mode t)

;; diminish package - remove minor-mode info from modeline
(eval-after-load "undo-tree" '(diminish 'undo-tree-mode))
(eval-after-load "projectile" '(diminish 'projectile-mode))
(eval-after-load "smartparens" '(diminish 'smartparens-mode))

(provide 'set-modeline)
