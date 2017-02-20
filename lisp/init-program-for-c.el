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
 ;Customization
(setq gtags-suggested-key-mapping t)
(setq gtags-auto-update t)
(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))

;;config auto-complete
(setq ac-use-menu-map t)
(setq ac-use-quick-help t)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20170124.1845/dict")
(ac-config-default)

(provide 'init-program-for-c)
