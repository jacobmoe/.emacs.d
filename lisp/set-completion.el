;; === javascript ============================================================

(defun config-company-tern()
  (company-mode t)
  (tern-mode t)
  (setq company-tern-property-marker "") ;; don't use circles to indicate objects
  (add-to-list 'company-backends 'company-tern))

(add-hook 'js2-mode-hook 'config-company-tern)

(provide 'set-completion)
