;; Examples:
;;
     ;; (key-chord-define-global ",."     "<>\C-b")
(key-chord-define-global "hj"     'redo)
(key-chord-define-global "jk"     'undo)
;;      (key-chord-define-global [?h ?j]  'undo)  ; the same
;;      (key-chord-define-global "jk"     'dabbrev-expand)
;;      (key-chord-define-global "cv"     'reindent-then-newline-and-indent)
     ;; (key-chord-define-global "4r"     "$")
;;
;; Comma and dot pressed together insert a pair of angle brackets.
;; `h' and `j' pressed together invoke the undo command.
;; `j' and `k' pressed together invoke the dabbrev-expand command.
;; 'c' and 'v' pressed together insert a newline.
;; `4' and `r' pressed together insert a dollar sign.
;;
;; A ONE-key chord is a single key quickly pressed twice (within one third
;; of a second or so). 
;;
;; Examples:
;;
(key-chord-define-global "ww" 'er/expand-region) ;;
(key-chord-define-global "kp" 'kill-paragraph) ;;


;; ================= ace-jumpe-mode ==========================
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; ================= expand-region ===========================
(global-set-key (kbd "C-=") 'er/expand-region)

;; ================= zencoding ===============================
(global-set-key (kbd "C-c z") 'zencoding-expand-line)

;; ================= multi-cursor ============================
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; ================= iy-go-to-char ===========================
(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
(global-set-key (kbd "C-c ;") 'iy-go-to-char-continue)
(global-set-key (kbd "C-c ,") 'iy-go-to-char-continue-backward)


(provide 'keychord-settings)
