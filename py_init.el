;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; ---------------------------------------------------------------------------

(require 'package)

(add-to-list 'package-archives
	     '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    elpy
    flycheck
    py-autopep8))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; ---------------------------------------------------------------------------
(add-hook 'after-init-hook 'global-company-mode)

(setq inhibit-startup-message t) ;; Hide the startup message
(setq inhibit-splash-screen t)   ;; No splash screen

(if (display-graphic-p)
    (progn
     (tool-bar-mode -1)     ;; No toolbar
     (scroll-bar-mode -1))) ;; No scrollbar

(load-theme 'adwaita t)     ;; Theme
(show-paren-mode 1)         ;; Highlight matching brackets/parentheses

(setq linum-format "%4d ")  ;; Line number format
(setq column-number-mode t) ;; Show column number

;; Highlight current line number
(hlinum-activate)
(setq hlinum-highlight-in-all-buffersp t)

;; Highlight current line
(global-hl-line-mode t)
(set-face-background hl-line-face "papaya whip") ;; Background color
(set-face-foreground 'highlight nil)             ;; Don't color the text
(set-cursor-color "IndianRed2")                  ;; Cursor color

;; Line number when in programing mode
(add-hook 'prog-mode-hook 'linum-mode t)

;; PYTHON CONFIGURATION
;; ---------------------------------------------------------------------------
(elpy-enable)
(setq elpy-rpc-python-command "python3")
;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(setq python-shell-interpreter "python3"
      python-shell-interpreter-args "-i")
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(add-hook 'python-mode-hook
	  (lambda ()
            (local-set-key (kbd "M-/") 'elpy-company-backend)))
;; ---------------------------------------------------------------------------
