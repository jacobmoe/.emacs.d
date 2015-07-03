;; keybindings for hydra-main found in *init-evil* and *init-dired*

(defhydra hydra-main (:color blue :hint nil)
 ("p" hydra-projectile/body "projectile" :exit t)
 ("m" hydra-magit/body "magit" :exit t)
 ("w" hydra-window-buffer/body "window" :exit t)
 ("x" execute-extended-command "M-x" :exit t)
 ("1" (find-file "~/code/twg/s-trip") "s-trip" :exit t)
 ("2" (find-file "~/code/twg/s-trip/karma-frontend") "karma-frontend" :exit t)
 ("q" nil "quit"))

(defhydra hydra-projectile (:color blue :hint nil)
  ("h" projectile-dired "project root" :exit t)
  ("s" projectile-ag "ag" :exit t)
  ("f" helm-projectile-find-file "find file" :exit t)
  ("k" projectile-kill-buffers "kill project buffers" :exit t)
  ("q" nil "quit"))

(defhydra hydra-magit (:color blue :hint nil)
  ("s" magit-status "status" :exit t)
  ("b" magit-blame-mode "blame mode" :exit t)
  ("q" nil "quit"))

(defhydra hydra-window-buffer (:color red :hint nil)
"
 ^Window^             ^Buffer^           ^Frame^
^^^^^^^^---------------------------------------------------
 ^hjkl^: move         _p_: previous      _u_: winner undo      ....../ \-.   .
 _s_: split below     _n_: next          _r_: winner redo   .-/     (    o\.//
 _v_: split right     _b_: switch        ^ ^                 |  ...  \./\---'
 _c_: delete this     _;_: last          ^ ^                 |.||  |.||
 _o_: delete other    _K_: kill current  ^ ^
^^^^^^^^
"
  ("w" revert-all-buffers)

  ("u" winner-undo)
  ("r" winner-redo)

  ("h" windmove-left)
  ("j" windmove-down)
  ("k" windmove-up)
  ("l" windmove-right)

  ("p" previous-buffer)
  ("n" next-buffer)
  ("b" ido-switch-buffer)
  (";" mode-line-other-buffer :color blue)

  ("s" split-window-below)
  ("v" split-window-right)

  ("K" kill-this-buffer)

  ("c" delete-window)
  ("o" delete-other-windows :color blue)

  ;; ("H" hydra-move-splitter-left)
  ;; ("J" hydra-move-splitter-down)
  ;; ("K" hydra-move-splitter-up)
  ;; ("L" hydra-move-splitter-right)

  ("q" nil))

(defhydra hydra-multiple-cursors (:hint nil)
  "
 ^Up^            ^Down^        ^Miscellaneous^
----------------------------------------------
[_p_]   Next    [_n_]   Next    [_l_] Edit lines
[_P_]   Skip    [_N_]   Skip    [_a_] Mark all
[_M-p_] Unmark  [_M-n_] Unmark  [_q_] Quit"
  ("l" mc/edit-lines :exit t)
  ("a" mc/mark-all-like-this :exit t)
  ("n" mc/mark-next-like-this)
  ("N" mc/skip-to-next-like-this)
  ("M-n" mc/unmark-next-like-this)
  ("p" mc/mark-previous-like-this)
  ("P" mc/skip-to-previous-like-this)
  ("M-p" mc/unmark-previous-like-this)
  ("q" nil))

(defhydra hydra-org (:color red :hint nil)
  "
Navigation^
---------------------------------------------------------
_j_ next heading
_k_ prev heading
_h_ next heading (same level)
_l_ prev heading (same level)
_u_p higher heading
_g_o to
"
  ("j" outline-next-visible-heading)
  ("k" outline-previous-visible-heading)
  ("h" org-forward-heading-same-level)
  ("l" org-backward-heading-same-level)
  ("u" outline-up-heading)
  ("g" org-goto :exit t))

(provide 'init-hydra)
