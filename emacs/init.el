(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
 		    (not (gnutls-available-p))))
        (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
   (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
   ;; For important compatibility libraries like cl-lib
   (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(unless (package-installed-p 'use-package)
   (package-refresh-contents)
   (package-install 'use-package))
 
(require 'use-package)
(setq use-package-always-ensure t)

;; Install packages
(use-package rainbow-delimiters)
(use-package git-gutter)
(use-package avy)
(use-package auto-complete)
;; (use-package beacon)
(use-package rainbow-mode)
(use-package neotree)
(use-package minimap)
;; (use-package hlinum)
(use-package helm)
(use-package smart-mode-line)
(use-package evil)
;; (use-package color-theme-sanityinc-tomorrow)
(use-package diminish)
(use-package fill-column-indicator)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("ed317c0a3387be628a48c4bbdb316b4fa645a414838149069210b66dd521733f" "6de7c03d614033c0403657409313d5f01202361e35490a3404e33e46663c2596" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(package-selected-packages
   (quote
<<<<<<< b4863ad9bb8493c6cb92ce455d4390820f9a3480
    (matlab-mode fill-column-indicator rainbow-delimiters git-gutter avy auto-complete beacon rainbow-mode neotree minimap hlinum helm smart-mode-line evil color-theme-sanityinc-tomorrow use-package diminish))))
=======
    (rainbow-delimiters avy auto-complete beacon rainbow-mode neotree minimap smart-mode-line evil use-package diminish))))
>>>>>>> Add more packages to Emacs
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2d2d2d" :foreground "#cccccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "PfEd" :family "DejaVu Sans Mono for Powerline")))))

;; No splash screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Font
(set-face-font 'default' "DejaVu Sans Mono for Powerline:10")

;; Show line number
;; (setq linum-format "%4d \u2502 ")
(setq linum-format "%4d ")
(global-linum-mode 1)
;; (global-hl-line-mode 1)

;; Disable tool bar and scroll bar
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

;; - ;; Use-package
;; - (eval-when-compile
;; -   (require 'use-package))
;; - (require 'diminish)
;; - (require 'bind-key)
;; - 
;; Use Evil for Vim-like movement
(require 'evil)
(evil-mode 1)

;; Color theme
;; (require 'color-theme-sanityinc-tomorrow)
;; (load-theme 'sanityinc-tomorrow-eighties)

;; Smart line
(setq sml/theme 'dark)
(sml/setup)

;; Helm
;; (require 'helm-config)
;; (global-set-key (kbd "M-x") #'helm-M-x)
;; (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
;; (global-set-key (kbd "C-x C-f") #'helm-find-files)
;; (helm-mode 1)

;; Highlight current line
;; (require 'hlinum)
;; (hlinum-activate)

;; Sublime minibar
(require 'minimap)

;; NERDTree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; Rainbow mode, use color for hex
(require 'rainbow-mode)
(rainbow-mode 1)

;; Beacon, flash cursor position
;; (beacon-mode 1)

;; Auto-complete
(global-auto-complete-mode 1)

;; Avy (like easymotion)
(require 'avy)
(global-set-key (kbd "C-:") 'avy-goto-char)

;; Git-gutter
<<<<<<< b4863ad9bb8493c6cb92ce455d4390820f9a3480
(require 'git-gutter)
(global-git-gutter-mode +1)
(git-gutter:linum-setup)
=======
;; (require 'git-gutter)
;; (global-git-gutter-mode +1)
>>>>>>> Add more packages to Emacs

;; Highlight parantheses
(require 'rainbow-delimiters)
(add-hook 'python-mode-hook #'rainbow-delimiters-mode)

;; Org-mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/.emacs.d/org/work.org"
                             "~/.emacs.d/org/home.org"))

;; Show column number
(setq column-number-mode t)

;; Set fill column to 80 characters
(setq-default fill-column 80)

;; Highlight 'fill column' global
(require 'fill-column-indicator)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)
