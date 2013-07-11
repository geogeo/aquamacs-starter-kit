;;; starter-kit-eshell.el --- Making the defaults a bit saner
;;
;; Part of the Emacs Starter Kit

(setq eshell-cmpl-cycle-completions nil
      eshell-save-history-on-exit t
      eshell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'")

(eval-after-load 'esh-opt
  '(progn
     (require 'em-prompt)
     (require 'em-term)
     (require 'em-cmpl)
     (setenv "PAGER" "cat")
     (set-face-attribute 'eshell-prompt nil :foreground "turquoise1")
     (add-hook 'eshell-mode-hook ;; for some reason this needs to be a hook
               '(lambda () (eshell/export "TERM" "dumb")))
     (when (< emacs-major-version 23)
       (add-hook 'eshell-mode-hook ;; for some reason this needs to be a hook
                 '(lambda () (define-key eshell-mode-map "\C-a" 'eshell-bol)))
       (add-to-list 'eshell-output-filter-functions 'eshell-handle-ansi-color))

     ;; TODO: submit these via M-x report-emacs-bug
     (add-to-list 'eshell-visual-commands "ssh")
     (add-to-list 'eshell-visual-commands "tail")
     (add-to-list 'eshell-command-completions-alist
                  '("gunzip" "gz\\'"))
     (add-to-list 'eshell-command-completions-alist
                  '("tar" "\\(\\.tar|\\.tgz\\|\\.tar\\.gz\\)\\'"))))

(defun eshell/cds ()
  "Change directory to the project's root."
  (eshell/cd (locate-dominating-file default-directory "src")))

(defun eshell/find (dir &rest opts)
  (find-dired dir (mapconcat 'identity opts " ")))

  (defmacro with-face (str &rest properties)
    `(propertize ,str 'face (list ,@properties)))
  
(defun shk-eshell-prompt ()
    (let ((header-bg "#7a378b"))
      (concat
       (with-face (concat (eshell/pwd) " ") :background header-bg)
       (with-face (format-time-string "(%Y-%m-%d %H:%M) " (current-time)) :background header-bg :foreground "#fff")
       (with-face
        (or (ignore-errors (format "(%s)" (vc-responsible-backend default-directory))) "")
        :background header-bg)
       (with-face "\n" :background header-bg)
       ;; (with-face user-login-name :foreground "blue")
       ;; "@"
       ;; (with-face "localhost" :foreground "green")
       (curr-dir-git-branch-string (eshell/pwd))
       (if (= eshell-last-command-status 0)
           (with-face "O(∩_∩)O~ $" :foreground "green")
         (with-face "╮o(︶︿︶)o #" :foreground "red"))
       " ")))
  (setq eshell-prompt-function 'shk-eshell-prompt)
(setq eshell-highlight-prompt nil)
(add-hook 'eshell-preoutput-filter-functions
          'ansi-color-filter-apply)

(add-hook 'eshell-preoutput-filter-functions
          'ansi-color-apply)
(defun curr-dir-git-branch-string (pwd)
  "Returns current git branch as a string, or the empty string if
PWD is not in a git repo (or the git command is not found)."
  (interactive)
  (when (locate-dominating-file pwd ".git")
    (let ((git-output (shell-command-to-string (concat "cd " pwd " && git branch | grep '\\*' | sed -e 's/^\\* //'"))))
      (concat "["
              (if (> (length git-output) 0)
                  (substring git-output 0 -1)
                "(no branch)")
              "]")
      )))

;; (defun eshell/scp (&rest args)
;;   "scp: now without colon-omitting annoyance!"
;;   (when (null (remove-if-not (lambda (arg) (string-match ":" arg))
;;                              args))
;;     (error "Surely you meant to add a colon in there somewhere?"))
;;   (shell-command (mapconcat 'identity (cons "scp" args) " ")))

;; Port features from
;; http://blog.peepcode.com/tutorials/2009/shell-method-missing/shell_method_missing.rb
;; * cloning git repos, github repos
;; * downloading http urls
;; * extracting archives
;; * changing to directories

(provide 'starter-kit-eshell)
;;; starter-kit-eshell.el ends here
