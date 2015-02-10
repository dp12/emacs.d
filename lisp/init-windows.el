;;----------------------------------------------------------------------------
;; Navigate window layouts
;;----------------------------------------------------------------------------
;; Ace-window
(require 'ace-window)
(defun def-rep-command (alist)
    "Return a lambda that calls the first function of ALIST.
It sets the transient map to all functions of ALIST,
allowing you to repeat those functions as needed."
    (lexical-let ((keymap (make-sparse-keymap))
                  (func (cdar alist)))
      (mapc (lambda (x)
              (when x
                (define-key keymap (kbd (car x)) (cdr x))))
            alist)
      (lambda (arg)
        (interactive "p")
        (when func
          (funcall func arg))
        (set-transient-map keymap t))))

(global-set-key (kbd "C-c w")
      (def-rep-command
       '(nil
         ("h" . windmove-left)
         ("l" . windmove-right)
         ("j" . windmove-down)
         ("k" . windmove-up)
         ("w" . other-window)
         ("a" . ace-window)
         ("s" . (lambda () (interactive) (ace-window 4)))
         ("d" . (lambda () (interactive) (ace-window 16)))
         )))

(setq winner-dont-bind-my-keys t)
(winner-mode 1)
;; copied from http://puntoblogspot.blogspot.com/2011/05/undo-layouts-in-emacs.html
(global-set-key (kbd "C-x 4 u") 'winner-undo)
(global-set-key (kbd "C-x 4 r") 'winner-redo)
(global-set-key (kbd "C-x <down>") 'winner-redo)
(global-set-key (kbd "C-x <up>") 'winner-undo)

; Wind-move
;; (windmove-default-keybindings 'meta)
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-c <up>") 'windmove-up)

;;----------------------------------------------------------------------------
;; When splitting window, show (other-buffer) in the new window
;;----------------------------------------------------------------------------
(defun split-window-func-with-other-buffer (split-function)
  (lexical-let ((s-f split-function))
    (lambda ()
      (interactive)
      (funcall s-f)
      (set-window-buffer (next-window) (other-buffer)))))

(global-set-key "\C-x2" (split-window-func-with-other-buffer 'split-window-vertically))
(global-set-key "\C-x3" (split-window-func-with-other-buffer 'split-window-horizontally))


;;----------------------------------------------------------------------------
;; Rearrange split windows
;;----------------------------------------------------------------------------
(defun split-window-horizontally-instead ()
  (interactive)
  (save-excursion
    (delete-other-windows)
    (funcall (split-window-func-with-other-buffer 'split-window-horizontally))))

(defun split-window-vertically-instead ()
  (interactive)
  (save-excursion
    (delete-other-windows)
    (funcall (split-window-func-with-other-buffer 'split-window-vertically))))

(global-set-key "\C-x|" 'split-window-horizontally-instead)
(global-set-key "\C-x_" 'split-window-vertically-instead)


(provide 'init-windows)
