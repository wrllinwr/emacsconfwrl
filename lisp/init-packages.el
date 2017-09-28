;; package ---Summary
(when (>= emacs-major-version 24)
  (require 'package)

  (add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/"))
  '("marmalade" . "http://marmalade-repo.org/packages/")
  '("gun" . "http://elpa.emacs-china.org/gun/")
  '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(require 'cl)
(defvar my/packages '(
		      company
		      ;;monokai-theme
		      ;;solarized-theme
			  ;;material-theme
			  ;;zenburn
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
		      web-mode
		      expand-region
		      iedit
		      helm-ag
		      flycheck
		      yasnippet
		      auto-yasnippet
		      evil
		      evil-leader
		      window-numbering
		      powerline
		      evil-surround
		      mwe-log-commands
		      smex
		      auto-complete
		      auto-complete-c-headers
		      ggtags
		      helm
		      helm-gtags
		      ;;jedi
		      elpy
			  neotree
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

(require 'hungry-delete)
(global-hungry-delete-mode)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(require 'flx-ido)
(require 'ido-ubiquitous)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)

(ido-ubiquitous-mode 1)

(require 'smartparens-config)

;;这是干啥的
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(require 'popwin)
(popwin-mode t)

;;config js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js" . js2-mode)
	 ("\\.html" . web-mode))
       auto-mode-alist))

;;config yasnippet
;;count_of_~red = get_total("~red");
;;aya-create
;;count_of_red = get_total("red");
;;Then call aya-expand
(require 'yasnippet)
(yas-global-mode 1)
(require 'expand-region)
;;(elpy-enable)
(add-hook 'js2-mode-hook 'flycheck-mode-hook)
;; (when (require 'flycheck nil t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))

(evil-mode 1)
(global-evil-leader-mode)
(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)
(window-numbering-mode t)
(setq window-numbering-assign-func
      (lambda () (when (equal (buffer-name) "*Calculator*") 9)))
(require 'evil-surround)
(global-evil-surround-mode 1)
(setq winner-dont-bind-my-keys t)
(winner-mode t)

;;config auto-complete
;;start auto-complete with emacs
(require 'auto-complete)
;;do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)

(setq ac-use-menu-map t)
(setq ac-use-quick-help t)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20170124.1845/dict")

;;config ac-c-headers
(require 'auto-complete-c-headers) 
(defun my:ac-c-headers-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include/"))

(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)


;;turn on semantic
(semantic-mode 1)
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic))
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

(custom-set-variables
 '(helm-gtags-prefix-key "\C-t")
 '(helm-gtags-suggested-key-mapping t))
(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))


(add-hook 'helm-minibuffer-set-up-hook
          'spacemacs//helm-hide-minibuffer-maybe)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

(helm-mode 1)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)


;;C-M-f runs forward-sexp,
;;move forward over a balanced expression that can be a pair or a symbol. 
;;光标从函数"{"位置跳转到"}"位置

;;C-M-b runs backward-sexp,
;;move backward over a balanced expression that can be a pair or a symbol. 
;;光标从函数的末尾}跳转到开始的{

;;C-M-k runs kill-sexp,
;;kill balanced expression forward that can be a pair or a symbol.
;;删除{中间的代码块}括号中间的代码块. 注意：光标只能在起始括号

;;C-M-<SPC> or C-M-@ runs mark-sexp,
;;put mark after following expression that can be a pair or a symbol
;;标记匹配{}之间的代码

;;C-M-a runs beginning-of-defun, which moves point to beginning of a function.
;;跳到函数头

;;C-M-e runs end-of-defun, which moves point to end of a function.
;;跳到函数尾

;;C-M-h runs mark-defun,
;; which put a region around whole current or following function.
;;标记光标所在的整个函数

;;C-j runs helm-gtags-select 列出tgas
;;M-. 寻找已定义过的函数 有时候还是gtags得ctrl-]的功能
;;M-, 与M-.相反
;;C-c g [好几个 根据快捷键提示自己找]

;;没有感觉到任何效果
(setq speedbar-show-unknown-files t)
(setq-local imenu-create-index-function #'ggtags-build-imenu-index)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 2 ;;两个字符开始补全
      company-idle-delay 0.2          ;;补全延迟
      company-require-match nil       ;;可以输入不符合补全的字符,
      company-show-numbers t)
(global-set-key [(control tab)] 'company-complete-common)
(global-set-key (kbd "C-c <tab>") 'company-yasnippet)
(setq company-backends (delete 'company-semantic company-backends))
;;(define-key c-mode-map  [(tab)] 'company-complete)
;;(define-key c++-mode-map  [(tab)] 'company-complete)
(add-to-list 'company-backends 'company-c-headers)
;;(add-to-list 'company-c-headers-path-system "/usr/include/")

;;config for helm,helm会影响速度
(setq tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

;;config tab from csdn add by linweiran at 2017-2-25
;;C/lah /后面是开启哪些特性
;; l -> electric-indent-mode
;; a -> auto-newline
;; h -> hungry-delete-key
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
(setq tab-stop-list ())
(loop for x downfrom 40 to 1 do
      (setq tab-stop-list (cons (* x 4) tab-stop-list)))

(defconst my-c-style
  '((c-tab-always-indent        . t)
    (c-comment-only-line-offset . 4)
    (c-hanging-braces-alist     . ((substatement-open after)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
    (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                   (substatement-open . 0)
                                   (case-label        . 4)
                                   (block-open        . 0)
                                   (knr-argdecl-intro . -)))
    (c-echo-syntactic-information-p . t)
    )
  "My C Programming Style")

;; offset customizations not in my-c-style
(setq c-offsets-alist '((member-init-intro . ++)))

;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
  ;; add my personal style and set it for the current buffer
  (c-add-style "PERSONAL" my-c-style t)
  ;; other customizations
  (setq tab-width 4
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
  ;; we like auto-newline and hungry-delete
  (c-toggle-auto-hungry-state 1)
  ;; key bindings for all supported languages.  We can put these in
  ;; c-mode-base-map because c-mode-map, c++-mode-map, objc-mode-map,
  ;; java-mode-map, idl-mode-map, and pike-mode-map inherit from it.
  (define-key c-mode-base-map "\C-m" 'c-context-line-break)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
;;config tab end here

;;(load-theme 'material t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

;; display undo-tree buffer on below
(setq display-buffer-alist '(("\\*undo-tree\\*" display-buffer-below-selected)))

;; python environment
;; (autoload 'jedi:setup "jedi" nil t)
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:setup-keys t)
;; (setq jedi:complete-on-dot t)

;; neotree
(add-to-list 'load-path "/home/test/.emacs.d/elpa/neotree")
(require 'neotree)
(global-set-key [f9] 'neotree-toggle)
(provide 'init-packages)
