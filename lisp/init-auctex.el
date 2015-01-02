;__AucTeX__;
;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)
;; (setq TeX-PDF-mode t)
;; (require 'tex-site)

;; (setq TeX-auto-save          t
;;       TeX-parse-self         t
;;       TeX-electric-sub-and-superscript 1
;;       preview-scale-function 1.33)

;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;; (add-hook 'LaTeX-mode-hook 'reftex-mode)
;; (add-hook 'LaTeX-mode-hook 'TeX-fold-mode)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)

;; Sync Emacs AUCTeX with Sumatra PDF
(setq TeX-PDF-mode t)
(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-method 'synctex)
(setq TeX-view-program-list
   '(("Sumatra PDF" ("\"C:\Program Files (x86)/SumatraPDF/SumatraPDF.exe\" -reuse-instance"
                      (mode-io-correlate " -forward-search %b %n ") " %o"))))

(eval-after-load 'tex
  '(progn
     (assq-delete-all 'output-pdf TeX-view-program-selection)
     (add-to-list 'TeX-view-program-selection '(output-pdf "Sumatra PDF"))))

(provide 'init-auctex)
