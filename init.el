(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-custome)
(require 'init-program-for-c)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" default)))
 '(evil-leader/leader "SPC")
 '(evil-want-C-u-scroll t)
 '(popwin:popup-window-position (quote bottom))
 '(speedbar-show-unknown-files t)
 '(sr-speedbar-right-side nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(iedit-occurrence ((t (:inherit region)))))
(setenv "PATH" (concat "/usr/local/bin/;" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin/")))
