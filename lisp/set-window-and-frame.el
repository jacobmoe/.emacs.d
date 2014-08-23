;; show column and line above mini-buffer
(column-number-mode t)

;; remove tool-bar from GUI
(tool-bar-mode -1)

;; show line numbers
(global-linum-mode 1)

;; highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#354043")

;; default window size
(setq default-frame-alist '((width . 88) (height . 49)))

;; highlight parens
(show-paren-mode t)

;; column beyond which automatic line-wrapping should happen
;; used by fill-column-indicator (fci-mode)
;; default is 70
(setq-default fill-column 80)

;; resize windows. default keybindings are C-x { and C-x }
(global-set-key (kbd "s-_") 'shrink-window-horizontally)
(global-set-key (kbd "s-+") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; use elscreen for window tabs
;; evil-mode elscreen bindings in init-evil.el
(load "elscreen" "ElScreen" t)

;; default elscreen-prefix-key is "C-z"
;; conflicts with evil toggle emacs mode
(elscreen-set-prefix-key (kbd "C-c z"))
(setq elscreen-tab-display-kill-screen nil)
