;;; init --- ET's initialization system
;;; Commentary:


;;; Code:
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

(setq user-full-name "Evan Torrie"
      user-mail-address "etorrie@gmail.com")

;; Backups and autosaves should be saved elsewhere
(setq backup-directory-alist '(("." . "~/docs/emacs/backups")))
(setq auto-save-file-name-transforms '((".*" "~/docs/emacs/auto-save-list/" t)))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)

;; I don't need the toolbar
(tool-bar-mode -1)

;; I prefer UTF-8 if I can
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(setq-default indent-tabs-mode nil) ;; Never use tabs!

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-verbose t)
(setq use-package-always-ensure t)

(use-package rg
  :init
  (rg-enable-default-bindings)
  )

(use-package wgrep
  )

(use-package diminish
  )

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package git-timemachine
  :bind ("C-x v g" . git-timemachine-toggle)
  )

(use-package virtualenvwrapper
  :init
  (venv-initialize-interactive-shells)
  )

(use-package flycheck-pos-tip
  )

(use-package flycheck
  :init
  (global-flycheck-mode)
  :config
  (flycheck-pos-tip-mode)
  )

(use-package flycheck-yamllint)

;; Don't use flymake when flycheck is installed
(use-package flymake
  :disabled t)

;(use-package helm-ag)

(use-package yaml-mode
  :mode (("\\.yml\\'" . yaml-mode)
         ("\\.yaml\\'" . yaml-mode))
  )

(use-package editorconfig
  :config
  (editorconfig-mode 1)
  )

(use-package go-mode
  :mode (("\\.go$" . go-mode)))

(use-package js2-mode
  :mode (("\\.js$" . js2-mode)))

(use-package json-mode
  :mode (("\\.json$" . json-mode))
  :config
  (add-hook 'json-mode-hook
            (lambda ()
              (make-local-variable 'js-indent-level)
              (setq js-indent-level 2)))
)

(use-package helm
  :diminish helm-mode
  :init
  (setq helm-command-prefix-key "C-c h")
  (setq helm-split-window-default-side 'other)
  :config
  (helm-mode 1)
  :bind (
         ("M-x"     . helm-M-x)
         ("M-y"     . helm-show-kill-ring)
         ("C-M-z"   . helm-resume)
         ("C-x C-f" . helm-find-files)
         ("C-x f"   . helm-recentf)
         :map helm-map
         ("<tab>" . helm-execute-persistent-action)
         ("C-i" . helm-execute-persistent-action)
         ("C-z" . helm-select-action))
  )

(use-package helm-descbinds
  :bind (("C-h b" . helm-descbinds)))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (progn
    (projectile-mode)
    (setq projectile-completion-system 'helm))
  :config
  (progn
    (helm-projectile-on)
    (setq projectile-indexing-method 'alien))
  )

(use-package helm-projectile
  )

(use-package ggtags
  :commands ggtags-mode
  :config
  (unbind-key "M-<" ggtags-mode-map)
  (unbind-key "M->" ggtags-mode-map))

(use-package cc-mode
  :config
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
                (progn
                  (ggtags-mode 1)
                  (outline-minor-mode))
                ))))

(use-package outline-magic
  :bind (:map outline-minor-mode-map
              ("<C-tab>" . outline-cycle))
)

(use-package bazel-mode
  :mode "\\.bzl\\'")

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package exec-path-from-shell
  :init
  (when (memq window-system '(mac ns))
    (progn
      (exec-path-from-shell-initialize)
      (exec-path-from-shell-copy-env "SSH_AUTH_SOCK")))
)


(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)
;;; init.el ends here
