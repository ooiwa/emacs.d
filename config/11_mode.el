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
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq flycheck-checker 'ruby-rubocop)
             (flycheck-mode 1)))

;; at 24.5, wrong? encoding-magic-comment
;; (setq ruby-insert-encoding-magic-comment nil)
(defvar ruby-insert-encoding-magic-comment nil)

;; php-mode
(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))


;; apache-mode
(autoload 'apache-mode "apache-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))

;; cmake-mode
(add-to-list 'auto-mode-alist '("\\CMakeLists.txt\\'" . cmake-mode))

;; company
;; (when (locate-library "company")
;;   (global-company-mode 1)
;;   (global-set-key (kbd "C-M-i") 'company-complete)
;;   ;; (setq company-idle-delay nil) ; 自動補完をしない
;;   (define-key company-active-map (kbd "C-n") 'company-select-next)
;;   (define-key company-active-map (kbd "C-p") 'company-select-previous)
;;   (define-key company-search-map (kbd "C-n") 'company-select-next)
;;   (define-key company-search-map (kbd "C-p") 'company-select-previous)
;;   (define-key company-active-map (kbd "<tab>") 'company-complete-selection))

;; irony
(eval-after-load "irony"
  '(progn
     (custom-set-variables '(irony-additional-clang-options '("-std=c++14")))
     ;; (add-to-list 'company-backends 'company-irony)
     (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
     (add-hook 'c-mode-common-hook 'irony-mode)))

(eval-after-load "flycheck"
  '(progn
     (when (locate-library "flycheck-irony")
       (flycheck-irony-setup))))

(require 'clang-format)
(setq clang-format-style-option "google")
;; (global-set-key (kbd "C-c i") 'clang-format-region)
(global-set-key (kbd "C-c u") 'clang-format-buffer)


;; python
;; (add-hook 'python-mode-hook
;;           '(lambda ()
;;              (flycheck-mode 1)))

;;; 11_mode.el ends here
