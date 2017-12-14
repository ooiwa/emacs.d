;;; init.el --- initialize Cask and load configs

;;; Commentary:

;; to install package
;; M-x package-install [RET] name [RET]
;; then, pallet automatically add it to Cask

;; to run function, C-x C-e
;; ex. (setq debug-on-error t)

;; to show variable, C-j at scratch
;; ex. (font-family-list), (frame-width)

;; to show methods, [Command] C-h
;; ex. C-c C-h - show shortcuts from C-c

;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(require 'init-loader)
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load (expand-file-name "~/.emacs.d/config"))
;; (init-loader-load (expand-file-name "~/.emacs.d/vendor"))

(add-to-list 'exec-path "/usr/local/bin")

(setq debug-on-error nil)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(irony-additional-clang-options (quote ("-std=c++14")))
 '(package-selected-packages
   (quote
    (clang-format flycheck-irony company irony cmake-mode dockerfile-mode yasnippet yaml-mode web-mode use-package smex smart-compile scss-mode ruby-refactor ruby-end ruby-electric ruby-block robe rinari python-mode projectile prodigy popwin php-mode pallet omnisharp nyan-mode multiple-cursors multi-term markdown-mode+ magit json-mode js2-mode init-loader image+ idle-highlight-mode htmlize helm-ls-git helm-c-moccur helm-ag haml-mode git-gutter git-gutter+ geeknote flycheck-pyflakes flycheck-cask expand-region exec-path-from-shell evil-smartparens evernote-mode drag-stuff coffee-mode bliss-theme auto-install apache-mode all-ext 0blayout))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
