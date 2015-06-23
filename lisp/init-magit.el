(setq magit-last-seen-setup-instructions "1.4.0")

(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m m") 'magit-branch-manager)
(global-set-key (kbd "C-c m l") 'magit-blame-mode)
(global-set-key (kbd "C-c m f") 'magit-file-log)
(global-set-key (kbd "C-c m d") 'magit-diff-working-tree)

(provide 'init-magit)
