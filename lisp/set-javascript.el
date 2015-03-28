;; turn off js2 until i figure out why syntax checking
;; flags things that seem correct

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; turn off when using js2 as major mode
;; (add-hook 'js-mode-hook 'js2-minor-mode)

(setq-default js2-strict-missing-semi-warning nil)
(setq-default js2-basic-offset 2)

;; use flycheck for js-mode
(setq flycheck-jshintrc ".jshintrc")
(add-hook 'js-mode-hook 'flycheck-mode)
(add-hook 'js2-mode-hook 'flycheck-mode)

(provide 'set-javascript)
