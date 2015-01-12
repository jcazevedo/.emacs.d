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
 org-agenda-files (list "~/org")
 org-default-notes-file "~/org/refile.org"
 org-mobile-directory "~/Dropbox/MobileOrg"
 org-use-fast-todo-selection t
 org-log-done 'time)

(provide 'jcazevedo-org)
