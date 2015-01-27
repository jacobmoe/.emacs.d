(global-evil-leader-mode)
(setq evil-leader/in-all-states 1)

(evil-leader/set-leader ",")

(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)

(provide 'init-evil-leader)
