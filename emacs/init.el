;;; package --- Summary
;;; Commentary:
;; GNU Emacs 26.3
;;
;;; Code:
;; ----------------------------------------
;;           Setup package archive
;; ----------------------------------------
(setq byte-compile-warnings '(cl-functions))
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
(package-initialize)

;; ----------------------------------------
;;           Setup use-package
;; ----------------------------------------
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; ----------------------------------------
;;           Install org-mode
;; ----------------------------------------
(use-package org
  :ensure t)

(setq vc-follow-symlinks t)
(require 'org)

(org-babel-load-file "~/dotfiles/emacs/myinit.org")

;; load it
(load-file "~/dotfiles/emacs/myinit.el")

;; finally byte-compile it
(byte-compile-file "~/dotfiles/emacs/myinit.el")

;;; init.el ends here
;; (put 'narrow-to-region 'disabled nil)
