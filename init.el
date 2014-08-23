;; init-foo.el - package-specific configuration
;; set-bar.el  - general config

;; ===========================================================================
;; helper functions
;; ===========================================================================

;; fix use of relative paths - http://ergoemacs.org/emacs/elisp_relative_path.html
(defun fullpath-relative-to-current-file (file-relative-path)
	(concat (file-name-directory 
    (or load-file-name buffer-file-name)) file-relative-path))

;; revert all buffers that are visiting a file.
;; useful after checking out a new git branch
(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name)
        (file-exists-p (buffer-file-name)) (not (buffer-modified-p)))
        (revert-buffer t t t) )))
  (message "Refreshed open files."))

;; ===========================================================================
;; package management 
;; ===========================================================================

(load (fullpath-relative-to-current-file "lisp/set-packages.el"))

;; ===========================================================================
;; special files & dirs 
;; ===========================================================================

;; stop leaving file~ all over the place. put file backups in one directory
;;  same for auto-save files (#filename#)
(defvar backup-dir (expand-file-name "~/.emacs.d/backups/"))
(defvar autosave-dir (expand-file-name "~/.emacs.d/autosaves/"))
(setq backup-directory-alist (list (cons ".*" backup-dir)))
(setq auto-save-list-file-prefix autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))

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

(load (fullpath-relative-to-current-file "lisp/set-window-and-frame.el"))

;; ===========================================================================
;; buffers, files and directories
;; ===========================================================================

(load (fullpath-relative-to-current-file "lisp/set-buffers.el"))
(load (fullpath-relative-to-current-file "lisp/set-file-nav.el"))
(load (fullpath-relative-to-current-file "lisp/init-projectile.el"))
(load (fullpath-relative-to-current-file "lisp/init-helm.el"))
(load (fullpath-relative-to-current-file "lisp/init-dired.el"))

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

;; ===========================================================================
;; languages and frameworks
;; ===========================================================================

;; R-mode
(require `ess-site)

(load (fullpath-relative-to-current-file "lisp/set-ruby.el"))
