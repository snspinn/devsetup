(add-to-list 'load-path "~/.emacs.d/")
(load-library "init")

;; Reload .emacs file by typing: M-x reload.
(defun reload () "Reloads .emacs interactively."
       (interactive)
       (load "~/.emacs"))

;; Frame appearance
;;(setq default-frame-alist
;;      '((cursor-color . "black")
;;      (foreground-color . "black")
;;(background-color . "yellow")))
(set-foreground-color "white")
(set-background-color "black")

;; Preferred key binding
(define-key ctl-x-map "x" 'copy-to-register)
(define-key ctl-x-map "g" 'insert-register)
(define-key ctl-x-map "\C-b" 'electric-buffer-list)

;; Useful stuff
(global-set-key "\M-g" 'goto-line)          ; Goto line number
(global-set-key "\M-o" 'other-window)       ; other window
(setq-default make-backup-files nil)        ; Don't leave backups
(mouse-wheel-mode t)

;; Match parenthesis
(require 'paren)
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))

;; Web mode
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.json\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[s]css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(setq-default indent-tabs-mode nil)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-block-face t)
(setq web-mode-enable-part-face t)
(setq web-mode-enable-comment-keywords t)
(setq-default tab-width 2)
