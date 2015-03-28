;; init-foo.el - package-specific configuration
;; set-bar.el  - general config

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; ===========================================================================
;; helper functions
;; ===========================================================================

;; - revert-all-buffers
(require 'set-defuns)

;; ===========================================================================
;; package management
;; ===========================================================================

;; - define required packages list
;; - install not yet installed required packages
(require 'set-packages)

;; ===========================================================================
;; special files & dirs
;; ===========================================================================

;; - define backup-dir and autosave-dir
;; - put backup and autosave files in them
;; - set custom.el for vars set using customize-*
;; - set start-up buffer
(require 'set-special-files-dirs)

;; ===========================================================================
;; appearance
;; ===========================================================================

;; - color themes and typeface
;; - transparency
(require 'set-appearance)

;; - try to make whitespace-mode less terrible
(require 'init-whitespace)

;; ===========================================================================
;; window and frame
;; ===========================================================================

;; - basic defaults like tool-bar-mode, linum-mode, etc
;; - key bindings for resizing a window
(require 'set-window-and-frame)

;; - use diminish to remove minor modes
;; - show column and line number
(require 'set-modeline)

;; (require 'init-elscreen)

;; ===========================================================================
;; buffers, files and directories
;; ===========================================================================

;; default C-x C-b is list-buffers. buffer-menu is better
(global-set-key (kbd "C-x C-b") 'buffer-menu)

;; - key-binding for revert-all-buffers
(require 'set-buffers)

;; - ido + flx and nav-tree
(require 'set-file-nav)
(require 'init-projectile)

;; - key-bindings for helm functions
;; - customize files shown in helm buffers
;; - helm fuzzy-matching
(require 'init-helm)

;; - key-bindings for dired and dired-subtree-insert
(require 'init-dired)

;; ===========================================================================
;; shell
;; ===========================================================================

;; problem: copy some text from outside of emacs. come back to emacs, kill
;; some text that you want to replace, and paste. nope - the contents of the
;; clipboard has been replaced by the the text you just killed. this var adds
;; the contents of the clipboard to the kill-ring first.
(setq save-interprogram-paste-before-kill t)

;; set emacs shell PATH variable from system PATH
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; ===========================================================================
;; text editing
;; ===========================================================================

(electric-indent-mode -1)

;; highlight parens
(show-paren-mode t)

;; start key-chord-mode
;; used in init-evil
(key-chord-mode 1)

;; wrap text
;; (global-visual-line-mode 1)

;; - key-bindings for force-tabbing
;; - use spaces, tab-width, tab-stop-list
;; - major-mode indent levels (MOVE THIS TO LANGUAGES AND FRAMEWORDS)
;; - language mode hooks. should also move this to langs and frameworks
(require 'set-tabbing)

;; - configure evil-leader
;; - configure evil-surround
;; - key-bindings for elscreen movement
;; - set mode-line color by evil state, and when buffer is dirty
;; - disable evil for some modes
(require 'init-evil)

(require 'init-multiple-cursors)
(require 'init-expand-region)
(require 'init-smartparens)

;; init yasnippet and other snippet packages
(require 'set-snippets)

(add-hook 'before-save-hook 'whitespace-cleanup)

;; ===========================================================================
;; version control
;; ===========================================================================

(require 'init-magit)

;; ===========================================================================
;; org-mode
;; ===========================================================================

;; - setting default
;; - add new keywords
;; - MobileOrg
(require 'init-org-mode)

;; ===========================================================================
;; languages and frameworks
;; ===========================================================================

(require 'ess-site) ;; comes with R-mode
(require 'set-ruby)

;; - flycheck using jshint for js files
(require 'set-javascript)
