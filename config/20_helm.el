;;; 20_helm.el --- helm

;;; Commentary:

;;; Code:

(require 'helm-config)
(helm-mode 1)

(global-set-key (kbd "C-c h") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)


;;; helm-ag

(require 'helm-files)
(require 'helm-ag)
(require 'helm-ls-git)
(global-set-key (kbd "M-g .") 'helm-do-ag)

;;; helm-ls-git
(require 'helm-ls-git)
(global-set-key (kbd "C-x f") 'helm-ls-git-ls)

;;; 20_helm.el ends here
