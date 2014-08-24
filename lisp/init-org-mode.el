;; unset C-tab to use tab-to-tab-stop (set in set-tabbing.el)
;; default is org-force-cycle-archived
(add-hook 'org-mode-hook (lambda () (local-unset-key (kbd "<C-tab>"))))

;; set visual line mode 
(add-hook 'org-mode-hook (lambda () (visual-line-mode 1)))

;; syntax highlight code blocks
(setq org-src-fontify-natively t)

 ;; setting extra org-mode keywords
(setq org-todo-keywords
           '((sequence "TODO(t)" "|" "DONE(d)")
             (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
             (sequence "|" "CANCELED(c)" "STARTED(s)" "NOTE(n)" "QUESTION(q)")))
(setq org-todo-keyword-faces
			'(("TODO" . org-warning) 
				("NOTE" . (:background "orange" :foreground "black"))
				("CANCELED" . (:foreground "blue" :weight bold))
				("STARTED" . (:foreground "green"))
				("QUESTION" . (:foreground "purple"))))

;; Org-mode file-directory
(setq org-directory "~/notes")

;; MobileOrg setup
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
(setq org-agenda-files '("~/notes/test.org"))
(setq org-mobile-files '(
			 "~/notes/twg/demos.org"
			 "~/notes/daily.org"
			 "~/notes/general_notes.org"))
(setq org-mobile-inbox-for-pull "~/notes/inbox.org")

(provide 'init-org-mode)
