;; ==== evil-leader package ==================================================

;; set "leader key"
(global-evil-leader-mode)
(setq evil-leader/in-all-states 1)

(evil-leader/set-leader ",")

(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)

;; ==== evil-surround ========================================================

(require 'evil-surround)
(global-evil-surround-mode 1)

;; ==== evil-mode ============================================================

(evil-mode 1)

;; setting hydras
(define-key evil-normal-state-map " " 'hydra-main/body)
(evil-define-key 'normal org-mode-map " " 'hydra-main-orgmode/body)
(evil-define-key 'normal dired-mode-map " " 'hydra-main-dired/body)
(evil-define-key 'normal js-mode-map " " 'hydra-main-js/body)
(evil-define-key 'normal js2-mode-map " " 'hydra-main-js/body)
(evil-define-key 'normal go-mode-map " " 'hydra-main-golang/body)

;; when long lines are wrapped, j/k navigation jumps the entire
;; "real" line instead of the visual line. don't do that.
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

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

;; key-chords
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

(provide 'init-evil)
