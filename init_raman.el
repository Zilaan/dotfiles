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
    doom-themes
    evil
    fill-column-indicator
    git-gutter
    helm
    hlinum
    magit
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
(setq inhibit-splash-screen t) ;; No splash screen

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-one t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme
(doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

(global-linum-mode t) ;; enable line numbers globally
(setq linum-format "%4d ") ;; Format of line numbers
(setq column-number-mode t) ;; Show column number

(setq-default fill-column 91)
(global-hl-line-mode t)

(if (display-graphic-p)
    (progn
     (tool-bar-mode -1)
     (scroll-bar-mode -1)))

;; Rainbow parantheses etc
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'matlab-mode-hook #'rainbow-delimiters-mode)
(rainbow-mode 1)

;; Auto complete
(global-auto-complete-mode t)
(ac-config-default)

;; Like easymotion in Vim
(global-set-key (kbd "C-:") 'avy-goto-char)

;; Git-gutter
(global-git-gutter-mode +1)
(git-gutter:linum-setup)

;; Set font settings
(set-face-attribute 'default nil
		    :font "Fira Mono for Powerline"
		    :height 120
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

;; Highlight current line number
(hlinum-activate)
(setq hlinum-highlight-in-all-buffersp t)
;; init.el ends here
