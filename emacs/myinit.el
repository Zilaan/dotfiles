;; All themes are safe so don't ask
(setq custom-safe-themes t)

(scroll-bar-mode -1)              ;; Disable the scroll bar
(tool-bar-mode -1)                ;; Disable GUI icons
(menu-bar-mode -1)                ;; Disable menu bar, i.e. |File|Edit| etc
(show-paren-mode t)               ;; Show matching parenthesis
(setq make-backup-files nil)      ;; Don't backup files
(defalias 'yes-or-no-p 'y-or-n-p) ;; Simpler yes/no
(delete-selection-mode t)         ;; Replace region by writing
(electric-pair-mode t)            ;; Auto insert matching brackets etc
(column-number-mode t)            ;; Show column number
(setq inhibit-splash-screen t)    ;; No init screen
(setq inhibit-startup-message t)  ;; No startup message
(setq-default c-basic-offset 4)   ;; User 4 spaces for indent?
(setq ring-bell-function 'ignore)

(setenv "HOME" "/home/s0000431/")

(set-face-attribute 'default nil
                    :font "Monaco"
                    :height 120
                    :weight 'normal
                    :width 'normal)

(setq default-frame-alist '((font . "Monaco-12")))

(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.1))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.05))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
)

(use-package diminish
  :ensure t
  :config
  (diminish 'org-indent-mode)
  (diminish 'eldoc-mode)
  (diminish 'abbrev-mode))

(use-package better-defaults
  :ensure t)

(use-package beacon
  :ensure t
  :diminish beacon-mode
  :config
  (beacon-mode 1))

(use-package which-key
  :diminish which-key-mode
  :config 
    (setq which-key-idle-delay 0.3)
    (setq which-key-popup-type 'frame)
    (which-key-mode)
    (which-key-setup-minibuffer)
    (set-face-attribute 'which-key-local-map-description-face nil 
       :weight 'bold)
  :ensure t)

;; (use-package helm
;;   :diminish helm-mode
;;   :init
;;     (require 'helm-config)
;;     (setq helm-split-window-in-side-p t
;;           helm-move-to-line-cycle-in-source t)
;;   :config 
;;     (helm-mode 1) ;; Most of Emacs prompts become helm-enabled
;;     (helm-autoresize-mode 1) ;; Helm resizes according to the number of candidates
;;     (global-set-key (kbd "C-x b") 'helm-buffers-list) ;; List buffers ( Emacs way )
;;     (global-set-key (kbd "C-x r b") 'helm-bookmarks) ;; Bookmarks menu
;;     (global-set-key (kbd "C-x C-f") 'helm-find-files) ;; Finding files with Helm
;;     (global-set-key (kbd "M-c") 'helm-calcul-expression) ;; Use Helm for calculations
;;     (global-set-key (kbd "C-s") 'helm-occur)  ;; Replaces the default isearch keybinding
;;     (global-set-key (kbd "C-h a") 'helm-apropos)  ;; Helmized apropos interface
;;     (global-set-key (kbd "M-x") 'helm-M-x)  ;; Improved M-x menu
;;     (global-set-key (kbd "M-y") 'helm-show-kill-ring)  ;; Show kill ring, pick something to paste
;;     (setq helm-mode-fuzzy-match t)
;;     (setq helm-completion-in-region-fuzzy-match t)
;; 
;;   :ensure t)

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :init
  (yas-global-mode 1))

(use-package org-superstar  ;; Improved version of org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

(setq org-startup-indented t)           ;; Indent according to section
(setq org-startup-with-inline-images t) ;; Display images in-buffer by default

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

(use-package window-numbering
  :ensure t
  :config
  (eval-when-compile
    ;; Silence missing function warnings
    (declare-function window-numbering-mode "window-numbering.el"))
  (window-numbering-mode t))

(use-package string-inflection
  :ensure t
  :defer t
  ;; :bind (("C-c c i" . string-inflection-cycle)
  ;;        ("C-c c l" . string-inflection-lower-camelcase)
  ;;        ("C-c c c" . string-inflection-camelcase)
  ;;        ("C-c c s" . string-inflection-underscore)
  ;;        ("C-c c u" . string-inflection-upcase))
  )

(use-package company
  :ensure t
  :diminish company-mode
  :bind (:map company-active-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3))
(global-company-mode t)

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :init (global-flycheck-mode))

(use-package all-the-icons
  :ensure t)

(use-package multiple-cursors
  :bind (("C-<" . mc/mark-previous-like-this)
         ("C-M-<" . mc/unmark-previous-like-this)
         ("C->" . mc/mark-next-like-this)
         ("C-M->" . mc/unmark-next-like-this)
         ("<ESC> <ESC>" . mc/keyboard-quit))
  :ensure t)

(use-package avy
  :bind (("C-:" . avy-goto-char))
  :ensure t)

(use-package expand-region
  :bind ("C-c e" . er/expand-region)
  :ensure t)

(use-package rainbow-mode
  :ensure t
  :config (rainbow-mode t))

(use-package rainbow-delimiters
  :ensure t
  :init
  (eval-when-compile
    ;; Silence missing function warnings
    (declare-function rainbow-delimiters-mode "rainbow-delimiters.el"))
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(load-file "/usr/share/emacs/site-lisp/clang-format/clang-format.el")
(setq clang-format-style "~/dev/repositories/src/.clang-format")

;;(use-package lsp-mode
;;  :ensure t
;;  :init (setq lsp-keymap-prefix "C-c l")
;;  :hook
;;  ((c-mode . lsp)
;;   (cpp-mode . lsp)))

(use-package lsp-mode
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  :init (setq lsp-keymap-prefix "C-c l")
  :diminish lsp-mode
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (prog-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config
  (setq lsp-signature-render-documentation nil)
  (lsp-register-custom-settings
   '(("pyls.plugins.pyls_mypy.enabled" t t)
     ("pyls.plugins.pyls_mypy.live_mode" nil t)
     ("pyls.plugins.pyls_black.enabled" t t)
     ("pyls.plugins.pyls_isort.enabled" t t)))
  )

(use-package modern-cpp-font-lock
  :ensure t
  :diminish modern-c++-font-lock-mode
  :config
  (modern-c++-font-lock-global-mode t)
  )

;; Better highlighting for functions etc
(dolist (mode-iter '(c-mode c++-mode glsl-mode java-mode javascript-mode rust-mode))
  (font-lock-add-keywords
    mode-iter
    '(("\\([~^&\|!<>=,.\\+*/%-]\\)" 0 'font-lock-operator-face keep)))
  (font-lock-add-keywords
    mode-iter
    '(("\\([\]\[}{)(:;]\\)" 0 'font-lock-delimit-face keep)))
  ;; functions
  (font-lock-add-keywords
    mode-iter
    '(("\\([_a-zA-Z][_a-zA-Z0-9]*\\)\s*(" 1 'font-lock-function-name-face keep))))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-project-search-path
        '("~/dev/repositories/src/stringent/targets/pi/long_accel_ctrl/"
          "~/dev/repositories/src/stringent/modules/long_accel_ctrl"))
  (setq projectile-enable-caching t)
  (setq projectile-auto-discover nil)
  )

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :config
  (setq ivy-use-virtual-buffers t
        ivy-count-format "%d/%d ")
  (global-set-key (kbd "C-s") 'swiper-isearch)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "M-y") 'counsel-yank-pop)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "<f2> j") 'counsel-set-variable)
  (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
  (global-set-key (kbd "C-c v") 'ivy-push-view)
  (global-set-key (kbd "C-c V") 'ivy-pop-view)

  (global-set-key (kbd "C-c c") 'counsel-compile)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c L") 'counsel-git-log)
  (global-set-key (kbd "C-c k") 'counsel-rg)
  (global-set-key (kbd "C-c m") 'counsel-linux-app)
  (global-set-key (kbd "C-c n") 'counsel-fzf)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-c J") 'counsel-file-jump)

  (ivy-mode 1)
  )

(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

(use-package ivy-rich
  :ensure t
  :init (ivy-rich-mode 1))

(use-package zenburn-theme
  :ensure t
  ;; :config (load-theme 'zenburn t)
  )

(use-package color-theme-sanityinc-tomorrow
  :ensure t)

;; Load theme
(color-theme-sanityinc-tomorrow-night)

;;(use-package doom-themes
;;  :ensure t
;;  :config
;;  ;; (load-theme 'doom-zenburn t)
;;  )

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode t)
  (setq doom-modeline-icon t)
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-major-mode-color-icon t)
  (setq doom-modeline-buffer-state-icon t)
  (setq doom-modeline-buffer-modification-icon t)
  (setq doom-modeline-bar-width 3)
  (setq doom-modeline-minor-modes t))

(use-package vimish-fold
  :ensure t
  :config
  (vimish-fold-global-mode 1))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
