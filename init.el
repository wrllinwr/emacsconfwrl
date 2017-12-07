(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-custome)
;;(require 'setup-helm)
(require 'elisp-run-current-file)
(require 'stardict)
(require 'multi-term)
          
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-c-headers-path-system (quote ("/usr/include/" "/usr/local/include/")))
 '(custom-safe-themes
   (quote
	("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" default)))
 '(evil-leader/leader "SPC")
 '(evil-want-C-u-scroll t)
 '(helm-gtags-prefix-key "")
 '(helm-gtags-suggested-key-mapping t)
 '(popwin:popup-window-position (quote bottom))
 '(show-paren-mode t)
 '(speedbar-show-unknown-files t t)
 '(sr-speedbar-right-side nil)
 '(tool-bar-mode nil))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(iedit-occurrence ((t (:inherit region)))))
(setenv "PATH" (concat "/usr/local/bin/;" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin/")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "WenQuanYi Micro Hei Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))
(multi-term)
