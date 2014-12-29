(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-c c") 'org-capture)

(defun jcazevedo/org-mode-defaults ()
  (let ((oldmap (cdr (assoc 'prelude-mode minor-mode-map-alist)))
        (newmap (make-sparse-keymap)))
    (set-keymap-parent newmap oldmap)
    (define-key newmap (kbd "C-c +") nil)
    (define-key newmap (kbd "C-c -") nil)
    (make-local-variable 'minor-mode-overriding-map-alist)
    (push `(prelude-mode . ,newmap) minor-mode-overriding-map-alist)
    (org-indent-mode t)
    (visual-line-mode t)))

(defun jcazevedo/clock-in-to-started (kw)
  "Switch a task from TODO to STARTED when clocking in."
  (when (and (not (and (boundp 'org-capture-mode) org-capture-mode))
             (member (org-get-todo-state) (list "TODO")))
    "STARTED"))

(setq jcazevedo/org-mode-hook 'jcazevedo/org-mode-defaults)
(add-hook 'org-mode-hook (lambda () (run-hooks 'jcazevedo/org-mode-hook)))

(setq
 org-agenda-files (list "~/org")
 org-default-notes-file "~/org/refile.org"
 org-todo-keywords (quote ((sequence "TODO(t)" "STARTED(s)" "ONGOING(o)" "|" "DONE(d)")
                           (sequence "WAITING(w)" "HOLD(h)" "|" "CANCELLED(c)" "MEETING(m)")))
 org-todo-keyword-faces (quote (("TODO" :foreground "red" :weight bold)
                                ("STARTED" :foreground "dodger blue" :weight bold)
                                ("ONGOING" :foreground "dodger blue" :weight bold)
                                ("DONE" :foreground "forest green" :weight bold)
                                ("WAITING" :foreground "orange" :weight bold)
                                ("HOLD" :foreground "magenta" :weight bold)
                                ("CANCELLED" :foreground "forest green" :weight bold)
                                ("MEETING" :foreground "forest green" :weight bold)))
 org-use-fast-todo-selection t
 org-treat-S-cursor-todo-selection-as-state-change nil
 org-capture-templates (quote (("t" "todo" entry (file "~/org/refile.org")
                                "* TODO %?" :clock-in t :clock-resume t)))
 org-drawers (quote ("PROPERTIES" "LOGBOOK"))
 org-clock-in-resume t
 org-clock-in-switch-to-state 'jcazevedo/clock-in-to-started
 org-clock-into-drawer t
 org-clock-out-remove-zero-time-clocks t
 org-clock-persist t
 org-clock-persist-query-resume nil
 org-clock-auto-clock-resolution (quote when-no-clock-is-running)
 org-clock-report-include-clocking-task t
 org-agenda-clockreport-parameter-plist (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80))
 org-columns-default-format "%40ITEM %TODO %5Effort(Effort){:} %6CLOCKSUM"
 org-clock-out-when-done nil
 org-mobile-directory "~/Dropbox/MobileOrg")

(org-clock-persistence-insinuate)

(provide 'jcazevedo/org)
