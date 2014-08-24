;; stop leaving file~ all over the place. put file backups in one directory
;;  same for auto-save files (#filename#)
(defvar backup-dir (expand-file-name "backups/" user-emacs-directory))
(defvar autosave-dir (expand-file-name "autosaves/" user-emacs-directory))
(setq backup-directory-alist (list (cons ".*" backup-dir)))
(setq auto-save-list-file-prefix autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))

;; when using 'customize-*', set variables in custom.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
  
;; start-up buffer
(if window-system
  (setq initial-buffer-choice "~/notes"))

(provide 'set-special-files-dirs)
