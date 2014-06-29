;; ===========================================================================
;; notes 
;; ===========================================================================
;; init-foo.el - package-specific configuration
;; set-bar.el - general config

;; dirtree tree-widget-themes are here:
;; /usrlocal/Cellar/emacs/24.3/share/emacs/24.3/etc/images/tree-widget
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
;; load basic modes and set defaults 
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

;; wrap text
;; (global-visual-line-mode 1)

;; set emacs shell PATH variable from system PATH
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; *** THIS WILL BE THE DEFAULT IN 24.4 ***********************************
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; ===========================================================================
;; appearance  
;; ===========================================================================

;; includes window and buffer defaults, color themes, typeface, etc...
(load (fullpath-relative-to-current-file "lisp/set-appearance.el"))

(load (fullpath-relative-to-current-file "lisp/init-whitespace.el"))

;; ===========================================================================
;; file/directory/buffer navigation
;; ===========================================================================

(projectile-global-mode)
(global-set-key (kbd "C-c h") 'helm-projectile)

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; use elscreen for window tabs
;; evil-mode elscreen bindings in init-evil.el
(load "elscreen" "ElScreen" t)

;; default elscreen-prefix-key is "C-z"
;; conflicts with evil toggle emacs mode
(elscreen-set-prefix-key (kbd "C-c z"))

(require 'dirtree)

(add-to-list 'load-path (fullpath-relative-to-current-file "packages/neotree"))
(require 'neotree)
(global-set-key (kbd "C-x z") 'neotree-toggle)
(global-set-key (kbd "C-x C-z") 'neotree-dir)

;; *** THIS CAN BE REMOVED IN 24.4. REPLACED BY dired-hide-details-mode ***
(require 'dired-details+)

;; so dired plays nice with evil
(define-key dired-mode-map "t" 'elscreen-next)
(define-key dired-mode-map "T" 'elscreen-previous)
(define-key dired-mode-map "h" nil)

;; =========================================================================== 
;; text editing
;; ===========================================================================

(load (fullpath-relative-to-current-file "lisp/set-tabbing.el"))
(load (fullpath-relative-to-current-file "lisp/init-evil.el"))
(load (fullpath-relative-to-current-file "lisp/init-multiple-cursors.el"))
(load (fullpath-relative-to-current-file "lisp/init-expand-region.el"))

;; ===========================================================================
;; org-mode 
;; ===========================================================================

(load (fullpath-relative-to-current-file "lisp/init-org-mode.el"))
