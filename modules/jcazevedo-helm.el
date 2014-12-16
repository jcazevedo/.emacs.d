(jcazevedo-require-packages '(helm helm-projectile))

(require 'helm)
(require 'helm-grep)
(require 'helm-files)

(setq helm-command-prefix-key "C-c h")

(require 'helm-config)
(require 'helm-projectile)

(setq helm-quick-update                     t
      helm-split-window-in-side-p           t
      helm-buffers-fuzzy-matching           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-ff-auto-update-initial-value     nil
      helm-ff-file-name-history-use-recentf t)

(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-command-map   (kbd "o")   'helm-occur)
(define-key helm-command-map   (kbd "g")   'helm-do-grep)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

(helm-mode 1)

(provide 'jcazevedo-helm)
