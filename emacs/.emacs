(require 'package)

(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(org-agenda-files (quote ("~/Nextcloud/org-mode/todo-thuis.org")))
 '(package-selected-packages
   (quote
    (org-roam-protocol evil-leader org-roam evil-org org-bullets markdown-mode use-package evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq debug-on-error t)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;; Packages
(use-package markdown-mode
  :ensure t)

;; Evil Mode
;; evil-leader-mode needs to be enabled before enabling evil.
(setq evil-leader/in-all-states 1) ;; This enables C-leader key in system states.
(use-package evil-leader
  :ensure t)
  (evil-leader/set-key
  "f" 'find-file
  "b" 'switch-to-buffer
  "x" 'kill-buffer
  "r" 'load-file ;; run
  "-" 'split-window-vertically
  "\\" 'split-window-horizontally
  "h" 'windmove-left
  "l" 'windmove-right
  "j" 'windmove-down
  "k" 'windmove-up
  "," 'org-roam
  "n" 'org-roam-find-file
  "c" 'org-roam-insert ;; To link to other notes
  "g" 'org-roam-graph
  "a" 'org-agenda)
  (evil-leader/set-leader "<SPC>")
  (global-evil-leader-mode)

(use-package evil
  :ensure t ;; install the evil package if not installed
  :init) ;; tweak evil's configuration before loading it
  (setq evil-search-module 'evil-search)
  (setq evil-ex-complete-emacs-commands nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-shift-round nil)
  (setq evil-want-C-u-scroll t)
;  :config ;; tweak evil after loading it
  (evil-mode)

(with-eval-after-load 'evil-maps
  (define-key evil-motion-state-map (kbd ":") 'evil-repeat-find-char)
  (define-key evil-motion-state-map (kbd ";") 'evil-ex))

;; Projectile (project interaction lib for Git and such)
(use-package projectile
  :ensure t)
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Symlinks
(setq vc-follow-symlinks t)

;; GUI
(load-theme 'dracula t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)

;; Org-mode bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
(setq org-todo-keywords
  '((sequence "BACKLOG" "TODO" "DOING" "WAITING" "DONE")))
(setq org-startup-with-inline-images t)
(setq-default org-download-image-dir "~/Nextcloud/org-mode/pics")

;; Org-mode evil bindings
(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

;; Org-roam
(use-package org-roam
  :ensure t)
(setq org-roam-directory "~/Nextcloud/org-roam")
(add-hook 'after-init-hook 'org-roam-mode)

(use-package org-roam-protocol
  :ensure t)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "brave-browser")

(use-package company-org-roam
  :straight (:host github :repo "org-roam/company-org-roam")
  :config
  (push 'company-org-roam company-backends))

(use-package org-roam-server
  :ensure t
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8080
        org-roam-server-export-inline-images t
        org-roam-server-authenticate nil
        org-roam-server-label-truncate t
        org-roam-server-label-truncate-length 60
        org-roam-server-label-wrap-length 20))
