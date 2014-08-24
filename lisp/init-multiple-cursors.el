;; https://github.com/magnars/multiple-cursors.el
;; (require 'multiple-cursors)

;; with active region that spans multiple lines, add a cursor to each line:
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;; add multiple cursors not based on continuous lines, but based on keywords in the buffer:
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-dwim)

(provide 'init-multiple-cursors)
