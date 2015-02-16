;; -*- coding: utf-8 -*-
(setq emacs-load-start-time (current-time))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(setq *macbook-pro-support-enabled* t)
(setq *is-a-mac* (eq system-type 'darwin))
(setq *is-carbon-emacs* (and *is-a-mac* (eq window-system 'mac)))
(setq *is-cocoa-emacs* (and *is-a-mac* (eq window-system 'ns)))
(setq *win32* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )
(setq *linux-x* (and window-system *linux*) )
(setq *xemacs* (featurep 'xemacs) )
(setq *emacs23* (and (not *xemacs*) (or (>= emacs-major-version 23))) )
(setq *emacs24* (and (not *xemacs*) (or (>= emacs-major-version 24))) )
(setq *no-memory* (cond
                   (*is-a-mac*
                    (< (string-to-number (nth 1 (split-string (shell-command-to-string "sysctl hw.physmem")))) 4000000000))
                   (*linux* nil)
                   (t nil)
                   ))

;----------------------------------------------------------------------------
; Functions (load all files in defuns-dir)
; Copied from https://github.com/magnars/.emacs.d/blob/master/init.el
;----------------------------------------------------------------------------
(setq defuns-dir (expand-file-name "~/.emacs.d/defuns"))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
      (load file)))
;----------------------------------------------------------------------------
; Load configs for specific features and modes
;----------------------------------------------------------------------------


;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------
(require 'cl-lib)
(require 'init-compat)
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el

;; win32 auto configuration, assuming that cygwin is installed at "c:/cygwin"
(condition-case nil
    (when *win32*
      (setq cygwin-mount-cygwin-bin-directory "c:/cygwin/bin")
      (require 'setup-cygwin)
      ;; better to set HOME env in GUI
      ;; (setenv "HOME" "c:/cygwin/home/someuser")
      )
  (error
   (message "setup-cygwin failed, continue anyway")
   ))

(require 'idle-require)

;; Something after elpa causes modeline crash
(require 'init-elpa)
(require 'init-modeline)
(require 'init-exec-path) ;; Set up $PATH
(require 'init-frame-hooks)
;; any file use flyspell should be initialized after init-spelling.el
;; actually, I don't know which major-mode use flyspell.
(require 'init-spelling)
(require 'init-xterm)
;; (require 'init-osx-keys)
(require 'init-gui-frames)
(require 'init-ido)
;; (require 'init-maxframe)
;; (require 'init-proxies)
(require 'init-dired)
(require 'init-isearch)
(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-flymake)
(require 'init-recentf)
(require 'init-smex)
(if *emacs24* (require 'init-helm))
(require 'init-hippie-expand)
(require 'init-windows)
(require 'init-sessions)
(require 'init-fonts)
(require 'init-git)
(require 'init-crontab)
(require 'init-textile)
(require 'init-markdown)
(require 'init-csv)
;; (require 'init-erlang)
(require 'init-javascript)
(when *emacs24*
  (require 'init-org)
  (require 'init-org-mime))
(require 'init-css)
;; (require 'init-haml)
(require 'init-python-mode)
(require 'init-haskell)
(require 'init-ruby-mode)
(require 'init-elisp)
(if *emacs24* (require 'init-yasnippet))
;; Use bookmark instead
(require 'init-zencoding-mode)
(require 'init-cc-mode)
(require 'init-gud)
(require 'init-cmake-mode)
;; (require 'init-csharp-mode)
(require 'init-linum-mode)
(require 'init-which-func)
(require 'init-move-window-buffer)
;; (require 'init-gist)
(require 'init-moz)
(require 'init-gtags)
;; use evil mode (vi key binding)
(require 'init-evil)
(require 'init-sh)
(require 'init-ctags)
(require 'init-ace-jump-mode)
;; (require 'init-bbdb)
;; (require 'init-gnus)
(require 'init-lua-mode)
;; (require 'init-workgroups2)
(require 'init-term-mode)
(require 'init-web-mode)
(require 'init-sr-speedbar)
(require 'init-slime)
(when *emacs24*
  (require 'init-company))
(require 'init-stripe-buffer)
(require 'init-eim) ;;  cannot be idle-required
(require 'init-key-chord)
(require 'init-forth)
(require 'init-auctex)
(require 'init-function-args)
(require 'init-custom)

;; misc has some crucial tools I need immediately
(require 'init-misc)

(setq idle-require-idle-delay 3)
(setq idle-require-symbols '(
                             init-registers
                             init-deft
                             init-projectile
                             ;; init-semantic
                             init-writting
                             init-lisp
                             init-keyfreq
                             init-elnode
                             init-doxygen
                             ;; init-pomodoro
                             ;; init-emacspeak
                             ;; init-artbollocks-mode
                             init-emacs-w3m
                             ))
(idle-require-mode 1) ;; starts loading

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(if (file-exists-p "~/.custom.el") (load-file "~/.custom.el"))

(when (require 'time-date nil t)
   (message "Emacs startup time: %d seconds."
    (time-to-seconds (time-since emacs-load-start-time)))
   )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ace-isearch-input-idle-delay 0.3)
 '(ace-isearch-input-length 7)
 '(ace-isearch-submode (quote ace-jump-char-mode))
 '(ace-isearch-use-ace-jump (quote printing-char))
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(blink-cursor-mode nil)
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/.bookmarks.el")
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes
   (quote
    ("2b4a4d1155e279aadd8ebcabf4b0eb8f9bb64ebbd9141fcf61c7655276b587b8" "c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" default)))
 '(diredp-hide-details-initially-flag nil)
 '(display-time-mode t)
 '(safe-local-variable-values
   (quote
    ((emacs-lisp-docstring-fill-column . 75)
     (ruby-compilation-executable . "ruby")
     (ruby-compilation-executable . "ruby1.8")
     (ruby-compilation-executable . "ruby1.9")
     (ruby-compilation-executable . "rbx")
     (ruby-compilation-executable . "jruby"))))
 '(session-use-package t nil (session))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 105 :width normal))))
 '(diredp-dir-heading ((t (:background "#00003F3F3434" :foreground "magenta"))))
 '(diredp-exec-priv ((t (:background "blue" :foreground "black"))))
 '(diredp-read-priv ((t (:background "gold" :foreground "black"))))
 '(diredp-write-priv ((t (:background "lime green" :foreground "black"))))
 '(hl-line ((t (:underline "green" :weight normal))) t)
 '(org-todo ((t (:foreground "red" :weight bold))))
 '(powerline-active3 ((t (:inherit mode-line :background "OliveDrab3" :foreground "black"))))
 '(powerline-evil-emacs-face ((t (:inherit mode-line :background "blue violet" :foreground "black" :weight bold))))
 '(powerline-evil-iedit-face ((t (:inherit mode-line :background "firebrick" :foreground "black" :weight bold))))
 '(powerline-evil-iedit-insert-face ((t (:inherit mode-line :background "#0F9" :foreground "black" :weight bold))))
 '(powerline-evil-insert-face ((t (:inherit mode-line :background "green" :foreground "black" :weight bold))))
 '(powerline-evil-motion-face ((t (:inherit mode-line :background "blue" :foreground "black" :weight bold))))
 '(powerline-evil-normal-face ((t (:inherit mode-line :background "red" :foreground "black" :weight bold))))
 '(powerline-evil-operator-face ((t (:inherit mode-line :background "sky blue" :foreground "black" :weight bold))))
 '(powerline-evil-replace-face ((t (:inherit mode-line :background "black" :foreground "black" :weight bold))))
 '(powerline-evil-visual-face ((t (:inherit mode-line :background "orange" :foreground "black" :weight bold))))
 '(window-numbering-face ((t (:foreground "DeepPink" :underline "DeepPink" :weight bold))) t))
;;; Local Variables:
;;; no-byte-compile: t
;;; End:
(put 'erase-buffer 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)