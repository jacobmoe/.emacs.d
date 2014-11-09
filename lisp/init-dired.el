;; *** THIS PACKAGE CAN BE REMOVED IN 24.4 ***
;; replaced by dired-hide-details-mode

(require 'dired-details+)

;; (defun enable-dired-hide-details-mode () (dired-hide-details-mode 1))
;; (add-hook 'dired-mode-hook 'enable-dired-hide-details-mode)

;; dired-subtree-insert inserts the subdir with details visible
;; even with dired-details+ hiding the details of the parent
;; using revert-buffer (hitting "g" in dired) fixes it
;; might not be needed in 24.4 with dired-hide-details-mode on?

(defun dired-subtree-insert-and-revert-buffer ()
  (interactive)
  (dired-subtree-insert)
  (revert-buffer))

(define-key dired-mode-map (kbd "<tab>") 'dired-subtree-insert-and-revert-buffer)
(define-key dired-mode-map (kbd "q") 'dired-subtree-remove)

;; so dired plays nice with evil
(define-key dired-mode-map "h" nil)
(define-key dired-mode-map "t" 'elscreen-next) ;; "gt" in evil
(define-key dired-mode-map "T" 'elscreen-previous) ;; "gT" in evil

(provide 'init-dired)
