;; ===========================================================================
;; notes 
;; ===========================================================================
;; init-foo.el - package-specific configuration
;; set-bar.el - general config

;; dirtree tree-widget-themes are here:
;; /usr/local/Cellar/emacs/24.3/share/emacs/24.3/etc/images/tree-widget
;; renamed default folder to use the plain ascii theme
;; can add new themes by adding images to a new folder
;; replace "folder" with new theme in dirtree.el:
;; (define-derived-mode dirtree-mode tree-mode "Dir-Tree"
;;  "A mode to display tree of directory"
;;  (tree-widget-set-theme "folder"))

;; ===========================================================================
;; helper functions
;; ===========================================================================

;; fix use of relative paths - http://ergoemacs.org/emacs/elisp_relative_path.html
(defun fullpath-relative-to-current-file (file-relative-path)
	(concat (file-name-directory (or load-file-name buffer-file-name)) file-relative-path))

;; revert all buffers that are visiting a file.
;; useful after checking out a new git branch
(defun revert-all-buffers ()
    "Refreshes all open buffers from their respective files."
    (interactive)
    (dolist (buf (buffer-list))
      (with-current-buffer buf
        (when (and (buffer-file-name) (file-exists-p (buffer-file-name)) (not (buffer-modified-p)))
          (revert-buffer t t t) )))
    (message "Refreshed open files.") )

(global-set-key (kbd "C-c q") 'revert-all-buffers)

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

;; column beyond which automatic line-wrapping should happen
;; used by fill-column-indicator (fci-mode)
;; default is 70
(setq-default fill-column 80)

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

;; highlight current line
(global-hl-line-mode 1)

;; wrap text
;; (global-visual-line-mode 1)

;; set emacs shell PATH variable from system PATH
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; dirtree
(require 'dirtree)

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
