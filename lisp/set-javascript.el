(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . web-mode))

;; turn off when using js2 as major mode
;; (add-hook 'js-mode-hook 'js2-minor-mode)

(setq-default js2-strict-missing-semi-warning nil)
(setq-default js2-basic-offset 2)

(defun jm-js-mode-handler ()
    (flycheck-mode)

    ;; using standard now, so turn off jshint and eslint
    ;; do i really need to do this?
    ;; (setq-default flycheck-disabled-checkers
    ;;               (append flycheck-disabled-checkers
    ;;                       '(javascript-jshint)
    ;;                       '(javascript-eslint)))

    (setq-default flycheck-disabled-checkers
                  (append flycheck-disabled-checkers
                          '(javascript-jshint)))

    ;; use rc file
    ;; (setq flycheck-jshintrc ".jshintrc")
    (setq flycheck-eslintrc ".eslintrc")

    ;; choose flycheck backend
    (flycheck-add-mode 'javascript-eslint 'js2-mode)
    ;; (flycheck-add-mode 'javascript-standard 'js2-mode)

    ;; tern bindings
    (local-set-key (kbd "C-c C-.") 'tern-find-definition)
    (local-set-key (kbd "C-c C-,") 'tern-pop-find-definition))

(add-hook 'js-mode-hook 'jm-js-mode-handler)
(add-hook 'js2-mode-hook 'jm-js-mode-handler)

(provide 'set-javascript)
