(setq recentf-max-menu-item 30)
(defadvice show-paren-function (around fix-show-paren-function activate)
  (cond ((looking-at-p "\\s(") ad-do-it)
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     ad-do-it)))
  )

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(require 'org)
(setq org-src-fontify-natively t)

(require 'recentf)
(recentf-mode 1)
(global-hl-line-mode -1)
(delete-selection-mode 1)

(require 'nodejs-repl)

;;set popwin. when you look for a function or variable will
;;display a new buffer to discription the function,the course
;;on the new window,type the 'q' close the window
 ;;how config it to global.
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("i18n" "internationliztion")
					    ("wrl" "linweiran")
					    ))

;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length 0)
(setq ido-use-virtual-buffers t)
(setq flx-ido-threshold 100)
(setq ido-default-buffer-method 'selected-window)

(global-set-key [(control return)] '(lambda()
				      (interactive)
				      (move-end-of-line 1)
				      (message "end of the line")
				      (newline)))
;;ident-buffer
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))

(put 'dired-find-alternate-file 'disabled nil)
;;C-x C-j dired by name open the current file diredmode
(require 'dired-x)
(setq dired-dwim-target t)

(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
(which-key-mode 1)
;;关闭自动备份文件
(setq make-backup-files nil)
(desktop-save-mode t)
(provide 'init-better-defaults)
