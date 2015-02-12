(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-c c") 'org-capture)

(defun jcazevedo/org-mode-defaults ()
  (org-indent-mode t)
  (visual-line-mode t))

(setq jcazevedo/org-mode-hook 'jcazevedo/org-mode-defaults)
(add-hook 'org-mode-hook (lambda () (run-hooks 'jcazevedo/org-mode-hook)))

(setq
 org-directory "org/"
 org-agenda-files (list "~/org")
 org-default-notes-file "~/org/refile.org"
 org-mobile-directory "~/Dropbox/MobileOrg"
 org-todo-keywords (quote ((sequence "TODO(t)" "STARTED(s)" "ONGOING(o)" "|" "DONE(d)" "CANCELLED(c)" "MEETING(m)")))
 org-todo-keyword-faces (quote (("TODO" :foreground "red" :weight bold)
                                ("STARTED" :foreground "dodger blue" :weight bold)
                                ("ONGOING" :foreground "dodger blue" :weight bold)
                                ("DONE" :foreground "forest green" :weight bold)
                                ("CANCELLED" :foreground "forest green" :weight bold)
                                ("MEETING" :foreground "forest green" :weight bold)))
 org-use-fast-todo-selection t
 org-treat-S-cursor-todo-selection-as-state-change nil
 org-log-done nil
 org-capture-templates (quote (("t" "todo" entry (file "~/org/refile.org")
                                "* TODO %?\n\n%a\n" :clock-in t :clock-resume t)
                               ("m" "Meeting" entry (file "~/org/refile.org")
                                "* MEETING with %?\n" :clock-in t :clock-resume t)))
 org-drawers (quote ("PROPERTIES" "LOGBOOK"))
 org-clock-in-resume t
 org-clock-into-drawer t
 org-clock-out-remove-zero-time-clocks t
 org-clock-persist t
 org-clock-persist-query-resume nil
 org-clock-auto-clock-resolution (quote when-no-clock-is-running)
 org-clock-report-include-clocking-task t
 org-agenda-clockreport-parameter-plist (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80))
 org-clock-out-when-done nil
 org-agenda-prefix-format (quote ((agenda . " %i %-15:c%?-12t% s")
                                  (timeline . "  % s")
                                  (todo . " %i %-12:c")
                                  (tags . " %i %-12:c")
                                  (search . " %i %-12:c"))))

(org-clock-persistence-insinuate)

(provide 'jcazevedo-org)
