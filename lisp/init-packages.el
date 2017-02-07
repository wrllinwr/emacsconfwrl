(when (>= emacs-major-version 24)
  ;;魔法注释,in source code user ;;;### tag the function
  ;;every package complete general the autoload-packagename.el
  ;;autoload will load these function of that file
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  '("marmalade" . "https://marmalade-repo.org/packages/")
  '("org" . "http://orgmode.org/elpa/") t)

(require 'cl)
(defvar my/packages '(
		      company
		      monokai-theme
		      hungry-delete
		      swiper
		      counsel
		      flx-ido
		      ido-ubiquitous
		      smartparens
		      js2-mode
		      nodejs-repl
		      popwin
		      sr-speedbar
		      tabbar-ruler
		      yasnippet
		      ) "Default packages")

(setq package-selected-packages my/packages)


(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(load-theme 'monokai 1)

(require 'hungry-delete)
(global-hungry-delete-mode)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(require 'flx-ido)
(require 'ido-ubiquitous)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)

(global-company-mode t)
(ido-ubiquitous-mode 1)

(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(require 'popwin)
(popwin-mode t)
;;config js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js" . js2-mode))
       auto-mode-alist))

(provide 'init-packages)

;;tabbar-ruler
(add-hook 'after-init-hook '(lambda ()
			      (tabbar-ruler-up)))
;;(setq tabbar-ruler-global-tabbar t) ;;get tabbar
;;(setq tabbar-ruler-global-ruler t) ;;get ruler
;;(setq tabbar-ruler-popup-menu t) ;;get popmenu
;;(setq tabbar-ruler-popup-toolbar t) ;;get popup toolbar
;;(setq tabbar-ruler-popup-scrollbar t) ;;get popup scroll

;;config yasnippet
(require 'yasnippet)
(yas-global-mode 1)
