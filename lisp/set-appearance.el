;; ===========================================================================
;; color themes
;; ===========================================================================

(add-to-list 'load-path "~/.emacs.d/packages/color-theme-sanityinc-tomorrow/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/packages/color-theme-sanityinc-tomorrow/")

;; (load-theme 'solarized-dark t)
;; (load-theme 'sanityinc-tomorrow-night t)
;; (load-theme 'zenburn t)
;; (load-theme 'monokai t)
;; (load-theme 'tangotango t)
(load-theme 'flatland t)

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
 
