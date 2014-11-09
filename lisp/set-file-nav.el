; better fuzzy matching for ido
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

;; (load (expand-relative-path "init-speedbar.el"))
;; (require 'graphene-speedbar)

(require 'dirtree)

;; dirtree tree-widget-themes are here:
;; /usrlocal/Cellar/emacs/24.3/share/emacs/24.3/etc/images/tree-widget
;; renamed default folder to use the plain ascii theme
;; can add new themes by adding images to a new folder
;; replace "folder" with new theme in dirtree.el:
;; (define-derived-mode dirtree-mode tree-mode "Dir-Tree" 
;;  "A mode to display tree of directory"
;;  (tree-widget-set-theme "folder"))

(add-to-list 'load-path (expand-relative-path "../packages/neotree"))
(require 'neotree)
(setq neo-window-width 35)
(global-set-key (kbd "C-x z") 'neotree-toggle)
(global-set-key (kbd "C-x C-z") 'neotree-dir)


(provide 'set-file-nav)
