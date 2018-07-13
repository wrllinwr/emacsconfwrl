;; custom
;; evil mode

;; (add-to-list 'load-path "~/.emacs.d/elpa-25.3/evil-20180517.1300")
(add-to-list 'load-path "~/.emacs.d/elpa-25.3/evil-20180517.1300")
(require 'evil)
(evil-mode 1)
;; remove all keybindings from insert-state keymap,it is VERY VERY important
(setcdr evil-insert-state-map nil)

;;;把emacs模式下的按键绑定到Insert模式下
(define-key evil-insert-state-map
  (read-kbd-macro evil-toggle-key) 'evil-emacs-state)

;; at normal mode use C-w
;; (define-key evil-normal-state-map "C-w" 'whole-line-or-region-delete)

;; at normal mode use C-e
(define-key evil-normal-state-map (kbd "C-e") 'move-end-of-line)

;; but [escape] should switch back to normal state
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; evil-leader
;; (add-to-list 'load-path "~/.emacs.d/elpa-24.5/evil-leader-20140606.543")
(add-to-list 'load-path "~/.emacs.d/elpa-25.3/evil-leader-20140606.543")
(require 'evil-leader)
(global-evil-leader-mode)

(evil-leader/set-leader "f")
(evil-leader/set-key "l" 'ivy-recentf)
(evil-leader/set-key
  "b" 'switch-to-buffer
  "d" 'dired
  "e" 'find-file
  "f" 'evil-find-char  ;; (kbd "C-;") evil-goto-char-timer
  "k" 'kill-buffer
  "p" 'helm-projectile-find-fily
  "s" 'swiper
  "nc" '0blayout-push
  "nb" '0blayout-pop
  "nk" '0blayout-kill)

;; evil-escape

;; This is good keybind, in the insert-state just press j and k in 0.2s
;; will change to normal-state
(setq-default evil-escape-key-sequence "jk")
(setq-default evil-escape-delay 0.2)
(evil-escape-mode 1)
;; multi-term
;; Note, prelude config has keybind C-c t.
;; comment his code at core/prelude-mode.el and defvar prelude-mode-map.
(add-to-list 'load-path "~/.emacs.d/lisp/multi-term.el")
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

;; window-numbering
;; (add-to-list 'load-path "/root/.emacs.d/elpa-24.5/window-numbering-20160809.1110")
(add-to-list 'load-path "/root/.emacs.d/elpa-25.3/window-numbering-20160809.1110")
(require 'window-numbering)
(window-numbering-mode t)
(setq window-numbering-assign-func
      (lambda () (when (equal (buffer-name) "*Calculator*") 9)))

;; M-up M-down Why it's not work
;; (defun move-line-up()
;;   "Moves current line up."
;;   (interactive)
;;   (transpose-lines 1)
;;   (previous-line)
;;   (previous-line)
;;   (indent-for-tab-command)
;;   )
;; (defun move-line-down ()
;;   "Moves current line down."
;;   (interactive)
;;   (move-text-line-down)
;;   (indent-for-tab-command))

;; (global-set-key [(meta up)] 'move-line-up)
;; (global-set-key [(meta down)] 'move-line-down)

;; C-RET new-line
;; (global-set-key [(control return)] '(lambda()
;;                                       (interactive)
;;                                       (move-end-of-line 1)
;;                                       (message "end of the line")
;;                                       ;;(indent-for-tab-command)
;;                                       (newline)
;;                                       (indent-for-tab-command)
;;                                       ))

;; (defun qiang-comment-dwim-line (&optional arg)
;;   ;; Replacement for the comment-dwim command. If no region is selected and
;;   ;; current line is not blank and we are not at the end of the line, then
;;   ;; comment current line. Replaces default behaviour of comment-dwim, when it
;;   ;; inserts comment at the end of the line.

;;   (interactive "*P")
;;   (comment-normalize-vars)
;;   (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
;;       (comment-or-uncomment-region (line-beginning-position) (line-end-position))
;;     (comment-dwim arg)))
;; (global-set-key "\M-;" 'qiang-comment-dwim-line)

;; 0blayout
;; (add-to-list 'load-path "~/.emacs.d/elpa-24.5/0blayout-20161007.2307")
(add-to-list 'load-path "~/.emacs.d/elpa-25.3/0blayout-20161007.2307")
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

;; gun global
(load "~/.emacs.d/lisp/gtags.el")
(autoload 'gtags-mode "gtags" "" t)

(add-to-list 'load-path "~/.emacs.d/lisp/elisp-run-current-file.el")
(require 'elisp-run-current-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; fuck python IDE
;; http://chillaranand.github.io/emacs-py-ide/
;; pip install rope
;; pip install jedi
;; pip install flake8
;; pip install importmagic
(elpy-enable)
;; C-c C-d elpy-doc
;; M-.  ;; elpy-goto-definition
;; M-*/C-t  ;; pop-tag-mark
;; M-<n>  ;; select nth item

;; #Debugging
;; #Debug using pdb.
;; import ipdb
;; ipdb.set_trace()

;; #Test Integration
;; #Configure Your Test Runner.
;;M-x elpy-set-test-runner
;;C-c C-t  ;; runs test/ all tests

;; code fold
;; wrl-fold.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; fuck end python IDE


;; avy-got-char
;; C-; evil-goto-char-timer

;; C-x C-; comment-line

;; (kbd "g ;") goto-last-change
;; back the cursor location

;; blink-cursor-mode
(blink-cursor-mode -1)

;; (kbd ".") evil-repeat
;; Repeat the last editing command with count replaced by COUNT

;; do not auto C-l
(setq scroll-conservatively 100000)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)
(setq inhibit-startup-screen t)
(global-hl-line-mode 1)
;; (set-face-attribute 'mode-line nil :background nil)

;; title
;; (setq frame-title-format
;;       '((:eval (if (buffer-file-name)
;;                    (abbreviate-file-name (buffer-file-name))
;;                  "%b"))))

;; auto-dictionary
;; (require 'auto-dictionary)
;; (add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1)))

;; theme

;; vim
;; dj: Delete current and next line. The d is delete, this j is move next line,
;;     so d + j can delete 2 lines like 2dd.
;; dk: Delete current and provide line.
;; dh: Delete a char before cursor.
;; dl: Delete a char hehind cursor.
;;  0: Move cursor to head of line.
;;  ^: Move cursor to head of line.
;;  $: Move cursor to end of line.
;; d^: Delele chars to this line head from cursor(not contain cursor).
;; d$: Delete chars to this line end from cursor(contain cursor).
;; gj: When have a long line display more line. Can prefix key "g",
;;     will move that position.
;; gk:
;; gh:
;; gl:
;; motion:
;;  w:
;;  e:
;;  b:
;; fc:
;; tc:
;; Fc:
;; Tc:
;;  r: replace a char
;;  R: replace chars
;;  c:
;;  s: delete char and change insert mode
;;  %:
;;  #:
;;  r:
;;  R:
;; c-i:
;; c-]:
;; c-o:
;; c-h:
;; c-m:
;; c-l:




;; asdf this an org-babel-no-eval-on-ctrl-c-ctrl-c some.
;; sdfewf 123, sdfa.
;; sdfsdfa assdfsdfjlkjoiwe
;; asdfasdfa




(provide 'init-local)
