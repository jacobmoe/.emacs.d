(require 'package)

;; add package archives, in addition to gnu - http://elpa.gnu.org/packages/
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(defvar required-packages
	'(
		auto-complete
		evil
		expand-region
		go-mode
		goto-chg
		haml-mode
		highlight-indentation
		jade-mode
		multiple-cursors
		popup
		projectile
		pkg-info
		epl
		dash
		s
		sws-mode
		undo-tree
		zenburn-theme
    color-theme-sanityinc-tomorrow 
    color-theme-solarized 
    color-theme
		exec-path-from-shell
    ack-and-a-half
    flx-ido
    helm
    helm-projectile
    ag
    dirtree
    tree-mode
    windata
    fill-column-indicator
	))

(require 'cl)

; check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
  ; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))
