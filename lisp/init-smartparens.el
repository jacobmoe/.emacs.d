;; - some default config that comes with the package
(require 'smartparens-config)

(smartparens-global-mode 1)

(global-set-key (kbd "C-c s ;") 'sp-unwrap-sexp)

;; :wrap defines keybindings for the wrap
;; NOTE: also trying evil-surround which might
;; mean none of the following is needed
(sp-pair "(" ")" :wrap "C-)")
(sp-pair "(" ")" :wrap "C-c s )")

(sp-pair "\"" "\"" :wrap "C-\"")
(sp-pair "\"" "\"" :wrap "C-c s \"")

(sp-pair "'" "'" :wrap "C-c s '")
(sp-pair "`" "`" :wrap "C-c s `")
(sp-pair "{" "}" :wrap "C-c s }")
(sp-pair "[" "]" :wrap "C-c s ]")

(provide 'init-smartparens)
