;; set C-tab to tab with quoted-insert
;; unsetting local binding for this in init-org-mode.el
(global-set-key (kbd "<C-tab>") 'tab-to-tab-stop)

;; use spaces, not tabs
(setq-default indent-tabs-mode nil)

;; tab-width is the amount of space a tab occupies in the buffer
;; not how many spaces the tab key will add when indent-tabs-mode is nil
;; it is the distance between tab stops
(setq-default tab-width 2)

;; the sequence of tab stops. for 4, use (number-sequence 4 120 4)
(setq tab-stop-list (number-sequence 2 120 2))

;; major-mode specific indent levels
(setq default-indent-level 2)
(setq ruby-indent-level 2)
(setq css-indent-level 2)
(setq js-indent-level 2)

;; use indent-level for evil-shift-width

(add-hook 'ruby-mode-hook
  (function (lambda ()
    (setq evil-shift-width default-indent-level))))

(add-hook 'js-mode-hook
  (function (lambda ()
    (setq evil-shift-width js-indent-level))))

(add-hook 'js2-mode-hook
  (function (lambda ()
    (setq evil-shift-width js-indent-level))))

(add-hook 'web-mode-hook
  (function (lambda ()
    (setq evil-shift-width js-indent-level)
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2))))

(add-hook 'jade-mode-hook
  (function (lambda ()
    (setq evil-shift-width default-indent-level))))

(add-hook 'haml-mode-hook
  (function (lambda ()
    (setq evil-shift-width haml-indent-offset))))

(add-hook 'erb-mode-hook
  (function (lambda ()
    (setq evil-shift-width default-indent-level))))

(add-hook 'html-mode-hook
  (function (lambda ()
    (setq evil-shift-width default-indent-level))))

(add-hook 'css-mode-hook
  (function (lambda ()
    (setq evil-shift-width default-indent-level))))

(add-hook 'scss-mode-hook
  (function (lambda ()
    (setq evil-shift-width default-indent-level))))

(add-hook 'go-mode-hook
  (function (lambda ()
    (setq evil-shift-width default-indent-level))))

(provide 'set-tabbing)
