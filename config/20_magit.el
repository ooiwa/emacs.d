;;; 20_magit.el --- magit config

;;; Commentary:

;; CheatSeat - http://orthogonal.me/2012/06/23/magit-keybindings/

;;; magit-status
;; Tab - show or hide diff
;; s - stage
;; c - commit
;; g - reload
;; k - delete

;;; edit commit message
;; C-c C-c - commit
;; C-c C-k - cancel

;;; Code:

(global-set-key (kbd "C-x g") 'magit-status)

;;; 20_magit.el ends here
