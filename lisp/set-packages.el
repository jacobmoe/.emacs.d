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
    ("restclient"           "misc" "" "restclient")
    ("exec-path-from-shell" "misc" "" "use $PATH from system in emacs shell")
    ("hydra"                "misc" "" "hydra")

    ;; windows and buffers
    ("diminish"              "windows and buffers" "" "diminish")
    ("fill-column-indicator" "windows and buffers" "" "fill-column-indicator")
    ("highlight-indentation" "windows and buffers" "" "highlight-indentation")

    ;;version control
    ("magit"                 "version control" "" "magit")

    ;; project and file management
    ("projectile"      "projects and files" "" "projectile")
    ("dired-details"   "projects and files" "" "dired-details")
    ("dired-details+"  "projects and files" "" "dired-details+")
    ("dired-subtree"   "projects and files" "" "dired-subtree")
    ("neotree"         "projects and files" "" "neotree")
    ("ack-and-a-half"  "projects and files" "" "ack-and-a-half")
    ("ag"              "projects and files" "" "ag")
    ("flx-ido"         "projects and files" "" "flx-ido")
    ("helm"            "projects and files" "" "helm")
    ("helm-projectile" "projects and files" "" "helm-projectile")

    ;; text editing
    ("evil"             "text editing" "" "evil")
    ("evil-leader"      "text editing" "" "evil-leader")
    ("evil-surround"    "text editing" "" "evil-surround")
    ("undo-tree"        "text editing" "" "undo-tree")
    ("smartparens"      "text editing" "" "smartparens")
    ("key-chord"        "text editing" "" "key-chord")
    ("let-alist"        "text editing" "" "flycheck dependency. might be able to remove.")
    ("flycheck"         "text editing" "" "flycheck")
    ("expand-region"    "text editing" "" "expand-region")
    ("multiple-cursors" "text editing" "" "multiple-cursors")

    ;; completion and snippets
    ("company"   "completion-and-snippets" "" "company")
    ("yasnippet" "completion-and-snippets" "" "yasnippet")

    ;; themes
    ("zenburn-theme"                  "themes" "" "zenburn-theme")
    ("color-theme"                    "themes" "" "color-theme")
    ("color-theme-sanityinc-tomorrow" "themes" "" "color-theme-sanityinc-tomorrow")
    ("color-theme-solarized"          "themes" "" "color-theme-solarized")
    ("monokai-theme"                  "themes" "" "monokai-theme")
    ("tangotango-theme"               "themes" "" "tangotango-theme")
    ("flatland-theme"                 "themes" "" "flatland-theme")
    ("seti-theme"                     "themes" "" "seti-theme")
    ("material-theme"                 "themes" "" "material-theme")

    ;; language related modes
    ;;; javascript
    ("js2-mode"     "javascript" "" "js2-mode")
    ("tern"         "javascript" "" "tern")
    ("company-tern" "javascript" "" "company-tern")
    ("web-mode"     "javascript" "" "web-mode")
    ;;; ruby
    ("inf-ruby"     "ruby" "" "inf-ruby")
    ("robe"         "ruby" "" "robe")
    ("rspec-mode"   "ruby" "" "rspec")
    ;;; r
    ("ess"          "r" "" "ess")
    ;;; go
    ("go-mode"      "go" "" "go-mode")
    ("company-go"   "go" "" "company-go")
    ;;; preprocessors
    ("sass-mode"    "preprocessors" "" "sass-mode")
    ("scss-mode"    "preprocessors" "" "scss-mode")
    ("stylus-mode"  "preprocessors" "" "stylus-mode")
    ("jade-mode"    "preprocessors" "" "jade-mode")
    ("haml-mode"    "preprocessors" "" "haml-mode")
    ("yaml-mode"    "preprocessors" "" "yaml-mode")
    ;;; elisp
    ("dash"         "elisp" "" "dash")
    ("s"            "elisp" "" "s")
  ))

(require 'cl)

;; TODO working on this method
;; it will create an org-mode table using the required-packages alist
;; to be inserted into the README as package documentation
;; use mapconcat

(defun required-packages-docs-table ()
  (setq table-head "|-|-|\n")
  (setq result "")
  (loop for value in required-packages
        do (setq result (concat result "|" (nth 0 value) "|" (nth 3 value) "|\n")))
  (insert (concat table-head result table-head)))

;; ;; which version to use???
;; ;; package names should be strings and use (intern p) to cast to symbol
;; (defun set-packages-get-docs-as-table ()
;;   (setq result "|-|-|\n")
;;   (loop for (key . value) in required-packages
;;         do (setq result (concat result "|" (nth 2 value) "|" (nth 0 value) "|\n"))
;;   (insert result)))

; check if all packages are installed
(defun packages-installed-p ()
  (loop for p in (mapcar 'car required-packages)
        when (not (package-installed-p (intern p))) do (return nil)
        finally (return t)))

; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
  ; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ; install the missing packages
  (dolist (p (mapcar 'car required-packages))
    (when (not (package-installed-p (intern p)))
      (package-install (intern p)))))

(provide 'set-packages)
