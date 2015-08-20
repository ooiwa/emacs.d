;;; 11_mode.el -- xxx-mode

;;; Commentary:

;;; Code:

;; markdown mode
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\*scratch*\\'" . markdown-mode))

;; ruby mode
(add-to-list 'auto-mode-alist '("\\Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))

;; at 24.5, wrong? encoding-magic-comment
;; (setq ruby-insert-encoding-magic-comment nil)
(defvar ruby-insert-encoding-magic-comment nil)

;; php-mode
(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))

;;; 11_mode.el ends here
