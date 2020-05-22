;;; package --- Summary
;;; Commentary:
;; GNU Emacs 26.3
;;
;;; Code:
;; ----------------------------------------
;;           Setup package archive
;; ----------------------------------------
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
;;           General stuff
;; ----------------------------------------

;; Disable some GUI stuff
(scroll-bar-mode -1)              ;; Disable the scroll bar
(tool-bar-mode -1)                ;; Disable GUI icons
(menu-bar-mode -1)                ;; Disable menu bar, i.e. |File|Edit| etc
(show-paren-mode t)               ;; Show matching parenthesis
(setq make-backup-files nil)      ;; Don't backup files
(defalias 'yes-or-no-p 'y-or-n-p) ;; Simpler yes/no
(delete-selection-mode t)         ;; Replace region by writing
(electric-pair-mode t)            ;; Auto insert matching brackets etc
(setq inhibit-splash-screen t)    ;; No init screen
(setq inhibit-startup-message t)  ;; No startup message
(setq-default c-basic-offset 4)   ;; User 4 spaces for indent?
(setq visible-bell t)             ;; Use visual bell

;; Make the modeline flash for visual bell
(setq ring-bell-function
      (lambda ()
        (let ((orig-fg (face-foreground 'mode-line)))
          (set-face-foreground 'mode-line "#F2804F")
          (run-with-idle-timer 0.1 nil
                               (lambda (fg) (set-face-foreground 'mode-line fg))
                               orig-fg))))

;; Set font settings
(set-face-attribute 'default nil
                    :font "Monaco"
                    :height 135
                    :weight 'normal
                    :width 'normal)
;; ----------------------------------------
;;           Install packages
;; ----------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Origami - Does code folding, ie hide the body of an
;; if/else/for/function so that you can fit more code on your screen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package origami
  :ensure t
  :commands (origami-mode)
  :bind (:map origami-mode-map
              ("C-c o :" . origami-recursively-toggle-node)
              ("C-c o a" . origami-toggle-all-nodes)
              ("C-c o t" . origami-toggle-node)
              ("C-c o o" . origami-show-only-node)
              ("C-c o u" . origami-undo)
              ("C-c o U" . origami-redo)
              ("C-c o C-r" . origami-reset)
              )
  :config
  (setq origami-show-fold-header t)
  ;; The python parser currently doesn't fold if/for/etc. blocks, which is
  ;; something we want. However, the basic indentation parser does support
  ;; this with one caveat: you must toggle the node when your cursor is on
  ;; the line of the if/for/etc. statement you want to collapse. You cannot
  ;; fold the statement by toggling in the body of the if/for/etc.
  (add-to-list 'origami-parser-alist '(python-mode . origami-indent-parser))
  :init
  (add-hook 'prog-mode-hook 'origami-mode))

;; window-numbering use meta with number e.g. M-1, M-2 etc
(use-package window-numbering
  :ensure t
  :config
  (eval-when-compile
    ;; Silence missing function warnings
    (declare-function window-numbering-mode "window-numbering.el"))
  (window-numbering-mode t))


;; string-inflection
;; used for switching between different cases, eg CamelCase,
;; lowerCamelCase, snake_case, and SCREAMING_SNAKE_CASE
(use-package string-inflection
  :ensure t
  :defer t
  :bind (("C-c c i" . string-inflection-cycle)
         ("C-c c l" . string-inflection-lower-camelcase)
         ("C-c c c" . string-inflection-camelcase)
         ("C-c c s" . string-inflection-underscore)
         ("C-c c u" . string-inflection-upcase)))

;; beacon to higlight cursor line when switching windows
(use-package beacon
  :ensure t
  :init
  (eval-when-compile
    ;; Silence missing function warnings
    (declare-function beacon-mode "beacon.el"))
  :config
  (beacon-mode t))

;; better-defaults, is this needed?
(use-package better-defaults
  :ensure t)

;; Company for auto completei
(use-package company
  :ensure t
  :bind (:map company-active-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3))
(global-company-mode t)

;; flycheck for syntax checking
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; which-key to give suggestions for keys
(use-package which-key
  :ensure t
  :config (which-key-mode))

;; doom themes
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-nord t))

;; doom modeline
(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode t)
  (setq doom-modeline-icon nil)
  (setq doom-modeline-major-mode-icon nil)
  (setq doom-modeline-major-mode-color-icon nil)
  (setq doom-modeline-buffer-state-icon nil)
  (setq doom-modeline-buffer-modification-icon nil)
  (setq doom-modeline-bar-width 3)
  (setq doom-modeline-minor-modes t))

;; Fany icons
(use-package all-the-icons
  :ensure t)

;; Multiple cursors
(use-package multiple-cursors
  :bind (("C-<" . mc/mark-previous-like-this)
         ("C-M-<" . mc/unmark-previous-like-this)
         ("C->" . mc/mark-next-like-this)
         ("C-M->" . mc/unmark-next-like-this)
         ("<ESC> <ESC>" . mc/keyboard-quit))
  :ensure t)

;; Avy, like easymotion in Vim
(use-package avy
  :bind (("C-:" . avy-goto-char))
  :ensure t)

;; Magit for git
(use-package magit
  :bind (("C-x g" . magit-status))
  :ensure t)

;; Expand region
(use-package expand-region
  :bind ("C-c e" . er/expand-region)
  :ensure t)

;; Rainbow-mode for coloring hex values
(use-package rainbow-mode
  :ensure t
  :config (rainbow-mode t))

;; Rainbow-delimiters colored parenthesis etc
(use-package rainbow-delimiters
  :ensure t
  :init
  (eval-when-compile
    ;; Silence missing function warnings
    (declare-function rainbow-delimiters-mode "rainbow-delimiters.el"))
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; csv
(use-package csv-mode
  :mode ("\\.csv\\'"))

;; json
(use-package json-mode
  :mode ("\\.json\\'"))
;; ----------------------------------------
;;           Keybindings
;; ----------------------------------------

(global-set-key (kbd "C-c w") 'whitespace-mode)
(global-set-key (kbd "C-c l") 'display-line-numbers-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (origami beacon string-inflection window-numbering rainbow-delimiters rainbow-mode expand-region magit avy multiple-cursors doom-modeline doom-themes which-key flycheck company better-defaults use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
