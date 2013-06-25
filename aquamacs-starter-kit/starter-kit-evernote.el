(require 'evernote-mode)
(setq evernote-developer-token "S=s23:U=260d98:E=146426dc0de:C=13eeabc94e2:P=1cd:A=en-devtoken:V=2:H=e29bd4467fa0665a1a76cecae807ecab")
(setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8")) ; optional
(global-set-key "\C-cn" 'evernote-create-note)
(provide 'starter-kit-evernote)
