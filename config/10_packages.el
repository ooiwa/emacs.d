;;; 10_packages.el --- simple settings for packages

;;; Commentary:

;;; Code:

(require 'dired-x)
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

(require 'uniquify)

;; show git-gutter
(global-git-gutter-mode +1)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;;; 10_packages.el ends here
