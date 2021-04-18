
; default setting
(eval-and-compile
    (setq use-package-always-ensure t)
    (setq use-package-always-defer t)
    (setq use-package-always-demand nil)
    (setq use-package-expand-minimally t)
    (setq use-package-verbose t))

; restart-emacs C-x restart-emacs
(use-package restart-emacs)

; display-line-numbers-type
(use-package emacs :config (setq display-line-numbers-type 'relative) (global-display-line-numbers-mode t))

(use-package try 
    :ensure t)

(use-package which-key
    :ensure t
    :config
    (which-key-mode))

; window navigation
(use-package ace-window
    :bind (("M-o" . 'ace-window)))

; crux 
(use-package crux
  :bind (("C-a" . crux-move-beginning-of-line)
         ("C-c ^" . crux-top-join-line)
         ("C-x ," . crux-find-user-init-file)
         ("C-c k" . crux-smart-kill-line)))

(use-package hungry-delete
    :bind (("C-c DEL" . hungry-delete-backward)
           ("C-c d" . hungry-delete-forward)))

(use-package drag-stuff
  :bind (("<M-up>". drag-stuff-up)
         ("<M-down>" . drag-stuff-down)))

; enhance search
; (use-package ivy
;   :defer 1
;   :demand
;   :hook (after-init . ivy-mode)
;   :config
;   (ivy-mode 1) (setq ivy-use-virtual-buffers t
;         ivy-initial-inputs-alist nil
;         ivy-count-format "%d/%d "
;         enable-recursive-minibuffers t
;         ivy-re-builders-alist '((t . ivy--regex-ignore-order)))
;   (ivy-posframe-mode 1))

; (use-package counsel
;   :after (ivy)
;   :bind (("M-x" . counsel-M-x)
;          ("C-x C-f" . counsel-find-file)
;          ("C-c f" . counsel-recentf)
;          ("C-c g" . counsel-git)))

; (use-package swiper
;   :after ivy
;   :bind (("C-s" . swiper)
;          ("C-r" . swiper-isearch-backward))
;   :config (setq swiper-action-recenter t
;                 swiper-include-line-number-in-search t))


; complete
; (use-package company
;   :config
;   (setq company-dabbrev-code-everywhere t
;         company-dabbrev-code-modes t
;         company-dabbrev-code-other-buffers 'all
;         company-dabbrev-downcase nil
;         company-dabbrev-ignore-case t
;         company-dabbrev-other-buffers 'all
;         company-require-match nil
;         company-minimum-prefix-length 2
;         company-show-numbers t
;         company-tooltip-limit 20
;         company-idle-delay 0
;         company-echo-delay 0
;         company-tooltip-offset-display 'scrollbar
;         company-begin-commands '(self-insert-command))
;   (push '(company-semantic :with company-yasnippet) company-backends)
;   :hook ((after-init . global-company-mode)))

; ivy-posframe
; (use-package ivy-posframe
;   :init
;   (setq ivy-posframe-display-functions-alist
;     '((swiper . ivy-posframe-display-at-frame-center)
;       (complete-symbol . ivy-posframe-display-at-point)
;       (counsel-M-x . ivy-posframe-display-at-frame-center)
;       (counsel-find-file . ivy-posframe-display-at-frame-center)
;       (ivy-switch-buffer . ivy-posframe-display-at-frame-center)
;       (t . ivy-posframe-display-at-frame-center))))

; ; lsp mode
; (use-package lsp-mode
;     :hook (python-mode . lsp-deferred)
;     :hook (c++-mode . lsp-deferred)
;     :hook (c-mode . lsp-deferred)
;     :hook (shell-mode . lsp-deferred)
;     :hook (scala-mode . lsp-deferred)
;     :hook (julia-mode . lsp-deferred)
;     :hook (go-mode . lsp-deferred)
;     :commands (lsp lsp-deferred))

; ; optionally
; (use-package lsp-ui :commands lsp-ui-mode)
; ; if you are ivy user
; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)
; ; optionally if you want to use debugger
; (use-package dap-mode)
; ; (use-package dap-LANGUAGE) to load the dap adapter for your language


(provide 'init-package)


