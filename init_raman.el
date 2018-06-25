;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(auto-complete
    avy
    better-defaults
    diminish
    evil
    fill-column-indicator
    git-gutter
    helm
    material-theme
    matlab-mode
    neotree
    rainbow-delimiters
    rainbow-mode
    smart-mode-line))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(setq inhibit-splash-screen t)
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(setq linum-format "%4d ")
(setq column-number-mode t)
(setq-default fill-column 91)
(global-hl-line-mode t)

(if (display-graphic-p)
    (progn
     (tool-bar-mode -1)
     (scroll-bar-mode -1)))

(rainbow-mode 1)
(global-auto-complete-mode t)
(ac-config-default)
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-git-gutter-mode +1)
(git-gutter:linum-setup)

;; (set-face-font 'default' "Fira Mono for Powerline:12")
(set-face-attribute 'default nil
		    :font "Fira Mono for Powerline"
		    :height 130
		    :weight 'normal
		    :width 'normal)

;; Helm
(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

;; Highlight 'fill column' global
(require 'fill-column-indicator)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

;; Smart line
(setq sml/theme 'dark)
(setq sml/no-confirm-load-theme t)
(sml/setup)

;; Avy (like easymotion)
(global-set-key (kbd "C-:") 'avy-goto-char)
;; init.el ends here
