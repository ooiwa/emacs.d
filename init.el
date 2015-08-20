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

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(require 'init-loader)
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load (expand-file-name "~/.emacs.d/config"))
(init-loader-load (expand-file-name "~/.emacs.d/vendor"))

(add-to-list 'exec-path "/usr/local/bin")

(setq debug-on-error t)

;;; init.el ends here
