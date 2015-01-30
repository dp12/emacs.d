(require 'projectile)

(projectile-global-mode)
(setq projectile-switch-project-action 'projectile-dired)

;; Get perspective
;; (require 'perspective)
;; (persp-mode)
;; (require 'persp-projectile)
;; (define-key projectile-mode-map (kbd "s-s") 'projectile-persp-switch-project)

(provide 'init-projectile)