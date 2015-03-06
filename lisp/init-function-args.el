(require 'function-args)
(fa-config-default)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c-mode))
(set-default 'semantic-case-fold t)

;; Reclaim keybindings
(define-key function-args-mode-map (kbd "M-i") 'tab-to-tab-stop)
(define-key function-args-mode-map (kbd "M-w") 'fa-show)
(define-key function-args-mode-map (kbd "M-u") 'endless/upcase)
(define-key function-args-mode-map (kbd "M-W") 'fa-abort)
(provide 'init-function-args)
