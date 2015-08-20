;;; 20_helm.el --- helm

;;; Commentary:

;;; Code:

(require 'helm-config)
(helm-mode 1)

(global-set-key (kbd "C-c h") 'helm-mini)

;;; helm-ag
;; https://github.com/syohex/emacs-helm-ag

(require 'helm-files)
(require 'helm-ag)

(global-set-key (kbd "M-g .") 'helm-do-ag)



;;; 20_helm.el ends here

