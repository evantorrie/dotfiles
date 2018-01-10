;; disable gc until after init for fast-startup
(setq gc-cons-threshold 64000000)
(add-hook 'after-init-hook #'(lambda ()
			       ;; restore after startup
			       (setq gc-cons-threshold 800000)))

(setq package-user-dir "~/docs/emacs/elpa")

; Requires emacs-25 or later
(require 'package)
(package-initialize)

(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))
(unless (assoc-default "org" package-archives)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t))

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq user-package-verbose t)


(setq user-full-name "Evan Torrie"
      user-mail-address "etorrie@gmail.com")

(setq backup-directory-alist '(("." . "~/docs/emacs/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/docs/emacs/auto-save-list/" t)))

;; Never use tabs!
(setq-default indent-tabs-mode nil)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package helm
  :ensure t
  :bind (
         ("C-c h" . helm-command-prefix)
         ("M-x" . helm-M-x))
  )

(use-package projectile
  :ensure t
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (progn
    (projectile-global-mode)
    (setq projectile-completion-system 'helm))
  :config
  (progn
    (helm-projectile-on))
  )

(use-package helm-projectile
  :ensure t)

(use-package ggtags
  :ensure t
  :commands ggtags-mode
  :config 
  (unbind-key "M-<" ggtags-mode-map)
  (unbind-key "M->" ggtags-mode-map))

(use-package cc-mode
  :ensure nil
  :config
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
                (ggtags-mode 1)))))


(use-package projectile-ripgrep
  :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :init
  (when (memq window-system '(mac ns))
    (progn
      (exec-path-from-shell-initialize)
      (exec-path-from-shell-copy-env "SSH_AUTH_SOCK")))
)


(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
