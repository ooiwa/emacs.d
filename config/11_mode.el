;; markdown mode
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\*scratch*\\'" . markdown-mode))

;; ruby mode
(add-to-list 'auto-mode-alist '("\\Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))

;; php-moden
(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))


(setq ruby-insert-encoding-magic-comment nil)
