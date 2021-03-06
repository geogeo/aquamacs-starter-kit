#!/bin/bash


## Copyright (C) 2012 Thierry Volpiatto <thierry.volpiatto@gmail.com>
## 
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Commentary:

# Preconfigured Emacs with a basic helm configuration.
# Useful to start quickly an emacs -Q with helm.
# Run it from this directory.

TMP="/tmp/helm-cfg.el"
LOADPATH=`dirname $0`
cat > $TMP <<EOF
(setq initial-scratch-message (concat initial-scratch-message
";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n\
;; This Emacs is Powered by \`HELM'.\n\
;; This is a minimal \`helm' configuration to discover \`helm' or debug it.\n\
;; You can retrieve this minimal configuration in \"$TMP\" \n\
;; Some originals emacs commands have been replaced by own \`helm' commands:\n\n\
;; - \`find-file'(C-x C-f)           =>\`helm-find-files'\n\
;; - \`occur'(M-s o)                 =>\`helm-occur'\n\
;; - \`list-buffers'(C-x C-b)        =>\`helm-buffers-list'\n\
;; - \`completion-at-point'(M-tab)   =>\`helm-lisp-completion-at-point'\n\n\
;; Some others native emacs commands are \"helmized\" by \`helm-mode'.\n\
;; You will find embeded help for most helm commands with \`C-c ?'.\n\
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n\n"))

(setq default-frame-alist '((vertical-scroll-bars . nil)
                            (tool-bar-lines . 0)
                            (menu-bar-lines . 0)
                            (fullscreen . nil)))
(blink-cursor-mode -1)
(add-to-list 'load-path (expand-file-name "$LOADPATH"))
(require 'helm-config)
(helm-mode 1)
(define-key global-map [remap find-file] 'helm-find-files)
(define-key global-map [remap occur] 'helm-occur)
(define-key global-map [remap list-buffers] 'helm-buffers-list)
(define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
(define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point)
(add-hook 'kill-emacs-hook #'(lambda () (delete-file "$TMP")))
(cd "~/")
EOF
emacs -Q -l $TMP $@
