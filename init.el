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
;; (require 'init-sr-speedbar)
(require 'init-slime)
(when *emacs24*
  (require 'init-company))
(require 'init-stripe-buffer)
(require 'init-eim) ;;  cannot be idle-required
(require 'init-keymaps)
(require 'init-forth)
(require 'init-auctex)
(require 'init-function-args)
(require 'init-smartparens)
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
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "23b85026ec3dfa3b1c4e170b83b1e9f4e7828c44f1f32fb427d5252e66e60b7b" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "de538b2d1282b23ca41ac5d8b69c033b911521fe27b5e1f59783d2eb20384e1f" "1dec44213e780f4220cab0b45ae60063a1fecfa26a678ccce07fca4b30b92dc5" "436ae3105bb26b7e3edbd624612ee3ba929fd568d3b3bd1f72e6aa2b0cab1bb7" "2b4a4d1155e279aadd8ebcabf4b0eb8f9bb64ebbd9141fcf61c7655276b587b8" "c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" default)))
 '(diredp-hide-details-initially-flag nil)
 '(display-time-mode t)
 '(fci-rule-color "#49483E")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#49483E" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(magit-diff-use-overlays nil)
 '(magit-use-overlays nil)
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(safe-local-variable-values
   (quote
    ((emacs-lisp-docstring-fill-column . 75)
     (ruby-compilation-executable . "ruby")
     (ruby-compilation-executable . "ruby1.8")
     (ruby-compilation-executable . "ruby1.9")
     (ruby-compilation-executable . "rbx")
     (ruby-compilation-executable . "jruby"))))
 '(session-use-package t nil (session))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 128 :width normal))))
 '(diredp-dir-heading ((t (:background "#00003F3F3434" :foreground "magenta"))))
 '(diredp-exec-priv ((t (:background "blue" :foreground "black"))))
 '(diredp-read-priv ((t (:background "gold" :foreground "black"))))
 '(diredp-write-priv ((t (:background "lime green" :foreground "black"))))
 '(erc-input-face ((t (:foreground "dark orange"))))
 '(erc-my-nick-face ((t (:foreground "dodger blue" :weight bold))))
 '(hl-line ((t (:underline "green" :weight normal))) t)
 '(hydra-face-blue ((t (:foreground "blue" :weight bold))))
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
 '(rainbow-delimiters-depth-1-face ((t (:foreground "grey55" :weight normal))))
 '(window-numbering-face ((t (:foreground "DeepPink" :underline "DeepPink" :weight bold))) t))
;;; Local Variables:
;;; no-byte-compile: t
;;; End:
(put 'erase-buffer 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
