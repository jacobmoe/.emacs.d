;; unset C-tab to use tab-to-tab-stop (set in set-tabbing.el)
;; default is org-force-cycle-archived

(defun set-org-preferences()
    ;; set visual line mode
    (visual-line-mode 1)

    ;; using this binding for tab-to-tab-stop (force a tab)
    (local-unset-key (kbd "<C-tab>"))

(add-hook 'org-mode-hook 'set-org-preferences)

;; no to wysiwygs! don't hide markup for hyperlinks: [[http:mylink.com][my-link]]
(setq org-descriptive-links nil)

;; syntax highlight code blocks
(setq org-src-fontify-natively t)

;; setting extra org-mode keywords
(setq org-todo-keywords
        '((sequence "TODO(t)" "|" "DONE(d)")
            (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
            (sequence "RUN(r)" "GYM(g)")
            (sequence "|" "CANCELED(c)" "STARTED(s)" "NOTE(n)"  "QUESTION(q)")))

(setq org-todo-keyword-faces
    '(("TODO" . org-warning)
        ("NOTE" . (:background "orange" :foreground "black"))
        ("CANCELED" . (:foreground "blue" :weight bold))
        ("STARTED" . (:foreground "green"))
        ("RUN" . (:foreground "yellow"))
        ("GYM" . (:foreground "yellow"))
        ("QUESTION" . (:foreground "purple"))))

;; Org-mode file-directory
(setq org-directory "~/notes")

;; MobileOrg setup
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
(setq org-agenda-files '("~/notes/test.org"))
(setq org-mobile-files '(
    (concat org-directory "/twg/demos.org")
    (concat org-directory "/daily.org")
    (concat org-directory "/general_notes.org")))
(setq org-mobile-inbox-for-pull "~/notes/inbox.org")

;; org-capture
(setq org-default-notes-file (concat org-directory "/gtd/notes.org"))
(global-set-key (kbd "C-c r") 'org-capture)

(setq org-capture-templates
    '(("t" "Todo" entry (file+headline (concat org-directory "/gtd/notes.org") "Tasks")
        "* TODO %?\n%u %i\n")
    ("m" "Music" entry (file+headline (concat org-directory "/gtd/notes.org") "Music")
        "* TODO %?\n %i\n")
    ("M" "Movie" entry (file+headline (concat org-directory "/gtd/notes.org") "Movies")
        "* TODO %?\n %i\n")
    ("L" "Learn" entry (file+headline (concat org-directory "/gtd/notes.org") "Learn")
        "* TODO %?\n %i\n")
    ("f" "Fear" entry (file+headline (concat org-directory "/gtd/notes.org") "Fear")
        "* %u\n %? %i\n")
    ("l" "Link" entry (file+headline (concat org-directory "/gtd/notes.org") "Links")
        "* %? \n%i\n")
    ("i" "Idea" entry (file+headline (concat org-directory "/gtd/notes.org") "Ideas")
        "* %? \n%i\n")
    ("b" "Book" entry (file+headline (concat org-directory "/gtd/notes.org") "Books")
        "* TODO %?\n %i\n")))
)

(provide 'init-org-mode)
