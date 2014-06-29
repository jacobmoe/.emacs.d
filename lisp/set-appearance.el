;; ===========================================================================
;; window and buffer defaults
;; ===========================================================================

;; show column and line above mini-buffer
(column-number-mode t)

 ;; remove tool-bar from GUI
(tool-bar-mode -1)

;; show line numbers
(global-linum-mode 1)

;; highlight current line
(global-hl-line-mode 1)

;; default window size
(setq default-frame-alist '((width . 88) (height . 49)))

;; ===========================================================================
;; color themes
;; ===========================================================================

;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/solarized")

;; (load-theme 'solarized-dark t)
(load-theme 'sanityinc-tomorrow-night t)
;; (load-theme 'zenburn t)

;; ===========================================================================
;; typeface
;; ===========================================================================

;; (if window-system
  ;; (set-face-attribute 'default nil :font "-apple-Ubuntu_Mono-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1"))

;; ===========================================================================
;; transparency
;; ===========================================================================

;; set transparency for active window/inactive window
;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(100 98))
(add-to-list 'default-frame-alist '(alpha 100 98))

;; toggle transparency with 'C-c t'
(eval-when-compile (require 'cl))
 (defun toggle-transparency ()
   (interactive)
   (if (/=
        (cadr (frame-parameter nil 'alpha))
        100)
       (set-frame-parameter nil 'alpha '(100 100))
     (set-frame-parameter nil 'alpha '(99 95))))
 (global-set-key (kbd "C-c t") 'toggle-transparency)
 
