;; use spaces, not tabs
(setq-default indent-tabs-mode nil)
										
;; tab-width is the amount of space a tab occupies in the buffer
;; not how many spaces the tab key will add when indent-tabs-mode is nil
;; it is the distance between tab stops
(setq-default tab-width 2) 

;; the sequence of tab stops. for 4, use (number-sequence 4 120 4)
(setq tab-stop-list (number-sequence 2 120 2))

;; major-mode specific indent levels
(setq ruby-indent-level 2)
(setq css-indent-level 2)
(setq js-indent-level 2)

;; use indent-level for evil-shift-width
(add-hook 'ruby-mode-hook
  (function (lambda ()
    (setq evil-shift-width ruby-indent-level))))

(add-hook 'js-mode-hook
  (function (lambda ()
    (setq evil-shift-width js-indent-level))))

(add-hook 'jade-mode-hook
  (function (lambda ()
    (setq evil-shift-width 2))))

(add-hook 'haml-mode-hook
  (function (lambda ()
    (setq evil-shift-width haml-indent-offset))))
