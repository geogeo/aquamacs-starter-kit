;; This is the Aquamacs Preferences file.
;; Add Emacs-Lisp code here that should be executed whenever
;; you start Aquamacs Emacs. If errors occur, Aquamacs will stop
;; evaluating this file and print errors in the *Messags* buffer.
;; Use this file in place of ~/.emacs (which is loaded as well.)


;; Aquamacs Emacs Starter Kit
;; set the dotfiles-dir variable to this directory
(setq default-tab-width 2)


;; Aquamacs Emacs Starter Kit
;; http://github.com/walter/aquamacs-emacs-starter-kit
;; set the dotfiles-dir variable to this directory
(setq kitfiles-dir (concat (file-name-directory
                            (or (buffer-file-name) load-file-name)) "/aquamacs-starter-kit"))
 
 ;; set up our various directories to load
 (add-to-list 'load-path kitfiles-dir)
 (require 'smart-compile)
 
                                         ; solve the org-called-interatively-p invalid error
 (defalias 'org-called-interactively-p 'called-interactively-p)
 
 ;; (require 'init)
 ;; (setq py-load-pymacs-p 'nil)
 ;; (require 'markdown-mode)
 ;; (setq kitfiles-dir (concat (file-name-directory (or
;; (buffer-file-name) load-file-name)) "/ aquamacs-emacs-starter-kit"))
 
 ;; set up our various directories to load
 ;; (add-to-list 'load-path kitfiles-dir)
 (require 'init)
 ;; (require 'color-theme)
 
 (color-theme-molokai)
 
 (auto-fill-mode 0)
 
 ;; Chinese Fonts
 (set-language-environment "Chinese-GB")(prefer-coding-system 'utf-8)
(create-fontset-from-fontset-spec
 "-apple-bitstream vera sans mono-medium-r-normal--12-*-*-*-*-*-fontset-mymonaco,
ascii:-apple-Monaco-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1,
chinese-gb2312:-apple-STHeiti-medium-normal-normal-12-*-*-*-*-p-0-iso10646-1,
latin-iso8859-1:-apple-Monaco-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1,
mule-unicode-0100-24ff:-apple-Monaco-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1")

(setq default-frame-alist (append '((font . "fontset-mymonaco")) default-frame-alist))
(set-default-font "fontset-mymonaco")
;; Chinese Fonts End
(defun browse-url-firefox-on-mac (url &rest ignored)
  (do-applescript
   (format "tell application \"Firefox\" to open location \"%s\"" url)))
(setq browse-url-browser-function 'browse-url-firefox-on-mac)


;; (global-set-key "\C-ceo" 'evernote-open-note)
;; (global-set-key "\C-ces" 'evernote-search-notes)
;; (global-set-key "\C-ceS" 'evernote-do-saved-search)
;; (global-set-key "\C-cew" 'evernote-write-note)
;; (global-set-key "\C-cep" 'evernote-post-region)
;; (global-set-key "\C-ceb" 'evernote-browser)
;; (require 'rvm)
;; (rvm-use-default)

;; (global-set-key "C-ceb" 'evernote-this-org-note)
;; (add-hook 'org-capture-after-finalize-hook 'evernote-this-org-note)

;; (defun evernote-this-org-note(&optional arg)
;;   "select note"
;;   (interactive "P")
;;   (beginning-of-buffer)
;;   (re-search-forward "^\*.*")
;;   (backward-word 1)
;;   (beginning-of-line )
;;   (copy-line)
;;   (forward-line)
;;   (evernote-post-region-4-org-mode (point) (point-max) "test")
;;   )

;; (defun evernote-post-region-4-org-mode (begin end arg)
;;   "Post the region as a note"
;;   (interactive "r\np")
;;   (enh-command-with-auth
;;    (save-excursion
;;      (save-restriction
;;        (narrow-to-region begin end)
;;        (if (and (enutil-neq arg nil) (enutil-neq arg 1))

;;                                         ;           (pop-to-buffer (enh-base-create-note-common (buffer-name) t t t))
;;            (enh-base-create-note-common (current-kill 0) nil nil  nil t))))))

(setenv "LANG" "en_US.UTF-8")
