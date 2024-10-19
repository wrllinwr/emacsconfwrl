(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'init-packages)
(require 'init-better-defaults)
(require 'init-ui)
(require 'init-local)








;; code
;; fci counsel-imenu
;; fgd counsel-etags-find-tag-at-point
;; fxr xref-find-references
;; C-t pop-tag-mark
;; C-M-\ indent-region

;; M-% replace
;; M-w copy region

;; C-s search
;; C-r reverse search

;; M-x goto-line
;; C-x f 4 xxx.cpp. Split window and open file
;; C-x C-w. Save as.
;; M-d Delete the word under or following the cursor.
;; C-x C-j Jump along pwd.
;; M-h mark-paragraph.

;; M-; comment selection line, IF NOT SELECTED add comment at current line end.
;; C-u M-; comment-kill. Only delete comment of current line.
;; M-j If in comment, auto add comment at next new line.
;; comment-region




















;; (multi-term)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(vscdark))
 '(custom-safe-themes
   '("b3497e90ea04d47b195a02b3ffc9506562db90e51db107ef600abdf38e76f27a" "4c92d278dc295b63daf817d668523d442058d6c90728958dc92b6bc976fffd96" "d35afe834d1f808c2d5dc7137427832ccf99ad2d3d65d65f35cc5688404fdf30" "f2cccd540ed10f740af2ef48681d79537476ce3bda21ff813ddc9948f5071ea3" "64ca5a1381fa96cb86fd6c6b4d75b66dc9c4e0fc1288ee7d914ab8d2638e23a9" "6a01667129c89ae75a3abaa47c16784693675c0b2fbff1b0493721345df74a92" "e6cdd07a8475458edf8dfd8b5cb3d81c6bb9aa0cb8535322c21d2e242dd044ed" "95ebf5b5e0e65d2985bd6243a4747a11b8c271a6d632b4c83aadfe69c38ecfaa" "0cd56f8cd78d12fc6ead32915e1c4963ba2039890700458c13e12038ec40f6f5" "1b27e3b3fce73b72725f3f7f040fd03081b576b1ce8bbdfcb0212920aec190ad" "5912c255e7e46432d6c1c057a2124cce807ad4b901a99bc43e838db0754dff91" "729215180f26504a9b0c238d0fdd0e2f9dcae2a86b7e53b3af3604e54ea36cbc" "28cf1f7cc54ab4ee1ba4a4644046bd661941be92ef8327af56909f340cb9d3d5" "6b234feec8db588ad5ec2a9d9d7b935f7a155104b25ccfb94d921c45a2ff7d22" "0bb71ad8f63ec8550c3770fb790fbc06a0f6cf6c76a1f204c80876ef393c855c" "ff46770c9b4bf10b7cc14d88abff11b627e749057548ac50323712c80e133a87" default))
 '(package-selected-packages
   '(which-key counsel-etags helm-gtags ubuntu-theme eclipse-theme vscdark-theme vscode-icon vscode-dark-plus-theme basic-theme vegetative-theme timu-caribbean-theme auto-complete window-numbering evil-escape 0blayout undo-tree evil ag ace-window company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
