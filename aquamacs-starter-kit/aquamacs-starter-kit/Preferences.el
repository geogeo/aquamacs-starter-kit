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
(require 'init)

;; (require 'markdown-mode)
;; (setq kitfiles-dir (concat (file-name-directory (or (buffer-file-name) load-file-name)) "/aquamacs-emacs-starter-kit"))

;; set up our various directories to load 
;; (add-to-list 'load-path kitfiles-dir)
;; (require 'init)
(require 'color-theme)

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
