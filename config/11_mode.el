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

;; smart-compile
(require 'smart-compile)
(add-hook 'ruby-mode-map-hook
          '(lambda ()
　　　　　　　　(define-key ruby-mode-map (kbd "C-c c") 'smart-compile)
　　　　　　　))

(require 'rinari)
(setq ruby-deep-indent-paren-style nil)

(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-electric-expand-delimiters-list nil)
(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line)
)

(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)


;; see http://willnet.in/13
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))
