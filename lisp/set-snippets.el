;; personal snippets go in .emacs.d/snippets

(yas-global-mode 1)

;; keep YASnippet defaults and try out other snippets
;; (setq yas-snippet-dirs (append yas-snippet-dirs
;;                                '("~/path/to/snippets")))

(require 'angular-snippets)

(provide 'set-snippets)

;;     angular-snippets
;; |---------+---------------------|
;; | js-mode | html-mode           |
;; |---------+---------------------|
;; | $b      | ng-app              |
;; | $e      | ng-bind-html-unsafe |
;; | $f      | ng-bind-template    |
;; | $on     | ng-bind             |
;; | $v      | ng-change           |
;; | $va     | ng-checked          |
;; | $w      | ng-class-even       |
;; | ngc     | ng-class-odd        |
;; | ngd     | ng-class            |
;; | ngfa    | ng-click            |
;; | ngfi    | ng-cloak            |
;; | ngm     | ng-controller       |
;; | ngro    | ng-csp              |
;; | ngrw    | ng-dblclick         |
;; | ngrwr   | ng-disabled         |
;; | ngs     | ng-form             |
;; | ngw     | ng-hide             |
;; |         | ng-href             |
;; |         | ng-include          |
;; |         | ng-init             |
;; |         | ng-list             |
;; |         | ng-model            |
;; |         | ng-mousedown        |
;; |         | ng-mouseenter       |
;; |         | ng-mouseleave       |
;; |         | ng-mousemove        |
;; |         | ng-mouseover        |
;; |         | ng-mouseup          |
;; |         | ng-multiple         |
;; |         | ng-non-bindable     |
;; |         | ng-options          |
;; |         | ng-pluralize        |
;; |         | ng-readonly         |
;; |         | ng-repeat           |
;; |         | ng-selected         |
;; |         | ng-show             |
;; |         | ng-src              |
;; |         | ng-style            |
;; |         | ng-submit           |
;; |         | ng-switch           |
;; |         | ng-transclude       |
;; |         | ng-view             |
;; |---------+---------------------|
