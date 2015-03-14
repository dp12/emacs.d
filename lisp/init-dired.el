(require 'dired-details)
(dired-details-install)

(defun diredext-exec-git-command-in-shell (command &optional arg file-list)
  "Run a shell command `git COMMAND`' on the marked files.
if no files marked, always operate on current line in dired-mode
"
  (interactive
   (let ((files (dired-get-marked-files t current-prefix-arg)))
     (list
      ;; Want to give feedback whether this file or marked files are used:
      (dired-read-shell-command "git command on %s: " current-prefix-arg files)
      current-prefix-arg
      files)))
  (unless (string-match "[*?][ \t]*\\'" command)
    (setq command (concat command " *")))
  (setq command (concat "git " command))
  (dired-do-shell-command command arg file-list)
  (message command))

;; @see http://blog.twonegatives.com/post/19292622546/dired-dwim-target-is-j00-j00-magic
;; op open two new dired buffers side-by-side and give your new-found automagic power a whirl.
;; Now combine that with a nice window configuration stored in a register and you’ve got a pretty slick work flow.
(setq dired-dwim-target t)
(require 'dired+)

(eval-after-load 'dired
  '(progn
     ;; {dired-details
     (setq-default dired-details-hidden-string "")
     (setq dired-listing-switches "-alh")
     (define-key dired-mode-map "(" 'dired-details-toggle)
     (define-key dired-mode-map ")" 'dired-details-toggle)
     ;; }
     (define-key dired-mode-map "/" 'diredext-exec-git-command-in-shell)
     (define-key dired-mode-map "a" 'ag)
     (define-key dired-mode-map (kbd "M-a") 'helm-ag)
     (define-key dired-mode-map "K" 'dired-do-kill-lines)
     (define-key dired-mode-map (kbd "SPC") 'ace-jump-mode)
     (define-key dired-mode-map "H" 'dired-up-directory)
     (define-key dired-mode-map "L" 'dired-find-file)
     (define-key dired-mode-map (kbd "M-L") 'dired-find-file-other-window)
     (define-key dired-mode-map (kbd "M-t") 'toggle-diredp-find-file-reuse-dir)
     (define-key dired-mode-map "W" 'wdired-change-to-wdired-mode)
     (define-key dired-mode-map "o" 'dired-sort-toggle-or-edit)
     (define-key dired-mode-map "v" 'dired-toggle-marks)
     (define-key dired-mode-map "c" 'dired-create-directory)
     (define-key dired-mode-map "q" 'kill-this-buffer)
     (setq dired-recursive-deletes 'always)
	 (setq dired-recursive-copies 'always)
     (define-key dired-mode-map [mouse-2] 'dired-find-file)
     (dolist (file `(((if *unix* "zathura" "open") "pdf" "dvi" "pdf.gz" "ps" "eps")
                     ("unrar x" "rar")
                     ((if *unix* "mplayer -stop-xscreensaver" "mplayer")  "avi" "mpg" "rmvb" "rm" "flv" "wmv" "mkv" "mp4" "m4v" "webm")
                     ("mplayer -playlist" "list" "PlOS")
                     ((if *unix* "feh" "open") "gif" "jpeg" "jpg" "tif" "png" )
                     ("7z x" "7z")
                     ("djview" "djvu")
                     ("firefox" "xml" "xhtml" "html" "htm" "mht")))
       (add-to-list 'dired-guess-shell-alist-default
                    (list (concat "\\." (regexp-opt (cdr file) t) "$")
                          (car file))))))

;; From emacs wiki
(defun kill-dired-buffers ()
  (interactive)
  (mapc (lambda (buffer)
          (when (eq 'dired-mode (buffer-local-value 'major-mode buffer))
            (kill-buffer buffer)))
        (buffer-list)))

(provide 'init-dired)
