(require 'package)
(require 'cl-lib)

(setq package-archives '(("gnu"   . "http://elpa.zilongshanren.com/gnu/")
                           ("melpa" . "http://elpa.zilongshanren.com/melpa/")))

;;;;;;;;;;;;;;;;;;;;;; recentf
(require 'recentf)
(recentf-mode 1)
;;;;;;;;;;;;;;;;;;;;;; evil
(evil-mode 1)
;; remove all keybindings from insert-state keymap,it is VERY VERY important
(setcdr evil-insert-state-map nil) 

;;;把emacs模式下的按键绑定到Insert模式下
(define-key evil-insert-state-map
  (read-kbd-macro evil-toggle-key) 'evil-emacs-state)

;; but [escape] should switch back to normal state
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;;;;;;;;;;;;;;;;;;;;;; evil-leader
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "f")
(evil-leader/set-key
  "e" 'helm-find-files
  "b" 'helm-buffers-list
  "k" 'kill-buffer
  "l" 'recentf-open-files)

;;;;;;;;;;;;;;;;;;;;;;; evil-escape
(evil-escape-mode 1)
(setq-default evil-escape-key-sequence "jk")
(setq-default evil-escape-delay 0.2)

;;;;;;;;;;;;;;;;;;;;;;; 自动补全
(require 'auto-complete-config)
(ac-config-default)

;;;;;;;;;;;;;;;;;;;;;;; highlight parentes
(require 'highlight-parentheses)
(highlight-parentheses-mode 1)
(show-paren-mode 1)
(setq-default show-paren-style 'expression)

;;;;;;;;;;;;;;;;;;;;;; 括号 双引号自动补全([{' "" }])
(electric-pair-mode 1)
(setq electric-pair-pairs
      '(
        (?\{ . ?\})))

;;;;;;;;;;;;;;;;;;;;; keybingd
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'smex)
