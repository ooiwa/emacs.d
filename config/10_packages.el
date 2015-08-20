;;; 10_packages.el --- simple settings for packages

;;; Commentary:

;; at ido-mode, C-j can
;; - create new file
;; - enter dired

;;; Code:

(require 'dired-x)
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

(require 'uniquify)

;; show git-gutter
(global-git-gutter-mode +1)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; ido-mode
(ido-mode t)

;; smart-parens
(require 'smartparens-config)
(smartparens-global-mode t)

;;; 10_packages.el ends here
