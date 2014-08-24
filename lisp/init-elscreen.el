;; use elscreen for window tabs
;; evil-mode elscreen bindings in init-evil.el
(load "elscreen" "ElScreen" t)

;; default elscreen-prefix-key is "C-z"
;; conflicts with evil toggle emacs mode
(elscreen-set-prefix-key (kbd "C-c z"))
(setq elscreen-tab-display-kill-screen nil)

(provide 'init-elscreen)
