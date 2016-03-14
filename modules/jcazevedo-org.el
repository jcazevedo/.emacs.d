(use-package org
  :ensure t
  :bind (("C-c a" . org-agenda)
         ("C-c b" . org-iswitchb))
  :init
  (defun jcazevedo/clock-in-to-started (kw)
    (when (not (and (boundp 'org-capture-mode) org-capture-mode))
      (if (and (member (org-get-todo-state) (list "TODO")))
          "STARTED")))
  (setq org-directory "~/org"
        org-agenda-files (list "~/org")
        org-todo-keywords (quote ((sequence
                                   "TODO(t/!)"
                                   "STARTED(s/!)"
                                   "ONGOING(o)"
                                   "|"
                                   "DONE(d/!)"
                                   "CANCELLED(c/!)"
                                   "MEETING(m)")))
        org-todo-keyword-faces
        (quote (("TODO" :foreground "red" :weight bold)
                ("STARTED" :foreground "dodger blue" :weight bold)
                ("ONGOING" :foreground "dodger blue" :weight bold)
                ("DONE" :foreground "forest green" :weight bold)
                ("CANCELLED" :foreground "forest green" :weight bold)
                ("MEETING" :foreground "forest green" :weight bold)))
        org-use-fast-todo-selection t
        org-treat-S-cursor-todo-selection-as-state-change nil
        org-support-shift-select nil
        org-replace-disputed-keys t
        org-log-done 'time
        org-clock-out-when-done nil
        org-drawers (quote ("PROPERTIES" "LOGBOOK"))
        org-clock-in-resume t
        org-clock-into-drawer t
        org-clock-persist t
        org-clock-persist-query-resume nil
        org-clock-auto-clock-resolution (quote when-no-clock-is-running)
        org-clock-report-include-clocking-task t
        org-agenda-clockreport-parameter-plist
        (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80))
        org-clock-in-switch-to-state 'jcazevedo/clock-in-to-started
        org-agenda-prefix-format (quote ((agenda . " %i %-15:c%?-12t% s")
                                         (timeline . "  % s")
                                         (todo . " %i %-12:c")
                                         (tags . " %i %-12:c")
                                         (search . " %i %-12:c")))
        org-src-fontify-natively t)
  :config
  (org-clock-persistence-insinuate)
  (add-hook 'org-shiftup-final-hook 'windmove-up)
  (add-hook 'org-shiftleft-final-hook 'windmove-left)
  (add-hook 'org-shiftdown-final-hook 'windmove-down)
  (add-hook 'org-shiftright-final-hook 'windmove-right)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (latex . t)))
  (use-package toc-org
    :ensure t
    :config
    (add-hook 'org-mode-hook 'toc-org-enable)))

(provide 'jcazevedo-org)
