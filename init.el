;; init-foo.el - package-specific configuration
;; set-bar.el - general config

;; ===========================================================================
;; helper functions
;; ===========================================================================

;; fix use of relative paths - http://ergoemacs.org/emacs/elisp_relative_path.html
(defun fullpath-relative-to-current-file (file-relative-path)
	(concat (file-name-directory (or load-file-name buffer-file-name)) file-relative-path))

;; ===========================================================================
;; package management 
;; ===========================================================================

(load (fullpath-relative-to-current-file "lisp/set-packages.el"))

(package-initialize)
                    
;; ===========================================================================
;; custom files & dirs 
;; ===========================================================================

;; stop leaving file~ all over the place. put all file backups in the same directory
(setq backup-directory-alist `(("." . "~/.emacs.d/file_backups")))

;; when using 'customize-*', set variables in custom.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
  
;; start-up buffer
(if window-system
  (setq initial-buffer-choice "~/notes"))

;; ===========================================================================
;; load modes and set defaults 
;; ===========================================================================

;; auto-completion for C-x C-f
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

;; show column and line above mini-buffer
(column-number-mode t)

 ;; remove tool-bar from GUI
(tool-bar-mode -1)

;; show line numbers
(global-linum-mode 1)

;; wrap text
;; (global-visual-line-mode 1)

;; set emacs shell PATH variable from system PATH
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; ===========================================================================
;; appearance  
;; ===========================================================================

(load (fullpath-relative-to-current-file "lisp/set-appearance.el"))
(load (fullpath-relative-to-current-file "lisp/init-whitespace.el"))

;; =========================================================================== 
;; text editing
;; ===========================================================================

(projectile-global-mode)
(global-set-key (kbd "C-c h") 'helm-projectile)

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)
						
(load (fullpath-relative-to-current-file "lisp/set-tabbing.el"))
(load (fullpath-relative-to-current-file "lisp/init-evil.el"))
(load (fullpath-relative-to-current-file "lisp/init-multiple-cursors.el"))
(load (fullpath-relative-to-current-file "lisp/init-expand-region.el"))

;; ===========================================================================
;; org-mode 
;; ===========================================================================

(load (fullpath-relative-to-current-file "lisp/init-org-mode.el"))
