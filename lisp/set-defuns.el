;; fullpath-relative-to-current-file
;; http://ergoemacs.org/emacs/elisp_relative_path.html
(defun expand-relative-path (file-relative-path)
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

(provide 'set-defuns)
