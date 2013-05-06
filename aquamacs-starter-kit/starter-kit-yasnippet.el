;;; starter-kit-yasnippet.el
;;
;; Part of the Emacs Starter Kit
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (expand-file-name "snippets" dotfiles-dir))
(setq yas/use-menu 'abbreviate)
;; dropdown-list
(require 'dropdown-list)
(setq yas/prompt-functions '(yas/dropdown-prompt))
(provide 'starter-kit-yasnippet)
;; starter-kit-yasnippet.el ends here
