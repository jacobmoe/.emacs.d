;; ===========================================================================
;; notes 
;; ===========================================================================

;; init-foo.el - package-specific configuration
;; set-bar.el - general config

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
    (message "Refreshed open files."))

(global-set-key (kbd "C-c q") 'revert-all-buffers)

;; ===========================================================================
;; package management 
;; ===========================================================================

(load (fullpath-relative-to-current-file "lisp/set-packages.el"))

;; ===========================================================================
;; special files & dirs 
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
;; appearance  
;; ===========================================================================

;; includes color themes, typeface, etc
(load (fullpath-relative-to-current-file "lisp/set-appearance.el"))

(load (fullpath-relative-to-current-file "lisp/init-whitespace.el"))

;; ===========================================================================
;; window and frame
;; ===========================================================================

;; show column and line above mini-buffer
(column-number-mode t)

;; remove tool-bar from GUI
(tool-bar-mode -1)

;; show line numbers
(global-linum-mode 1)

;; highlight current line
(global-hl-line-mode 1)

;; default window size
(setq default-frame-alist '((width . 88) (height . 49)))

;; column beyond which automatic line-wrapping should happen
;; used by fill-column-indicator (fci-mode)
;; default is 70
(setq-default fill-column 80)

;; resize windows. default keybindings are C-x { and C-x }
(global-set-key (kbd "s-_") 'shrink-window-horizontally)
(global-set-key (kbd "s-+") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

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
(setq elscreen-tab-display-kill-screen nil)

;; ===========================================================================
;; buffers, files and directories
;; ===========================================================================

;; better fuzzy matching for ido
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

;; *** THIS WILL BE THE DEFAULT IN 24.4 ***
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)


;; **NOTE** trying a bunch of tree-navs. 
;; haven't figured out which is best yet 
;; neotree, sr-speedbar (with config from graphene), dirtree
;; so far, neotree is closest to what i want
;; ideal would be to have one based on dired
;; might be able to do that using dired-subtree while hiding details

(load (fullpath-relative-to-current-file "lisp/init-speedbar.el"))
(require 'graphene-speedbar)

(require 'dirtree)

;; dirtree tree-widget-themes are here:
;; /usrlocal/Cellar/emacs/24.3/share/emacs/24.3/etc/images/tree-widget
;; renamed default folder to use the plain ascii theme
;; can add new themes by adding images to a new folder
;; replace "folder" with new theme in dirtree.el:
;; (define-derived-mode dirtree-mode tree-mode "Dir-Tree" 
;;  "A mode to display tree of directory"
;;  (tree-widget-set-theme "folder"))

(add-to-list 'load-path (fullpath-relative-to-current-file "packages/neotree"))
(require 'neotree)
(setq neo-window-width 35)
(global-set-key (kbd "C-x z") 'neotree-toggle)
(global-set-key (kbd "C-x C-z") 'neotree-dir)


(projectile-global-mode)

(load (fullpath-relative-to-current-file "lisp/init-helm.el"))

;; *** THIS PACKAGE CAN BE REMOVED IN 24.4 ***
;; replaced by dired-hide-details-mode
(require 'dired-details+)

;; so dired plays nice with evil
(define-key dired-mode-map "h" nil)
(define-key dired-mode-map "t" 'elscreen-next) ;; "gt" in evil
(define-key dired-mode-map "T" 'elscreen-previous) ;; "gT" in evil

;; ===========================================================================
;; shell
;; ===========================================================================

;; set emacs shell PATH variable from system PATH
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; =========================================================================== 
;; text editing
;; ===========================================================================

;; wrap text
;; (global-visual-line-mode 1)

(load (fullpath-relative-to-current-file "lisp/set-tabbing.el"))
(load (fullpath-relative-to-current-file "lisp/init-evil.el"))
(load (fullpath-relative-to-current-file "lisp/init-multiple-cursors.el"))
(load (fullpath-relative-to-current-file "lisp/init-expand-region.el"))

;; ===========================================================================
;; org-mode 
;; ===========================================================================

(load (fullpath-relative-to-current-file "lisp/init-org-mode.el"))

