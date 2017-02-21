(add-to-list 'load-path "~/.emacs.d/lisp")
(autoload 'gtags-mode "gtags" "" t)
;;(add-hook 'gtags-mode-hook
;;  '(lambda ()
;;        ; Local customization (overwrite key mapping)
;;        (define-key gtags-mode-map "\C-f" 'scroll-up)
;;        (define-key gtags-mode-map "\C-b" 'scroll-down)
;;))
(add-hook 'gtags-select-mode-hook
	  '(lambda ()
	     (setq hl-line-face 'underline)
	     (hl-line-mode 1)
	     ))
(add-hook 'c-mode-hook
	  '(lambda ()
	     (gtags-mode 1)))
;;为什么没有起作用
(add-hook 'c++-mode-hook
	  '(lambda ()
	     (gtags-mode 1)))
;;Customization
(setq gtags-suggested-key-mapping t)
(setq gtags-auto-update t)
(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))

(provide 'init-program-for-c)
