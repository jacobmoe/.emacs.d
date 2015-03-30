;; ==== javascript ===========================================================

(defun config-company-tern()
  (company-mode t)
  (tern-mode t)
  (setq company-tern-property-marker "") ;; don't use circles to indicate objects
  (add-to-list 'company-backends 'company-tern))

(add-hook 'js2-mode-hook 'config-company-tern)

;; ==== ruby =================================================================

(defun config-company-robe()
  (company-mode t)
  (robe-mode t)
  (add-to-list 'company-robe 'company-backends))

(add-hook 'ruby-mode-hook 'config-company-robe)

(provide 'set-completion)
