;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "David Spreekmeester"
      user-mail-address "david@spreekmeester.nl")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Nextcloud/org-mode/")
(setq org-roam-directory "~/Nextcloud/org-mode/notes/")

;;(after! org-roam
;;  (setq org-roam-graph-viewer "/usr/bin/opener")



;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(with-eval-after-load 'evil-maps
  (define-key evil-motion-state-map (kbd ":") 'evil-repeat-find-char)
  (define-key evil-motion-state-map (kbd ";") 'evil-ex))

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "brave-browser")

(use-package deft
  :ensure t
  :after org
  :bind
  ("C-c n d" . deft)
  :custom
  (deft-recursive t)
  (deft-use-filter-string-for-filename t)
  (deft-default-extension "org")
  (deft-directory "~/Nextcloud/org-mode/"))

(setq deft-file-limit 200)

(use-package org-journal
  :ensure t
  :custom
  (org-journal-dir "~/Nextcloud/org-mode/journal/")
  (org-journal-date-prefix "#+title: ")
  (org-journal-file-format "%Y-%m-%d.org")
  (org-journal-date-format "%Y-%m-%d, %A"))
(setq org-journal-enable-agenda-integration t)

(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup)
  ;; Insert
  (map! :leader
              :prefix "i"
              :desc "timestamp" "t" #'org-time-stamp)
  ;; Notes
  (map! :leader
              :prefix "n"
              :desc "org-roam" "l" #'org-roam
              :desc "org-roam-insert" "i" #'org-roam-insert
              :desc "org-roam-switch-to-buffer" "b" #'org-roam-switch-to-buffer
              :desc "org-roam-find-file" "f" #'org-roam-find-file
              :desc "org-roam-server-mode" "g" #'org-roam-server-mode
              :desc "org-roam-insert" "i" #'org-roam-insert
              :desc "org-roam-capture" "c" #'org-roam-capture
              :desc "org-journal" "j" #'org-journal-new-entry
              :desc "helm-org-rifle" "." #'helm-org-rifle)
  ;; Open
  (map! :leader
              :prefix "o"
              :desc "term" "t" #'term))
;; Quick window split shortcuts
(after! org
  (map! :leader
              :desc "split-window-hori" "-" #'evil-window-split
              :desc "split-window-vert" "\\" #'evil-window-vsplit
              :desc "shell" "z" #'shell))

(after! org
  (setq org-agenda-span 'day))


;; Aap shortcuts

(map! :leader
              :prefix "n"
              :desc "org-roam" "l" #'org-roam
              :desc "org-roam-insert" "i" #'org-roam-insert
              :desc "org-roam-switch-to-buffer" "b" #'org-roam-switch-to-buffer
              :desc "org-roam-find-file" "f" #'org-roam-find-file
              :desc "org-roam-server-mode" "g" #'org-roam-server-mode
              :desc "org-roam-insert" "i" #'org-roam-insert
              :desc "org-roam-capture" "c" #'org-roam-capture
              :desc "org-journal" "j" #'org-journal-new-entry
              :desc "helm-org-rifle" "." #'helm-org-rifle)


;; bovenstaand komt van IAN Jones - A Tour of Org Roam - op YT
;; https://www.youtube.com/watch?v=gDAbpz98ooU&t=0s
;; https://www.ianjones.us/2020-05-05-doom-emacs

;; Auto-start of graph server disabled to improve startup performance
(use-package simple-httpd
  :ensure t)
(setq httpd-root "/var/www")
;;(httpd-start)


;; LINE NUMBERS
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; ik geloof dat ik deze uit moet zetten omdat het conflicteert met de doom line numbers.
;;(setq display-line-numbers-type nil)
(setq display-line-numbers-type "relative")
;;(global-display-line-numbers-mode 1)
;;(global-visual-line-mode)
;;(global-visual-line-mode-enable-in-buffers)
;;(global-linum-mode "relative")
;;(doom/toggle-line-numbers)
;(setq shr-external-browser "chromium-browser")

;;  :ensure nil
(use-package org-roam-server
  :ensure t
  :load-path "~/Scripts/note/org-roam-server")

;; org-ql for queries
(use-package org-ql
  :ensure t)

;; org-rifle for fast narrow-down searches
(use-package helm-org-rifle
  :ensure t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#1E2029" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(custom-safe-themes
   (quote
    ("912cac216b96560654f4f15a3a4d8ba47d9c604cbc3b04801e465fb67a0234f0" "55bd5c449a9fbeab3c07ac78d3995b077294aa82b116dc339fd487d0242799e6" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(deft-default-extension "org" t)
 '(deft-directory "~/Nextcloud/org-mode/" t)
 '(deft-recursive t t)
 '(deft-use-filter-string-for-filename t t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(fci-rule-color "#6272a4")
 '(jdee-db-active-breakpoint-face-colors (cons "#1E2029" "#bd93f9"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1E2029" "#50fa7b"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1E2029" "#565761"))
 '(objed-cursor-color "#ff5555")
 '(org-journal-date-format "%Y-%m-%d, %A")
 '(org-journal-date-prefix "#+title: ")
 '(org-journal-dir "~/Nextcloud/org-mode/journal/")
 '(org-journal-file-format "%Y-%m-%d.org")
 '(package-selected-packages
   (quote
    (disable-mouse linum-relative org-rifle helm-org-rifle org-ql multiple-cursors-core smart-mode-line org-journal deft org-roam-server)))
 '(pdf-view-midnight-colors (cons "#f8f8f2" "#282a36"))
 '(rustic-ansi-faces
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(vc-annotate-background "#282a36")
 '(vc-annotate-color-map
   (list
    (cons 20 "#50fa7b")
    (cons 40 "#85fa80")
    (cons 60 "#bbf986")
    (cons 80 "#f1fa8c")
    (cons 100 "#f5e381")
    (cons 120 "#face76")
    (cons 140 "#ffb86c")
    (cons 160 "#ffa38a")
    (cons 180 "#ff8ea8")
    (cons 200 "#ff79c6")
    (cons 220 "#ff6da0")
    (cons 240 "#ff617a")
    (cons 260 "#ff5555")
    (cons 280 "#d45558")
    (cons 300 "#aa565a")
    (cons 320 "#80565d")
    (cons 340 "#6272a4")
    (cons 360 "#6272a4")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(after! org-roam
      (setq org-roam-ref-capture-templates
            '(("r" "ref" plain (function org-roam-capture--get-point)
               "%?"
               :file-name "websites/${slug}"
               :head "#+TITLE: ${title}
    #+ROAM_KEY: ${ref}
    - source :: ${ref}"
               :unnarrowed t))))

(toggle-frame-fullscreen)

(setq
 display-time-format "%H:%M"
 display-time-24hr-format t
 display-time-use-mail-icon t)

;;(display-time-mode 2)

(display-battery-mode)


;; php
(use-package phpactor :ensure t)
(use-package company-phpactor :ensure t)
;;(composer-setup-managed-phar)
;;(phpactor-install-or-update)
(use-package php-mode
  ;;
  :hook ((php-mode . (lambda () (set (make-local-variable 'company-backends)
       '(;; list of backends
         company-phpactor
         company-files
         ))))))

;; Smart Mode Line / Powerline
;;(setq sml/name-width 20)
;;(use-package smart-mode-line
;;  :ensure t)
;;  (sml/setup)
;;(use-package multiple-cursors-core
;;  :ensure t)

;;(load-theme doom-dracula)
;;(load-theme ample)

;;;;Org mode configuration
;;(setq org-todo-keywords
;;  '((sequence "BACKLOG" "TODO" "DOING" "WAITING" "DONE")))
;;(setq org-startup-with-inline-images t)
;;(setq-default org-download-image-dir "~/Nextcloud/org-mode/pics")

;;  (setq org-roam-server-host "127.0.0.1"
;;        org-roam-server-port 8080
;;        org-roam-server-export-inline-images t
;;        org-roam-server-authenticate nil
;;        org-roam-server-label-truncate t
;;        org-roam-server-label-truncate-length 60
;;        org-roam-server-label-wrap-length 20))


;; For Org-roam:
;; Replacing region with link to new note
;; To move fleeting notes to their own note.
;; Spoiler alert: it sucks so needs to be improved.
(defun mmr/org-roam-insert-replace-region-with-link-and-follow ()
(interactive )
(let ((title (buffer-substring (mark) (point)) )
        (top (current-buffer)))
    (org-roam-find-file title)
    (let ((target-file (buffer-file-name (buffer-base-buffer)))
        (note-buffer (current-buffer)))
    (switch-to-buffer top nil t)
    (kill-region (mark) (point))
    (insert (concat "[[" target-file "][" title "]]"))
    (switch-to-buffer note-buffer nil t)
    (save-buffer))))
;; To delete a linked note
(defun mmr/remove-linked-org-roam-note ()
(interactive)
(let ((buffer (current-buffer)))
    (org-open-maybe)
    (if (not (eq (current-buffer) buffer))
        (progn
        (crux-delete-file-and-buffer)
        (er/expand-region 1)
        (kill-region (mark) (point))))))



;; Disable mouse completely in Emacs
(use-package disable-mouse
  :ensure t)

(global-disable-mouse-mode)
(mapc #'disable-mouse-in-keymap
  (list evil-motion-state-map
        evil-normal-state-map
        evil-visual-state-map
        evil-insert-state-map))
