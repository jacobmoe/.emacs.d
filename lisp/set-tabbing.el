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
(setq css-indent-offset 2)
(setq js-indent-offset 2)
