;;; 01_keybind.el --- keybindings

;;; Commentary:

;; see  http://memememomo.hatenablog.com/entry/2013/03/17/182626

;;; Code:

;; 削除
(define-key global-map (kbd "C-h") 'delete-backward-char)
;; ヘルプ
(define-key global-map (kbd "M-?") 'help-for-help)
;; Undo
(global-unset-key "\C-z")
(define-key global-map (kbd "C-z") 'undo)
;; Indent
(define-key global-map (kbd "C-c i") 'indent-region)
;; 補完
(define-key global-map (kbd "C-c C-i") 'hippie-expand)
;; Comment Out
(define-key global-map (kbd "C-c ;") 'comment-dwim)
;; 前の画面に移動
(define-key global-map (kbd "\C-xp") (lambda () (interactive) (other-window -1)))

;; Open URL at the point
(defun browse-url-at-point ()
  "Open url at the point on the default browser."
  (interactive)
  (let ((url-region (bounds-of-thing-at-point 'url)))
    (when url-region
      (browse-url (buffer-substring-no-properties (car url-region)
						  (cdr url-region))))))
(global-set-key "\C-c\C-o" 'browse-url-at-point)

;;; 01_keybind.el ends here
