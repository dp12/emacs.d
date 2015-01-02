;;----------------------------------------------------------------------------
;; Navigate window layouts
;;----------------------------------------------------------------------------
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

; Window swapping
(defun swap-windows ()
  "if you have 2 windows, it swaps them."
  (interactive)
  (cond ((not (= (count-windows) 2))
		 (message "you need exactly 2 windows to do this."))
		(t
		 (let* ((w1 (first (window-list)))
			    (w2 (second (window-list)))
				(b1 (window-buffer w1))
				(b2 (window-buffer w2))
				(s1 (window-start w1))
				(s2 (window-start w1)))
		   (set-window-buffer w1 b2)
		   (set-window-buffer w2 b1)
		   (set-window-start w1 s2)
		   (set-window-start w2 s1)
		   (if (eq (selected-window) w1)
			   (select-window w2)
			 (select-window w1))))))
(global-set-key (kbd "C-c w") 'swap-windows)

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
