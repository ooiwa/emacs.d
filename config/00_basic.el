;;; 00_basic.el --- basic settings

;;; Commentary:

;;; Code:

(require 'server)
(unless (server-running-p)
  (server-start))

;; 日本語設定
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)

;; デフォルトディレクトリ
(setq default-directory "~/")
(setq command-line-default-directory "~/")

;; Change Japanese font from Wawati SC (default)
;; see http://minus9d.hatenablog.com/entry/20131103/1383475472
;; (set-face-attribute 'default nil
;;     :family "Menlo"
;;     :height 100) ;; font size 100 = 10pt
;; (set-fontset-font nil 'japanese-jisx0208
;;                  (font-spec :family "Hiragino Kaku Gothic ProN" :size 9.5))

;; 半角と全角の比を1:2にしたければ
(setq face-font-rescale-alist
      '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.2)));; Mac用フォント設定

;; Theme
;; see http://d.hatena.ne.jp/aoe-tk/20130210/1360506829w
(require 'bliss-theme)

(setq max-lisp-eval-depth 10000)

;; 透明度
(defun set-alpha (alpha-num)
  "Set ALPHA-NUM frame parameteralpha."
  (interactive "nAlpha: ")
  (set-frame-parameter nil 'alpha (cons alpha-num '(80))))
(set-alpha 90)


;; メニューバーを消す
(menu-bar-mode -1)
;; ツールバーを消す
(tool-bar-mode -1)
;; 行番号表示
(global-linum-mode t)
;; カーソルの点滅をとめる
(blink-cursor-mode 0)
;; 対応する括弧を光らせる
(show-paren-mode 1)
;; ウィンドウ内に収まらないときだけカッコ内も光らせる
(setq show-paren-style 'mixed)

;; 現在行を目立たせる
;; (global-hl-line-mode)
(require 'hl-line)
(defun global-hl-line-timer-function ()
  (global-hl-line-unhighlight-all)
  (let ((global-hl-line-mode t))
    (global-hl-line-highlight)))
(setq global-hl-line-timer
      (run-with-idle-timer 0.03 t 'global-hl-line-timer-function))


;; 行の先頭をC-kを一回押すだけで行全体を表示する
(setq kill-whole-line t)
;; 最終行に必ず一行挿入する
(setq require-final-newline t)
;; バッファの最後でnewlineで新規行を追加するのを禁止する
(setq next-line-add-newlines nil)
;; 画面異動をShift+矢印で
(windmove-default-keybindings)
;; 折り返す
(global-set-key (kbd "C-c t") 'toggle-truncate-lines)

;; バックアップファイルを作らない
(setq make-backup-files nil)
;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)
;; Avoid TRAMP error
;; https://lists.gnu.org/archive/html/help-gnu-emacs/2005-10/msg00102.html
(setq auto-save-file-name-transforms nil)

;;; デフォルトのタブ
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;; 警告音なし
(setq ring-bell-function 'ignore)
;; 最初の画面を消す
(setq inhibit-startup-message t)
;; メッセージも消す
(setq initial-scratch-message nil)

;;; 補完
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
;; 補完可能なものを随時表示
(icomplete-mode 1)

;; 変更されたら開き直す
(global-auto-revert-mode 1)

;; 最大化する
(set-frame-position (selected-frame) 0 0)
(set-frame-size (selected-frame) 189 51)
;; Undo tree
;; (global-undo-tree-mode)

;;; auto save and restore scratch buffer
(defun save-scratch-data ()
  (let ((str (progn
               (set-buffer (get-buffer "*scratch*"))
               (buffer-substring-no-properties
                (point-min) (point-max))))
        (file "~/.emacs.d/.scratch"))
    (if (get-file-buffer (expand-file-name file))
        (setq buf (get-file-buffer (expand-file-name file)))
      (setq buf (find-file-noselect file)))
    (set-buffer buf)
    (erase-buffer)
    (insert str)
    (save-buffer)
    (kill-buffer buf)))

(defadvice save-buffers-kill-emacs
  (before save-scratch-buffer activate)
  (save-scratch-data))

(defun read-scratch-data ()
  (let ((file "~/.emacs.d/.scratch"))
    (when (file-exists-p file)
      (set-buffer (get-buffer "*scratch*"))
      (erase-buffer)
      (insert-file-contents file))
    ))


(read-scratch-data)


;;; 00_basic.el ends here
