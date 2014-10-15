;; Key bind
;; see  http://memememomo.hatenablog.com/entry/2013/03/17/182626

;; 削除
(define-key global-map (kbd "C-h") 'delete-backward-char)
;; ヘルプ
(define-key global-map (kbd "M-?") 'help-for-help)
;; Undo
(define-key global-map (kbd "C-z") 'undo)
;; Indent
(define-key global-map (kbd "C-c i") 'indent-region)
;; 補完
(define-key global-map (kbd "C-c C-i") 'hippie-expand)
;; Comment Out
(define-key global-map (kbd "C-c ;") 'comment-dwim)
;; 前の画面に移動
(define-key global-map (kbd "\C-xp") (lambda () (interactive) (other-window -1)))

