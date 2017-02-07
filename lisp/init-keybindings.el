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
(provide 'init-keybindings)
