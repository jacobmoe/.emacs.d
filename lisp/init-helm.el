(require 'helm)
(require 'helm-config)
(require 'helm-files)
(require 'helm-grep)

(global-unset-key (kbd "s-t"))
(global-set-key (kbd "s-t") 'helm-projectile)

(global-set-key (kbd "C-c h p") 'helm-projectile) ;; same as C-c p h
(global-set-key (kbd "C-c h k") 'helm-show-kill-ring)
(global-set-key (kbd "C-c h b") 'helm-mini) ;; open buffers
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-c h x") 'helm-M-x)
(global-set-key (kbd "C-c h f") 'helm-find-files)
(global-set-key (kbd "C-c h m") 'helm-man-woman) ;; search man pages
(global-set-key (kbd "C-c h g") 'helm-do-grep)

; do not show these files in helm buffer
(setq helm-boring-file-regexp-list '("\\.git$" "\\.hg$"))

(setq helm-buffers-fuzzy-matching t)

(provide 'init-helm)
