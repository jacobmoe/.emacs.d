(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . web-mode))

;; turn off when using js2 as major mode
;; (add-hook 'js-mode-hook 'js2-minor-mode)

(setq-default js2-strict-missing-semi-warning nil)
(setq-default js2-basic-offset 2)

(defun js-mode-handler ()
    (flycheck-mode)

    ;; we're using eslint now, so turn off jshint
    (setq-default flycheck-disabled-checkers
    (append flycheck-disabled-checkers
        '(javascript-jshint)))

    ;; use flycheck for js-mode
    ;; (setq flycheck-jshintrc ".jshintrc")
    (setq flycheck-eslintrc ".eslintrc")

    ;; use eslint with flycheck
    (flycheck-add-mode 'javascript-eslint 'js2-mode)

    (local-set-key (kbd "C-c C-.") 'tern-find-definition)
    (local-set-key (kbd "C-c C-,") 'tern-pop-find-definition))

(add-hook 'js-mode-hook 'js-mode-handler)
(add-hook 'js2-mode-hook 'js-mode-handler)

(provide 'set-javascript)
