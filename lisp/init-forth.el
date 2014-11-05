(require 'gforth)

(setq auto-mode-alist (cons '("\\.fs\\'" . forth-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.eForth\\'" . forth-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.fb\\'" . forth-block-mode) auto-mode-alist))
(add-hook 'forth-mode-hook (function (lambda ()
									   (setq forth-indent-level 4)
									   (setq forth-minor-indent-level 2)
									   (setq forth-hilight-level 3))))

(provide 'init-forth)