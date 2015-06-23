(defun company-mode-handler ()
  (global-set-key (kbd "C-c C-;") 'company-complete))

(add-hook 'company-mode-hook 'company-mode-handler)

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
  (add-to-list 'company-backends 'company-robe))

(add-hook 'ruby-mode-hook 'config-company-robe)

;; ==== golang ===============================================================

(defun config-company-go()
  (company-mode t)
  (set (make-local-variable 'company-backends) '(company-go)))

(add-hook 'ruby-mode-hook 'config-company-go)

(provide 'set-completion)
