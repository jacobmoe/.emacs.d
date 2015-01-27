;; inspect "package-activated-list" variable for all currenctly activated packages

(require 'package)
(package-initialize)

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
    multiple-cursors
    popup
    projectile
    pkg-info
    epl
    dash
    s
    sws-mode
    undo-tree
    magit
    restclient

    ;; == color themes ==================
    zenburn-theme
    color-theme
    ;; color-theme-sanityinc-tomorrow
    color-theme-solarized
    monokai-theme
    tangotango-theme
    flatland-theme

    exec-path-from-shell
    ack-and-a-half
    flx-ido
    helm
    helm-projectile
    ag
    fill-column-indicator
    dired-details ;; can be removed in 24.4
    dired-details+ ;; remove in 24.4
    dired-subtree
    neotree
    elscreen
    ess
    sass-mode
    stylus-mode
    jade-mode
    js2-mode
    smartparens
    evil-leader
    diminish
    key-chord
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

(provide 'set-packages)
