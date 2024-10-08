(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(gtags-suggested-key-mapping t)
 '(helm-candidate-number-limit 500)
 '(helm-ff-skip-boring-files t)
 '(inhibit-startup-screen t)
 '(js-indent-level 4)
 '(magit-diff-add ((t (:inherit diff-added :weight bold))))
 '(magit-hash ((t (:background "white" :foreground "grey40"))))
 '(magit-log-arguments '("--graph" "--color" "--decorate" "-n100"))
 '(magit-log-show-margin nil)
 '(magit-popup-use-prefix-argument 'popup)
 '(magit-status-sections-hook
   '(magit-insert-status-headers magit-insert-merge-log magit-insert-rebase-sequence magit-insert-am-sequence magit-insert-sequencer-sequence magit-insert-bisect-output magit-insert-bisect-rest magit-insert-bisect-log magit-insert-untracked-files magit-insert-unstaged-changes magit-insert-staged-changes magit-insert-modules magit-insert-stashes magit-insert-unpushed-to-pushremote magit-insert-unpushed-to-upstream-or-recent magit-insert-unpulled-from-pushremote magit-insert-unpulled-from-upstream))
 '(markdown-command "pandoc" t)
 '(mode-require-final-newline 'visit-save)
 '(ns-right-alternate-modifier 'super)
 '(nxml-child-indent 4)
 '(nxml-sexp-element-flag t)
 '(package-selected-packages
   '(multiple-cursors helm-helm-commands rg wgrep wgrep-helm lsp-mode eglot edit-indirect flycheck-clang-analyzer irony flycheck-golangci-lint helm-rg magit-gh-pulls dockerfile-mode groovy-mode blacken helm-ag go-mode flycheck-yaml flycheck-yamllint yaml-mode virtualenvwrapper git-timemachine flycheck-pos-tip helm-config helm-descbinds helm-projectile helm outline-toc bazel-mode markdown-mode outline-magic vimish-fold diminish json-mode js2-mode editorconfig flycheck ggtags projectile exec-path-from-shell magit use-package))
 '(safe-local-variable-values
   '((git-commit-major-mode . git-commit-elisp-text-mode)
     (bug-reference-bug-regexp . "#\\(?2:[0-9]+\\)")
     (c-set-style . "knr")
     (Indent . Inktomi4)
     (Indent . Inktomi2)
     (c-comment-only-line-offset . 0)
     (c-file-offsets
      (statement-block-intro . +)
      (label . 0)
      (statement-cont . +)
      (innamespace . 0))))
 '(scroll-bar-mode 'right)
 '(size-indication-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(vc-diff-switches "-b")
 '(vc-svn-diff-switches "-x -w")
 '(yaml-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "gray12" :foreground "green" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Inconsolata Nerd Font Mono"))))
 '(diff-header ((((class color) (min-colors 88) (background dark)) (:background "color-235"))))
 '(ediff-even-diff-A ((((class color) (min-colors 16)) (:background "color-237" :foreground "white"))))
 '(ediff-even-diff-B ((((class color) (min-colors 16)) (:background "color-235" :foreground "White"))))
 '(ediff-even-diff-C ((t (:background "dark gray"))))
 '(ediff-odd-diff-A ((t (:background "color-246" :foreground "gray31"))))
 '(ediff-odd-diff-C ((t (:background "color-246" :foreground "gray40"))))
 '(escape-glyph ((t (:foreground "cyan" :inverse-video t))))
 '(font-lock-comment-face ((t (:foreground "yellow"))))
 '(helm-buffer-directory ((t (:background "LightGray" :foreground "dark blue"))))
 '(helm-ff-directory ((t (:foreground "LightGreen"))))
 '(helm-selection ((t (:background "dark magenta"))))
 '(isearch ((t (:background "palevioletred2" :foreground "light green" :slant italic :weight bold))))
 '(magit-dimmed ((t (:foreground "grey75"))))
 '(magit-hash ((t (:foreground "grey70"))))
 '(match ((((class color) (min-colors 8) (background dark)) (:background "lightblue" :foreground "white" :inverse-video nil :box (:line-width 2 :color "yellow" :style released-button) :slant italic))))
 '(region ((t (:background "dark red"))) nil "what the hell?")
 '(secondary-selection ((t (:background "yellow" :foreground "black"))))
 '(svn-status-marked-face ((((type tty) (class color)) (:background "color-18" :foreground "brightgreen" :weight light))))
 '(svn-status-marked-popup-face ((((type tty) (class color)) (:foreground "brightgreen" :weight light)))))
