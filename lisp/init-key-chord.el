;; KeyCHORD Configurations

; Allow key chords
(require 'key-chord)
(key-chord-mode 1)

; Common
(key-chord-define-global "bj" 'bookmark-jump)
(key-chord-define-global "qr" 'query-replace)
(key-chord-define-global "BB" 'ido-switch-buffer)
(key-chord-define-global "VV" 'other-window)
(key-chord-define-global "WW" 'other-window)

; Helm
(key-chord-define-global "HH" 'helm-mini)
(key-chord-define-global "HS" 'helm-swoop)
(key-chord-define-global "HG" 'helm-do-ag)
(key-chord-define-global "HM" 'helm-multi-swoop-all)
(key-chord-define-global "HB" 'helm-bookmarks)

; Multiple Cursors
(key-chord-define-global "MN" 'mc/mark-next-like-this)
(key-chord-define-global "MP" 'mc/mark-previous-like-this)
(key-chord-define-global "MX" 'mc/mark-more-like-this-extended)

; Cscope
(key-chord-define-global "qs" 'cscope-find-this-symbol)
(key-chord-define-global "QS" 'helm-cscope-find-this-symbol)
(key-chord-define-global "qd" 'cscope-find-global-definition)
(key-chord-define-global "qg" 'cscope-find-global-definition-no-prompting)
(key-chord-define-global "qc" 'cscope-find-functions-calling-this-function)
(key-chord-define-global "HC" 'helm-cscope-find-functions-calling-this-function)
(key-chord-define-global "QC" 'cscope-find-called-functions)
(key-chord-define-global "qf" 'cscope-find-this-file)
(key-chord-define-global "qq" 'cscope-next-symbol)
(key-chord-define-global "qp" 'cscope-prev-symbol)
(key-chord-define-global "QN" 'cscope-next-file)
(key-chord-define-global "QP" 'cscope-prev-file)
(key-chord-define-global "qw" 'cscope-pop-mark)
(key-chord-define-global "qb" 'cscope-display-buffer)
(key-chord-define-global "qk" 'cscope-quit)

; Special
(key-chord-define-global "TP" 'org-toggle-pretty-entities)
(key-chord-define-global "WM" 'whitespace-mode)

(provide 'init-key-chord)