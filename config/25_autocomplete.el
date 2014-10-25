(require 'auto-complete-config)
(ac-config-default)
(setq-default ac-sources '(ac-source-filename ac-source-words-in-same-mode-buffers))
(setq ac-dwim t)

(setq ac-auto-start nil)
(ac-set-trigger-key "TAB")

;; (define-key ac-completing-map (kbd “C-n”) ‘ac-next)
;; (define-key ac-completing-map (kbd “C-p”) ‘ac-previous)
