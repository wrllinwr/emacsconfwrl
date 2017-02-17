(global-set-key (kbd "<f2>") 'open-my-init-file)

(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(global-set-key "\C-s" 'swiper)
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
(progn
  (global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)
  (erase-buffer)
  (other-window 1))

(global-set-key (kbd "C-j") 'goto-line)
(global-set-key (kbd "C-c p f") 'counsel-git)
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
(global-set-key (kbd "M-s o") 'occur-mode)
(global-set-key (kbd "M-s e") 'iedit-mode)
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
(provide 'init-keybindings)
