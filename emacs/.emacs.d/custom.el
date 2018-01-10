(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(gtags-suggested-key-mapping t)
 '(helm-candidate-number-limit 500)
 '(inhibit-startup-screen t)
 '(js2-basic-offset 4)
 '(magit-diff-add ((t (:inherit diff-added :weight bold))))
 '(magit-hash ((t (:background "white" :foreground "grey40"))))
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n100")))
 '(magit-log-show-margin nil)
 '(magit-popup-use-prefix-argument (quote popup))
 '(markdown-command "pandoc")
 '(nxml-child-indent 4)
 '(nxml-sexp-element-flag t)
 '(package-selected-packages
   (quote
    (ggtags projectile exec-path-from-shell magit use-package)))
 '(safe-local-variable-values
   (quote
    ((c-set-style . "knr")
     (Indent . Inktomi4)
     (Indent . Inktomi2)
     (c-comment-only-line-offset . 0)
     (c-file-offsets
      (statement-block-intro . +)
      (label . 0)
      (statement-cont . +)
      (innamespace . 0)))))
 '(scroll-bar-mode (quote right))
 '(size-indication-mode t)
 '(vc-diff-switches "-b")
 '(vc-svn-diff-switches "-x -w"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "gray12" :foreground "green" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Inconsolata"))))
 '(diff-header ((((class color) (min-colors 88) (background dark)) (:background "color-235"))))
 '(ediff-even-diff-A ((((class color) (min-colors 16)) (:background "color-237" :foreground "white"))))
 '(ediff-even-diff-B ((((class color) (min-colors 16)) (:background "color-235" :foreground "White"))))
 '(ediff-odd-diff-A ((((class color) (min-colors 16)) (:background "color-246" :foreground "black"))))
 '(ediff-odd-diff-C ((((class color) (min-colors 16)) (:background "color-246" :foreground "black"))))
 '(escape-glyph ((t (:foreground "cyan" :inverse-video t))))
 '(font-lock-comment-face ((t (:foreground "yellow"))))
 '(helm-selection ((t (:background "red" :distant-foreground "red"))))
 '(match ((((class color) (min-colors 8) (background dark)) (:background "lightblue" :foreground "white" :inverse-video nil :box (:line-width 2 :color "yellow" :style released-button) :slant italic))))
 '(region ((t (:background "red"))) nil "what the hell?")
 '(secondary-selection ((t (:background "yellow" :foreground "black"))))
 '(svn-status-marked-face ((((type tty) (class color)) (:background "color-18" :foreground "brightgreen" :weight light))))
 '(svn-status-marked-popup-face ((((type tty) (class color)) (:foreground "brightgreen" :weight light)))))
