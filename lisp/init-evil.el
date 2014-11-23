(evil-mode 1)

;;(define-key evil-normal-state-map (kbd "C-w t") 'elscreen-create) ;create tab
;;(define-key evil-normal-state-map (kbd "C-w x") 'elscreen-kill) ;kill tab
(define-key evil-normal-state-map "gT" 'elscreen-previous) ;previous tab
(define-key evil-normal-state-map "gt" 'elscreen-next) ;next tab

;; change mode-line color by evil state
;; and when buffer is dirty
(lexical-let ((default-color (cons (face-background 'mode-line)
                                   (face-foreground 'mode-line))))
    (add-hook 'post-command-hook
      (lambda ()
        (let ((color (cond ((minibufferp) default-color)
                           ((evil-insert-state-p) '("#006fa0" . "#ffffff"))
                           ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                           ((buffer-modified-p)   '("#e80000" . "#ffffff"))
                           (t default-color))))
          (set-face-background 'mode-line (car color))
          (set-face-foreground 'mode-line (cdr color))))))

;; http://stackoverflow.com/questions/23798021/disabling-evil-mode-for-nav-in-emacs-or-any-read-only-buffers
(add-to-list 'evil-emacs-state-modes 'nav-mode)

(provide 'init-evil)
