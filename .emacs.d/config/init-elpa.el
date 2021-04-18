
; packages
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(
    ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
    ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
    ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
(setq package-check-signature nil)
(unless (bound-and-true-p package--initialized) (package-initialize))
(unless package-archive-contents (package-refresh-contents))
(unless (package-installed-p 'use-package) (package-refresh-contents) (package-install 'use-package))

(provide 'init-elpa)


