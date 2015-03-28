;; inspect "package-activated-list" variable for all currenctly activated packages

(require 'package)
(package-initialize)

;; packages directory has packages not installed through the package manager
(add-to-list 'load-path
  (expand-file-name "packages/" user-emacs-directory))

;; add package archives, in addition to gnu - http://elpa.gnu.org/packages/
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)

(defvar required-packages
  '(
    ;; misc
    restclient
    exec-path-from-shell ;; use $PATH from system in emacs shell

    ;; windows and buffers
    elscreen
    diminish
    fill-column-indicator
    highlight-indentation

    ;;version control
    magit

    ;; project and file management
    projectile
    dired-details
    dired-details+
    dired-subtree
    neotree
    ack-and-a-half
    ag
    flx-ido
    helm
    helm-projectile

    ;; text editing
    evil
    evil-leader
    evil-surround
    undo-tree
    smartparens
    key-chord
    flycheck
    expand-region
    company
    tern
    company-tern
    multiple-cursors

    ;; themes
    zenburn-theme
    color-theme

    ;; color-theme-sanityinc-tomorrow
    color-theme-solarized
    monokai-theme
    tangotango-theme
    flatland-theme

    ;; language modes
    ess
    sass-mode
    scss-mode
    stylus-mode
    jade-mode
    haml-mode
    js2-mode
    go-mode
    yaml-mode

    ;; snippets
    yasnippet
    angular-snippets

    ;; elisp
    dash
    s
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
