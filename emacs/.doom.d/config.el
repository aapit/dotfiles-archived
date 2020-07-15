;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq calendar-week-start-day 1)
(setq
 display-time-format "%H:%M"
 display-time-24hr-format t)

(load! "secrets.el" doom-private-dir)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "brave-browser")

(add-hook 'emacs-startup-hook (lambda ()
    (global-disable-mouse-mode)
))

(setq doom-theme 'doom-horizon)
(setq display-time-use-mail-icon t)
(setq display-line-numbers-type 'relative)

(add-hook 'emacs-startup-hook (lambda ()
    (toggle-frame-fullscreen)
    (display-battery-mode)
))

;; Unfortunately, at this point [2020-07-08 Wed],
;; there is no way to style regular non-link text in the Org-roam buffer.
;; Therefore, the only customizable property that blends in with the rest is link color.
(custom-set-faces
 '(org-roam-link ((t (:foreground "#8B61AB"))))
 '(org-roam-link-current ((t (:foreground "#57287C"))))
)

(when (> (display-pixel-width) '3000)
  (set-popup-rule! "*Org Agenda*" :side 'left :size .40 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "CAPTURE-" :side 'left :size .40 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "*Capture*" :side 'left :size .40 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "*Messages*" :side 'left :size .30 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "*helm*" :side 'left :size .30 :select t :vslot 5 :ttl 3))
(when (< (display-pixel-width) '2000)
  (set-popup-rule! "*Org Agenda*" :side 'bottom :size .40 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "CAPTURE-" :side 'left :size .40 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "*Capture*" :side 'bottom :size .30 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "*Messages*" :side 'left :size .30 :select t :vslot 2 :ttl 3)
  (set-popup-rule! "*helm*" :side 'bottom :size .30 :select t :vslot 5 :ttl 3))

(setq org-agenda-span 'week)

;; Hide /emphasis markers for italics/ in org-mode
(setq org-hide-emphasis-markers t)

; Disabling for performance, for now
;(setq org-startup-with-inline-images t)

(setq-default org-download-image-dir "~/Nextcloud/org-mode/pics")

;; Follow output
(setq compilation-scroll-output t)

;; Open
(map! :leader
    :prefix "o"
    :desc "Shell" "z" #'shell
    :desc "Term" "t" #'term
)

;; Quick window split shortcuts
(map! :leader
    :prefix "w"
    :desc "Split Hori" "-" #'evil-window-split
    :desc "Split Vert" "\\" #'evil-window-vsplit
)

(map! :after evil-org
    :map evil-org-mode-map
    :n "M-j" #'org-metadown
    :n "M-k" #'org-metaup
)
;; Export
(map! :after evil-org
    :map org-mode-map
    :leader
    :prefix "e"
    :desc "html export (buffer)" "h" #'org-html-export-to-html
    :desc "various (region to pdf, etc)" "v" #'org-export-dispatch
    :desc "pdf (buffer)" "p" #'org-latex-export-to-pdf
)
(map! :after evil-org
    :leader
    :desc "Agenda" "a" #'org-agenda
)

;; Insert
(map! :after org-roam
        :map org-roam-mode-map
        :leader
        :prefix "i"
        :desc "Timestamp" "T" #'org-time-stamp
        :desc "Timestamp inactive" "t" #'org-time-stamp-inactive
)
;; Notes
(map! :after org-roam
        :map org-mode-map
        :leader
        :prefix "n"
        :desc "Find, Insert note" "q" #'org-roam-find-file
        :desc "Graph server" "g" #'org-roam-server-mode
        :desc "Rifle" "." #'helm-org-rifle
)
(map! :after org-roam
        :leader
        :desc "Journal" "j" #'org-journal-new-entry
)

(setq org-agenda-custom-commands
    '(
        ("b" "Both" agenda "Universeel"
         ((org-agenda-files '("~/Nextcloud/org-mode/notes/todo-thuis.org" "~/Nextcloud/org-mode/notes/todo-grrr.org"))))
        ("z" "Zelf" agenda "Persoonlijk"
         ((org-agenda-files '("~/Nextcloud/org-mode/notes/todo-thuis.org"))))
        ("g" "GRRR" agenda "Werk"
         ((org-agenda-files '("~/Nextcloud/org-mode/notes/todo-grrr.org"))))
    )
)

(after! org
    (add-to-list 'org-latex-packages-alist "\\hypersetup{setpagesize=false}" t)
    (add-to-list 'org-latex-packages-alist "\\hypersetup{colorlinks=true}" t)
    (add-to-list 'org-latex-packages-alist "\\hypersetup{linkcolor=blue}" t)
    (add-to-list 'org-latex-packages-alist "\\setlength\\parindent{0pt}" t)
)

;; `org-directory' must be set before org loads.
(setq org-directory "~/Nextcloud/org-mode/notes/")

(after! org
    (setq org-agenda-dim-blocked-tasks nil)
    (setq org-agenda-inhibit-startup nil)
    (setq org-agenda-use-tag-inheritance nil)
    (setq org-agenda-ignore-drawer-properties '(visibility category))
    (setq org-agenda-sticky t)
)

(setq org-todo-keywords
    '((sequence "TODO" "NEXT" "DONE" "PROJ")))

(setq org-roam-directory "~/Nextcloud/org-mode/notes/")
(setq org-roam-buffer-width 0.3)
(setq org-roam-buffer "Org-roam Sidebar")

(use-package! org-journal
  :after org
  :defer t
  :custom
  (org-journal-dir "~/Nextcloud/org-mode/journal/")
  (org-journal-date-prefix "#+title: ")
  (org-journal-file-format "%Y-%m-%d.org")
  (org-journal-date-format "%Y-%m-%d, %A")
  :config
  (setq org-journal-enable-agenda-integration t)
)

(after! org-roam
      (setq org-roam-ref-capture-templates
            '(("r" "ref" plain (function org-roam-capture--get-point)
               "%?"
               :file-name "websites/${slug}"
               :head "#+TITLE: ${title}
    #+ROAM_KEY: ${ref}
    - source :: ${ref}"
               :unnarrowed t)))
      (setq org-roam-capture-templates
            `(("d" "default" plain #'org-roam-capture--get-point "%?"
               :file-name "${slug}"
               :head "%(concat \"#+TITLE: ${title}\n#+roam_alias: \n#+roam_tags: \n#+date: \" (format-time-string \"%Y-%m-%d\" (current-time) t) \"\n* \" (upcase-initials \"${title}\") \"\n\")"
               :unnarrowed t))
      )
)

(setq org-roam-graph-exclude-matcher '("private" "dailies"))

(use-package! simple-httpd
  :defer t
  :after org
  :config
  (setq httpd-root "/var/www")
)
;; Auto-start of graph server disabled to improve startup performance
;;(httpd-start)

;;  :ensure nil
(use-package! org-roam-server
  :defer t
  :after org
  :load-path "~/Scripts/note/org-roam-server")

;; org-ql for queries
;(use-package org-ql)

;; org-rifle for fast narrow-down searches
;(use-package helm-org-rifle
;  :after org
;)

(after! 'deft
  (deft-recursive t)
  (deft-use-filter-string-for-filename t)
  (deft-default-extension "org")
  (deft-directory "~/Nextcloud/org-mode/")
)
(use-package! deft
  :after org
  :defer t
 ;:bind
 ;("C-c n d" . deft)
  :custom
  (deft-recursive t)
  (deft-use-filter-string-for-filename t)
  (deft-default-extension "org")
  (deft-directory "~/Nextcloud/org-mode/")
  :config
  (setq deft-file-limit 200)
)

;; php
(use-package! phpactor
  :mode "\\.php\\'"
  :defer t
)
(use-package! company-phpactor
  :mode "\\.php\\'"
  :defer t
)
;;(composer-setup-managed-phar)
;;(phpactor-install-or-update)
(use-package! php-mode
  :mode "\\.php\\'"
  :defer t
  :hook ((php-mode . (lambda () (set (make-local-variable 'company-backends)
       '(;; list of backends
         company-phpactor
         company-files
         ))))))

(setq org-plantuml-jar-path (expand-file-name "~/Apps/PlantUML/plantuml.jar")
      plantuml-default-exec-mode 'jar)
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))

(setq projectile-project-search-path '("~/Scripts/" "~/Sites/" "~/Remotes" "~/Lab"))

;; When using evil-mode be sure to run (global-undo-tree-mode -1) to avoid problems.
;; https://github.com/emacsmirror/undo-fu-session
(add-hook 'emacs-startup-hook (lambda ()
    (global-undo-tree-mode -1)
))

(setq undo-fu-session-file-limit 150)
