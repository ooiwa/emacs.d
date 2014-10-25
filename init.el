(setq debug-on-error t)
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(require 'init-loader)
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load (expand-file-name "~/.emacs.d/config"))
