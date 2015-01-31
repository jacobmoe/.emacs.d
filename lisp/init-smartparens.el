;; - some default config that comes with the package
(require 'smartparens-config)

(smartparens-global-mode 1)

;; :wrap defines keybindings for the wrap
;; useful with evil-mode
(sp-pair "(" ")" :wrap "C-)")
(sp-pair "\"" "\"" :wrap "C-\"")

(provide 'init-smartparens)
