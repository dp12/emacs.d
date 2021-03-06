
(require 'helm-config)

;; (helm-mode 1)

(setq helm-completing-read-handlers-alist
      '((describe-function . ido)
        (describe-variable . ido)
        (debug-on-entry . helm-completing-read-symbols)
        (find-function . helm-completing-read-symbols)
        (find-tag . helm-completing-read-with-cands-in-buffer)
        (ffap-alternate-file . nil)
        (tmm-menubar . nil)
        (dired-do-copy . nil)
        (dired-do-rename . nil)
        (dired-create-directory . nil)
        (find-file . ido)
        (copy-file-and-rename-buffer . nil)
        (rename-file-and-buffer . nil)
        (w3m-goto-url . nil)
        (ido-find-file . nil)
        (ido-edit-input . nil)
        (mml-attach-file . ido)
        (read-file-name . nil)
        (yas/compile-directory . ido)
        (execute-extended-command . ido)
        (minibuffer-completion-help . nil)
        (minibuffer-complete . nil)
        (c-set-offset . nil)
        (wg-load . ido)
        (rgrep . nil)
        (read-directory-name . ido)
        ))


;; {{helm-gtags
;; customize
(autoload 'helm-gtags-mode "helm-gtags" nil t)
(setq
 helm-c-gtags-path-style 'relative
 helm-c-gtags-ignore-case t
 helm-c-gtags-read-only t
 helm-c-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t)
 ;; helm-gtags-suggested-key-mapping t)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)
;; }}


;; key bindings
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
              (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
              (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
              (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
              (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)
              (local-set-key (kbd "C-c C-f") 'helm-gtags-pop-stack)
				(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
				(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
				(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
				(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
				(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
				(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
                (diminish 'helm-gtags-mode)))
;; ==end

(if *emacs24*
    (progn
      (autoload 'helm-c-yas-complete "helm-c-yasnippet" nil t)
      (global-set-key (kbd "C-x C-o") 'helm-find-files)
      (global-set-key (kbd "C-c f") 'helm-for-files)
      (global-set-key (kbd "C-c y") 'helm-c-yas-complete)
      (global-set-key (kbd "C-c M-y") 'helm-show-kill-ring)
      (global-set-key (kbd "C-c i") 'helm-semantic-or-imenu)
      (global-set-key (kbd "C-c r") 'helm-resume)
      (setq helm-semantic-fuzzy-match t)
      (setq helm-imenu-fuzzy-match t)
      (setq helm-recentf-fuzzy-match t)
      (setq helm-buffers-fuzzy-match t)
      (setq helm-locate-fuzzy-match t)
	  (require 'helm-swoop)
      (global-set-key (kbd "C-x w") 'helm-swoop)
      (global-set-key (kbd "C-x W") 'helm-multi-swoop-all)
      (global-set-key (kbd "C-x C-o") 'ffap)
      ))

;; When doing isearch, hand the word over to helm-swoop
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
;; From helm-swoop to helm-multi-swoop-all
;; (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
;; Show swoop in right window
(setq helm-swoop-split-direction 'split-window-horizontally)

(autoload 'helm-ls-git-ls "helm-ls-git" nil t)
(autoload 'helm-browse-project "helm-ls-git" nil t)

(provide 'init-helm)
