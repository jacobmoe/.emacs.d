;; -- color themes -----------------------------------------------------------

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/solarized")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/tomorrow")

;; (load-theme 'solarized-dark t)
;; (load-theme 'tomorrow-night-blue t)
(load-theme 'zenburn t)

;; -- typeface ---------------------------------------------------------------

(if window-system
  (set-face-attribute 'default nil :font "-apple-Ubuntu_Mono-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1"))

;; -- default window size ---------------------------------------------------- 

(setq default-frame-alist '(
                (width . 88)
                (height . 49) ))

;; -- transparency -----------------------------------------------------------

;; set transparency for active window/inactive window
;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(99 95))
(add-to-list 'default-frame-alist '(alpha 99 95))

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

;; set colors for ansi-term (should be fixed in 24.2 eventually)
(setq ansi-term-color-vector [unspecified "#3f3f3f" "#cc9393" "#7f9f7f" "#f0dfaf" "#8cd0d3" "#dc8cc3" "#93e0e3" "#dcdccc"])
