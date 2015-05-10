;; company-go config in lisp/set-completion.el

(add-hook 'go-mode-hook (lambda ()
    (add-hook 'before-save-hook 'gofmt-before-save)
    (local-set-key (kbd "s-.") 'godef-jump)
    (local-set-key (kbd "s->") 'godef-jump-other-window)))

(provide 'set-golang)
