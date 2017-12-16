(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Install packages
(use-package auto-complete)
(use-package avy)
(use-package beacon)
(use-package color-theme-sanityinc-tomorrow)
(use-package diminish)
(use-package elpy)
(use-package evil)
(use-package git-gutter)
(use-package helm)
(use-package hlinum)
(use-package minimap)
(use-package neotree)
(use-package rainbow-delimiters)
(use-package rainbow-mode)
(use-package smart-mode-line)

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
    (elpy rainbow-delimiters git-gutter avy auto-complete beacon rainbow-mode neotree minimap hlinum helm smart-mode-line evil color-theme-sanityinc-tomorrow use-package diminish))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; No splash screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Font
(set-face-font 'default' "DejaVu Sans Mono for Powerline:12")

;; Show line number
;; (setq linum-format "%4d \u2502 ")
(setq linum-format "%5d ")
(global-linum-mode 1)
(global-hl-line-mode 1)

;; Disable tool bar and scroll bar
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

;; Use-package
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; Use Evil for Vim-like movement
(require 'evil)
(evil-mode 1)

;; Color theme
(require 'color-theme-sanityinc-tomorrow)
(load-theme 'sanityinc-tomorrow-eighties)

;; Smart line
(setq sml/theme 'dark)
(sml/setup)

;; Helm
(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

;; Highlight current line
(require 'hlinum)
(hlinum-activate)

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
(beacon-mode 1)

;; Auto-complete
(global-auto-complete-mode 1)

;; Avy (like easymotion)
(require 'avy)
(global-set-key (kbd "C-:") 'avy-goto-char)

;; Git-gutter
(require 'git-gutter)
(global-git-gutter-mode +1)
(git-gutter:linum-setup)

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

;; Elpy, Python IDE
(elpy-enable)
