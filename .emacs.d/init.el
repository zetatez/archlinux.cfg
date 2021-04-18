
; code set
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq max-lisp-eval-depth 10000)
(setq max-specpdl-size 10000)

; os type
(defconst *is-mac* (eq system-type 'darwin))
(defconst *is-linux* (eq system-type 'gnu/linux))
(defconst *is-windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))

; gcc
(setq gc-cons-threshold most-positive-fixnum)

; load config
(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "config")))
(require 'init-elpa)
(require 'init-package)
(require 'init-ui)

