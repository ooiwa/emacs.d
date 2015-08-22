;;; 10_packages.el --- simple settings for packages

;;; Commentary:

;; at ido-mode, C-j can
;; - create new file
;; - enter dired

;;; Code:

(require 'dired-x)
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
;; M-x image-dired すごい

(require 'uniquify)

;; show git-gutter
(global-git-gutter-mode +1)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; ido-mode
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)

;; smart-parens
(require 'smartparens-config)
(smartparens-global-mode -1)

;; multi-term
(setq multi-term-program "/bin/zsh")
(setq system-uses-terminfo nil)
(global-set-key (kbd "C-c t") 'multi-term)
(global-set-key (kbd "C-c n") 'multi-term-next)
(global-set-key (kbd "C-c p") 'multi-term-prev)
(multi-term)
(add-hook 'term-mode-hook
          (lambda ()
            (define-key term-raw-map (kbd "C-\\") 'other-window)
            (define-key term-raw-map (kbd "C-y") 'term-paste)
            (define-key term-raw-map (kbd "C-h") 'term-send-backspace)
            (define-key term-raw-map (kbd "M-d") 'term-send-forward-kill-word)
            (define-key term-raw-map (kbd "M-<backspace>") 'term-send-backward-kill-word)
            (define-key term-raw-map (kbd "M-DEL") 'term-send-backward-kill-word)
            (define-key term-raw-map (kbd "C-v") nil)
            (define-key term-raw-map (kbd "ESC ESC") 'term-send-raw)
            (define-key term-raw-map (kbd "C-q") 'toggle-term-view)
            ))
(setq multi-term-program shell-file-name
     ansi-term-color-vector [term
                             term-color-black
                             term-color-green
                             term-color-yellow
                             term-color-cyan
                             term-color-magenta
                             term-color-cyan
                             term-color-white])

;; image+
(eval-after-load 'image '(require 'image+))
(eval-after-load 'image+ '(imagex-auto-adjust-mode 1))


;; whitespace
(require 'whitespace)
(setq whitespace-style '(face
                         trailing
                         tabs
                         spaces
                         empty
                         space-mark
                         tab-mark
                         ))
(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        ;; スペースが・になって非常に見難いのを治す。
        ;;
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
(setq whitespace-action '(auto-cleanup))
(global-whitespace-mode 1)
(defvar my/bg-color "#232323")
(set-face-attribute 'whitespace-trailing nil
                    :background my/bg-color
                    :foreground "DeepPink"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background my/bg-color
                    :foreground "LightSkyBlue"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :background my/bg-color
                    :foreground "GreenYellow"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                    :background my/bg-color)


;; Evernote: geeknote
(require 'geeknote)
(global-set-key (kbd "C-c g c") 'geeknote-create)
(global-set-key (kbd "C-c g e") 'geeknote-edit)
(global-set-key (kbd "C-c g f") 'geeknote-find)
(global-set-key (kbd "C-c g s") 'geeknote-show)
(global-set-key (kbd "C-c g r") 'geeknote-remove)
(global-set-key (kbd "C-c g m") 'geeknote-move)
;; (setq geeknote-command "python /usr/local/lib/python2.7/site-packages/geeknote-0.2a0-py2.7.egg/geeknote/geeknote.py")
(setq geeknote-command "/usr/local/bin/python /usr/local/lib/python2.7/site-packages/geeknote-0.2a0-py2.7.egg/geeknote/geeknote.py")


;;; 10_packages.el ends here
