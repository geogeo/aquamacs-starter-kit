;;; Enable syntax highlighting in source blocks
;;; (setq org-src-fontify-natively t)

;;; Disable the confirmation before each evaluation
;; (require 'org-install)
;; (add-to-list 'org-modules 'org-timer)
;; (setq org-timer-default-timer 25)
;; (add-hook 'org-clock-in-hook '(lambda () 
;;       (if (not org-timer-current-timer) 
;;       (org-timer-set-timer '(16)))))
;; (setq org-confirm-babel-evaluate nil)

;;; Enable clojure and disable emacs-lisp
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((clojure . t)
;;    (emacs-lisp . nil)
;;    ))
(setq org-directory "~/Dropbox/org")
(setq org-default-notes-file "~/Dropbox/org/refile.org")
(setq org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org")
(setq org-mobile-directory "~/Dropbox/orgmobile")
;; (setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

; publish octopress blog
(setq org-publish-project-alist
   '(("blog" .  (:base-directory "~/Dropbox/octopress/source/_org_posts/"
                 :base-extension "org"
                 :publishing-directory "~/Dropbox/octopress/source/_posts/"
                 :sub-superscript ""
                 :recursive t
                 :publishing-function org-html-publish-to-html
                 :headline-levels 4
                 :html-extension "markdown"
                 :body-only t))))


(setq org-capture-templates
      (quote (("t" "Todo" entry (file+headline 'org-default-notes-file "Tasks")
               "* TODO %* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("r" "respond" entry (file 'org-default-notes-file)
               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
              ("n" "note" entry (file 'org-default-notes-file)
               "* %?:NOTE:\n%i\n" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree "~/Dropbox/org/diary.org")
               "* %?\n%i\n" :clock-in t :clock-resume t)
              ("w" "org-protocol" entry (file 'org-default-notes-file)
               "* TODO Review %c\n%U\n" :immediate-finish t)
              
              )))
(setq org-agenda-files (list  "~/Dropbox/org/refile.org"))
(global-set-key "\C-ca" 'org-agenda)
;; ;; Remove empty LOGBOOK drawers on clock out
;; (defun bh/remove-empty-drawer-on-clock-out ()
;;   (interactive)
;;   (save-excursion
;;     (beginning-of-line 0)
;;     (org-remove-empty-drawer-at "LOGBOOK" (point))))

;; (add-hook 'org-clock-out-hook 'bh/remove-empty-drawer-on-clock-out 'append)
(provide 'starter-kit-org)
