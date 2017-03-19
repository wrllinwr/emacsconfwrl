(global-set-key (kbd "<f2>") 'open-my-init-file)

;;打开recentf 最近的文件
(global-set-key (kbd "C-c f") 'recentf-open-files)

(global-set-key "\C-s" 'swiper)
;;ivy-resume 不知道干啥的 好像开启搜索C-s 并且是上一次的搜索默认词
;;当python-mode启用时C-c C-r是运行，C-c C-f匹配符号
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(add-hook 'js-mode-hook
          '(lambda ()
			 (define-key js-mode-map (kbd "C-x C-e") 'nodejs-repl-send-last-sexp)
			 (define-key js-mode-map (kbd "C-c C-r") 'nodejs-repl-send-region)
			 (define-key js-mode-map (kbd "C-c C-l") 'nodejs-repl-load-file)
			 (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl-switch-to-repl)))
(setq url-automatic-caching t)
;;有道词典
(progn
  (global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)
  (erase-buffer)
  (other-window 1))
;;当helmgtags模式开启后，会列出所有的tag helm-gtags-select
(global-set-key (kbd "C-j") 'goto-line)

;;helmgtags-mode t
;;M-. 寻找已定义过的函数 有时候还是gtags得ctrl-]的功能
;;M-, 与M-.相反
;;C-c g [好几个 根据快捷键提示自己找]
;;helmgtags-mode t

(global-set-key (kbd "C-c p f") 'counsel-git)

;;代码格式化
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
(global-set-key (kbd "M-/") 'hippie-expand)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
;;global key C-x C-j open the current file diredmode
(global-set-key (kbd "C-=") 'er/expand-region)
;;company C-n
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;;config auto-complete hotkey
;; Default settings
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

(global-set-key (kbd "M-s o") 'occur-mode)
;;编辑某个相同的变量，例如某个变量在多个位置，使用该快捷键后可以同事在该变量位置对其进行编辑
(global-set-key (kbd "C-c ;") 'iedit-mode)
;;C-o insertline
(global-set-key (kbd "M-s p") 'helm-do-ag-project-root)
(global-set-key (kbd "C-w") 'backward-kill-word)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(setcdr evil-insert-state-map nil)
(global-set-key (kbd "C-c n") 'evil-normal-state)
(global-set-key (kbd "C-x <left>") 'winner-undo)
(global-set-key (kbd "C-x <right>") 'winner-redo)
(global-set-key [(meta x)] (lambda ()
                             (interactive)
                             (or (boundp 'smex-cache)
                                 (smex-initialize))
                             (global-set-key [(meta x)] 'smex)
                             (smex)))

(global-set-key [(shift meta x)] (lambda ()
                                   (interactive)
                                   (or (boundp 'smex-cache)
                                       (smex-initialize))
                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                   (smex-major-mode-commands)))

(defun move-line-up()
  "Moves current line up."
  (interactive)
  	(transpose-lines 1)
	(previous-line)
	(previous-line)
	(indent-for-tab-command)
  )
(defun move-line-down ()
  "Moves current line down."
  (interactive)
  (move-text-line-down)
  (indent-for-tab-command))
(global-set-key [(meta up)] 'move-line-up)
(global-set-key [(meta down)] 'move-line-down)

(provide 'init-keybindings)


