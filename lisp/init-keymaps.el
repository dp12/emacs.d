;; Keymap Configurations (Hydra, Guide-key, and keychord)

;; Hydra
(require 'hydra)
(defhydra hydra-C-x-extended (global-map "C-x")
  "C-x rep"
  ("k" (lambda () (interactive) (kill-buffer nil)) "assassinate buffer" :color red)
  ("K" kill-buffer "kill buffer")
  ("l" my-expand-lines "hippie line")
  ("x" (lambda () (interactive) (kill-buffer nil)) "assassinate buffer" :color blue)
  ("n" git-gutter:next-hunk "next gut hunk")
  ("p" git-gutter:previous-hunk "prev gut hunk")
  ("q" nil "quit"))

(define-key evil-normal-state-map
 (kbd "C-e")
 (defhydra hydra-register (:color blue)
   "register"
   ("n" number-to-register "number")
   ("+" increment-register "increment")
   ("r" copy-rectangle-to-register "copy rectangle")
   ("s" copy-to-register "copy")
   ("p" point-to-register "point")
   ("j" jump-to-register "jump")
   ("i" insert-register  "insert")))

(defhydra hydra-window ()
  "window"
  ("s" (lambda () (interactive) (ace-window 4)) "swap" :color blue)
  ("S" (lambda () (interactive) (ace-window 4)) "swap" :color red)
  ("w" other-window "other")
  ("a" ace-window "ace")
  ("h" windmove-left "left" :)
  ("j" windmove-down "down")
  ("k" windmove-up "up")
  ("l" windmove-right "right")
  ("d" (lambda () (interactive) (ace-window 16)) "delete")
  ("q" nil "quit"))
(global-set-key (kbd "C-c w") 'hydra-window/body)

;; Guide-key
(require 'guide-key)
(diminish 'guide-key-mode)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x 5" "C-x v" "C-x j" "C-c"))
(guide-key-mode 1)
; Allow key chords
(require 'key-chord)
(key-chord-mode 1)

; Common
(key-chord-define-global "bj" 'bookmark-jump)
(key-chord-define-global "qr" 'query-replace)
(key-chord-define-global "BB" 'ido-switch-buffer)
(key-chord-define-global "VV" 'other-window)
(key-chord-define-global "vv" 'other-window)

; Helm
(key-chord-define-global "HG" 'helm-swoop)
(key-chord-define-global "HJ" 'helm-swoop)
(key-chord-define-global "HB" 'helm-bookmarks)

; Multiple Cursors
(key-chord-define-global "CN" 'mc/mark-next-like-this)
(key-chord-define-global "CP" 'mc/mark-previous-like-this)
(key-chord-define-global "CX" 'mc/mark-more-like-this-extended)

; Tagging
(key-chord-define-global "qg" 'ggtags-find-tag-dwim)
(key-chord-define-global "qw" 'pop-tag-mark)
(key-chord-define-global "QG" 'helm-gtags-dwim)
(key-chord-define-global "QW" 'helm-gtags-pop-stack)
; Cscope
;; (key-chord-define-global "qs" 'cscope-find-this-symbol)
;; (key-chord-define-global "QS" 'helm-cscope-find-this-symbol)
;; (key-chord-define-global "qd" 'cscope-find-global-definition)
;; (key-chord-define-global "qg" 'cscope-find-global-definition-no-prompting)
;; (key-chord-define-global "qc" 'cscope-find-functions-calling-this-function)
;; (key-chord-define-global "HC" 'helm-cscope-find-functions-calling-this-function)
;; (key-chord-define-global "QC" 'cscope-find-called-functions)
;; (key-chord-define-global "qf" 'cscope-find-this-file)
;; (key-chord-define-global "qq" 'cscope-next-symbol)
;; (key-chord-define-global "qp" 'cscope-prev-symbol)
;; (key-chord-define-global "QN" 'cscope-next-file)
;; (key-chord-define-global "QP" 'cscope-prev-file)
;; (key-chord-define-global "qw" 'cscope-pop-mark)
;; (key-chord-define-global "qb" 'cscope-display-buffer)
;; (key-chord-define-global "qk" 'cscope-quit)

; Special
(key-chord-define-global "TP" 'org-toggle-pretty-entities)
(key-chord-define-global "WM" 'whitespace-mode)

(provide 'init-keymaps)