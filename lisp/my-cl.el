;; common lisp
;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "/usr/bin/sbcl")

;; neotree
;; C:\Users\topsec\AppData\Roaming\.emacs.d
(add-to-list 'load-path "~/.emacs.d/elpa/neotree-20170522.758")
(require 'neotree)
(global-set-key [f9] 'neotree-toggle)

;; use icons for tree
;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;; (setq projectile-switch-project-action 'neotree-projectile-action)
(setq-default neo-autorefresh t)
(setq neo-force-change-root t)

;; multi-term
;; Note, prelude config has keybind C-c t.
;; comment his code at core/prelude-mode.el and defvar prelude-mode-map.
(add-to-list 'load-path "~/.emacs.d/personal/preload/multi-term.el")
(require 'multi-term)
(setq multi-term-program "/bin/bash")

(defun go-to-terminal-buffer()
  (interactive)
  (if (equal "*terminal<1>*" (buffer-name))
      (switch-to-prev-buffer)

    ;;;;;;;;;;; to-do
    ;; while buffer-list if buffer-live-p terminal nil else
    ;; (multi-term)
    (switch-to-buffer "*terminal<1>*")))

;; Why in term-mode F5 is 15~
(global-set-key (kbd "C-c t") 'go-to-terminal-buffer)

;; Do not start at emacs running.
;; (multi-term)

;; run current file
;; (add-to-list 'load-path "~/.emacs.d/personal/preload/elisp-run-current-file.el")
;; (require 'elisp-run-current-file)

;; mit-scheme
;; (setq scheme-program-name  "/usr/local/bin/mit-scheme")


;; window-numbering
(add-to-list 'load-path "/root/.emacs.d/elpa/window-numbering-20160809.1110")
(require 'window-numbering)
(window-numbering-mode t)
(setq window-numbering-assign-func
      (lambda () (when (equal (buffer-name) "*Calculator*") 9)))


;; default directory
;; (setq default-directory "E:/001-project")

;; (linum-mode 1)
(global-linum-mode t)

;; evil mode
(add-to-list 'load-path "/root/.emacs.d/elpa/evil-20180517.1300")
(require 'evil)
(evil-mode 1)
;; remove all keybindings from insert-state keymap,it is VERY VERY important
(setcdr evil-insert-state-map nil)

;;;把emacs模式下的按键绑定到Insert模式下
(define-key evil-insert-state-map
  (read-kbd-macro evil-toggle-key) 'evil-emacs-state)


;; but [escape] should switch back to normal state
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; evil-leader
(add-to-list 'load-path "/root/.emacs.d/elpa/evil-leader-20140606.543")
(require 'evil-leader)
(global-evil-leader-mode)

(evil-leader/set-leader "f")
(evil-leader/set-key "l" 'crux-recentf-find-file)
(evil-leader/set-key
 "e" 'find-file
 "b" 'switch-to-buffer
 "k" 'kill-buffer
 "s" 'swiper
 "p" 'helm-projectile-find-file
 "nc" '0blayout-push
 "nb" '0blayout-pop
 "nk" '0blayout-kill)

;; M-up M-down Why it's not work
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

;; C-RET new-line
(global-set-key [(control return)] '(lambda()
                                      (interactive)
                                      (move-end-of-line 1)
                                      (message "end of the line")
                                      ;;(indent-for-tab-command)
                                      (newline)
                                      (indent-for-tab-command)
                                      ))

;; alias
(defalias 'ffip 'projectile-find-file)
(defalias 'gn 'elisp-slime-nav-find-elisp-thing-at-point)

;; evil-escape

;; This is good keybind, in the insert-state just press j and k in 0.2s
;; will change to normal-state
(setq-default evil-escape-key-sequence "jk")
(setq-default evil-escape-delay 0.2)

;; treeemacs
;; Like a project tree

;; smex
;; how do use it?

;; w3m
(setq w3m-home-page "http://www.baidu.com")

;; scroll-conservatively

;; yasnippet
;; (yas-global-mode 1)

(defun qiang-comment-dwim-line (&optional arg)
  ;; Replacement for the comment-dwim command. If no region is selected and
  ;; current line is not blank and we are not at the end of the line, then
  ;; comment current line. Replaces default behaviour of comment-dwim, when it
  ;; inserts comment at the end of the line.

  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line)

;; winner-undo C-c <left>

;; 0blayout
(add-to-list 'load-path "~/.emacs.d/elpa/0blayout-20161007.2307")
(require '0blayout)
(0blayout-mode 1)

;; 0xc
;; 0xc-convert:input a number(0-f,only one number) and input 0x/0b/0t/0o/0d
;; 0xc-convert-at-point: convert number to 0d

(defun 0blayout-push (layout-name)
  "0blayout saving function.
Argument LAYOUT-NAME Name of the layout."
  (interactive "sEnter name of current layout: ")
  (set-frame-parameter nil '0blayout-current layout-name)
  (0blayout-save)
  (message "Saved layout: '%s'" (0blayout-get-current-name))
  )

(defun 0blayout-pop (layout-name)
  "0blayout pop function.
Argument LAYOUT-NAME Name of the layout."
  (interactive
   (list
    (completing-read "Layout to pop up: " 0blayout-alist)))

  (let ((layout (assoc (intern layout-name) 0blayout-alist)))
    (if (eq layout nil)
        (message "No layout with name: '%s' is defined" layout-name)
      (progn
        (set-window-configuration (cdr layout))
        (0blayout-set-current-name layout-name)
        (message "Pop up to layout: '%s'" layout-name)))))

(defun 0blayout-kill ()
  "0blayout removal function."
  (interactive)

  (message "Killing layout: '%s'" (0blayout-get-current-name))

  ;; Remove current layout from known layouts
  (setq 0blayout-alist
        (assq-delete-all (intern (0blayout-get-current-name)) 0blayout-alist))

  ;; Switch to next layout in the list
  (let ((new-layout (car (car 0blayout-alist))))
    (if (eq new-layout nil)
        ;; If there's no other layout, make a new default layout
        (progn
          (0blayout-set-current-name 0blayout-default)
          (0blayout-new 0blayout-default))

      ;; Switch to some other saved layout
      (progn
        (set-window-configuration (cdr (car 0blayout-alist)))
        (0blayout-set-current-name (symbol-name new-layout))))))


;; (global-set-key (kbd "C-c C-0 C-c") '0blayout-push)
;; (global-set-key (kbd "C-c C-0 C-b") '0blayout-pop)
;; (global-set-key (kbd "C-c C-0 C-k") '0blayout-kill)

;; gun global
(load "~/.emacs.d/personal/preload/gtags.el")
(autoload 'gtags-mode "gtags" "" t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cannt use below config
(add-to-list 'load-path "~/.emacs.d/elpa/lsp-mode-20180518.2223")
(require 'lsp-mode)

(lsp-define-stdio-client
 ;; This can be a symbol of your choosing. It will be used as a the
 ;; prefix for a dynamically generated function "-enable"; in this
 ;; case: lsp-prog-major-mode-enable
 lsp-prog-major-mode
 "language-id"
 ;; This will be used to report a project's root directory to the LSP
 ;; server.
 (lambda () default-directory)
 ;; This is the command to start the LSP server. It may either be a
 ;; string containing the path of the command, or a list wherein the
 ;; car is a string containing the path of the command, and the cdr
 ;; are arguments to that command.
 '("/my/lsp/server" "and" "args"))

;; Here we'll add the function that was dynamically generated by the
;; call to lsp-define-stdio-client to the major-mode hook of the
;; language we want to run it under.
;;
;; This function will turn lsp-mode on and call the command given to
;; start the LSP server.
(add-hook 'prog-major-mode #'lsp-prog-major-mode-enable)

;; (add-to-list 'load-path "~/.emacs.d/elpa/lsp-ui-20180529.2211")
;; (require 'lsp-ui)
;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)
