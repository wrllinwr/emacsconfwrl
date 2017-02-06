(setq make-backup-files nil)

(setq recentf-max-menu-item 30)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(require 'org)
(setq org-src-fontify-natively t)

(require 'recentf)
(recentf-mode 1)
(global-hl-line-mode 1)
(delete-selection-mode 1)

(require 'nodejs-repl)

;;set popwin. when you look for a function or variable will
;;display a new buffer to discription the function,the course
;;on the new window,type the 'q' close the window
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("i18n" "internationliztion")
					    ("wrl" "linweiran")
					    ))

;;move line up
(global-set-key [(meta up)] 'move-text-line-up)
;;move line down
(global-set-key [(meta down)] 'move-text-line-down)

;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length 0)
(setq ido-use-virtual-buffers t)
(setq flx-ido-threshold 10000)
(setq ido-default-buffer-method 'selected-window)

(global-set-key [(control return)] '(lambda()
				 (interactive)
				 (move-end-of-line 1)
				 (message "end of the line")
				 (newline)))
(provide 'init-better-defaults)
